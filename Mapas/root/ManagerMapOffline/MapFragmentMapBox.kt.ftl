package co.com.exsis.apsoft.Presentation.Dash.Home_Offline.MapOffline.ManagerMapOffline

import android.annotation.SuppressLint
import android.app.Activity
import android.content.Context
import android.graphics.Color
import android.location.Location
import android.os.Bundle
import android.os.Handler
import android.support.annotation.ColorRes
import android.support.annotation.DrawableRes
import android.support.annotation.IdRes
import android.support.v7.app.AppCompatActivity
import android.util.Log
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.Button
import co.com.exsis.apsoft.Presentation.Base.Implementations.BaseFragment
import co.com.exsis.apsoft.R
import com.mapbox.mapboxsdk.Mapbox
import com.mapbox.mapboxsdk.annotations.*
import com.mapbox.mapboxsdk.camera.CameraPosition
import com.mapbox.mapboxsdk.constants.Style
import com.mapbox.mapboxsdk.geometry.LatLng
import com.mapbox.mapboxsdk.maps.MapboxMap
import kotlinx.android.synthetic.main.fragment_map_offline.*
import kotlinx.coroutines.experimental.delay
import kotlinx.coroutines.experimental.launch
import org.jetbrains.annotations.NotNull
import org.jetbrains.annotations.Nullable

/**
 * Class use librarys Mapbox, courutines from kotlin
 */
class MapFragmentMapBox : BaseFragment() {


    companion object {
        private var map: MapFragmentMapBox? = null
        private var mapBox: Mapbox? = null
        fun getNewInstance(): MapFragmentMapBox {
            if (map == null) {
                map = MapFragmentMapBox()
            }
            return map!!
        }
    }

    enum class StyleMap(val style: String) {
        SATELITE(Style.SATELLITE),
        DARK(Style.DARK),
        LIGHT(Style.LIGHT),
        MAPBOX_STREET(Style.MAPBOX_STREETS),
        SATELLITE_STREETS(Style.SATELLITE_STREETS),
        OUTDOORS(Style.OUTDOORS),
    }

    private var mapBoxMap: MapboxMap? = null
    private var location: Location? = null
    private var zoom: Double? = null
    var styleMap: StyleMap = StyleMap.SATELITE
    var enabledLocation: Boolean = false
    private var myView: View? = null
    private var myContext: Context? = null
    private var handler: Handler? = null
    private var myLocation:MarkerOptions ?= null

    /**
     * Esta funcion le indica al activity que debe navegar al mapa con el fin de evitar bugs al momento de navegar
     */
    fun navigateToMap(@NotNull @IdRes idContenedor: Int, @NotNull activity: AppCompatActivity) {
        if (map == null) {
            return
        }
        activity.supportFragmentManager.beginTransaction().replace(idContenedor, map!!).commit()
    }

    override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?): View? {
        super.onCreateView(inflater, container, savedInstanceState)
        if (context != null) {
            myContext = context
        } else {
            myContext = activity
        }
        if (mapBox == null) {
            mapBox = Mapbox.getInstance(this.myContext!!.applicationContext!!, "pk.eyJ1IjoiZXhzaXMiLCJhIjoiY2pvazN0bXM5MGJocjNycGY2MmYwcXVzOSJ9.dY-iQ4LxeURMR0zmLAN2Yw")
        }
        myView = inflater.inflate(R.layout.fragment_map_offline, null, false)
        return myView
    }

    override fun onResume() {
        super.onResume()
        try {
            map_offline?.onResume()
            listeners()
        } catch (e: Exception) {
            Log.e("error", "")
        }
    }

    private fun listeners() {
        map_offline.getMapAsync {
            this@MapFragmentMapBox.mapBoxMap = it
        }
    }

    /**
     * zoom 4 muestra toda colombia
     * zomm 10 muestra toda bogota
     * zoom 15 detalle de cuadras
     */
    fun initialPosition(@NotNull location: Location, @Nullable zoom: Double?, @Nullable @DrawableRes pathIcon: Int? = null) {
        this.location = location
        this.zoom = zoom
        launch {
            while (this@MapFragmentMapBox.mapBoxMap == null) {
                delay(500)
            }
            delay(2000)
            val latLng = LatLng()
            latLng.latitude = location.latitude
            latLng.longitude = location.longitude
            val lmn = CameraPosition.Builder()
            lmn.target(latLng)
            if (zoom != null) {
                lmn.zoom(zoom)
            }
            lmn.tilt(0.toDouble())
            lmn.bearing(0.toDouble())
            map_offline?.onResume()
            if (pathIcon != null) {
                addMarker(location, pathIcon)
            }
            (this@MapFragmentMapBox.myContext as Activity).runOnUiThread {
                try {
                    mapBoxMap?.setStyleUrl(styleMap.style)
                    mapBoxMap?.cameraPosition = lmn.build()
                } catch (e: Exception) {
                    Log.e("Error", Log.getStackTraceString(e))
                }
            }
        }
    }

    fun addMarker(@NotNull location: Location, @NotNull @DrawableRes iconMarker: Int,@NotNull title:String ?=null) {
        launch {
            while (mapBoxMap == null) delay(500)
            val icon = IconFactory.getInstance(this@MapFragmentMapBox.myContext!!).fromResource(iconMarker)
            val mark = MarkerOptions().position(LatLng(location.latitude, location.longitude))
            mark.setIcon(icon)
            if(title != null){
                mark.title(title)
            }
            (this@MapFragmentMapBox.myContext as Activity).runOnUiThread {

                mapBoxMap?.addMarker(mark)
            }
        }
    }

    fun setMyPosition(@NotNull location: Location, @NotNull @DrawableRes pathIconMyPosition : Int,@Nullable title:String?= null)
    {
        launch {
            while (mapBoxMap == null) delay(500)
            val icon = IconFactory.getInstance(this@MapFragmentMapBox.myContext!!).fromResource(pathIconMyPosition)
            if (myLocation == null){
                (this@MapFragmentMapBox.myContext as Activity).runOnUiThread {
                    myLocation = MarkerOptions()
                            .position(LatLng(location.latitude, location.longitude))
                            .title(title)
                            .setIcon(icon)
                    mapBoxMap?.addMarker(myLocation!!)
                }
                return@launch
            }

            var myMark :Marker ? = null
            val ltn= LatLng(location.latitude,location.longitude)
            val myArray=mapBoxMap?.markers
            Log.e("","")
            myArray?.forEach {
                Log.e("Error"," mark:${it.position.longitude} <-:-> ${it.position.latitude}")
                if(locationsIsEquals(it.position,myLocation!!.position)){
                    myMark = it
                }
            }
            (this@MapFragmentMapBox.myContext as Activity).runOnUiThread {
                if (myMark == null){
                    return@runOnUiThread
                }
                mapBoxMap?.markers?.remove(myMark!!)
                mapBoxMap?.removeMarker(myMark!!)
                myLocation = MarkerOptions()
                        .position(ltn)
                        .title(location.toString())
                        .setIcon(icon)
                mapBoxMap?.addMarker(myLocation!!)
            }
        }
    }

    fun capturePosition(@NotNull listenerPosition: (Location?) -> Unit, @Nullable @DrawableRes pathIcon: Int? = null) {
        launch {
            while (mapBoxMap == null) delay(500)
            fun listen(location: Location?) {
                listenerPosition.invoke(location)
                if (pathIcon == null || location == null)
                    return
                addMarker(location, pathIcon)
            }
            mapBoxMap?.addOnMapClickListener(ActionClickMap(::listen))
        }
    }

    @SuppressLint("ResourceType")
    fun putPolygonInMap(
            @NotNull polygon: MutableList<Location>,
            @Nullable @ColorRes pathColorRes: Int? = null,
            @Nullable @ColorRes pathStroke: Int? = null,
            @Nullable tag:String ?= null
    ) {
        launch {
            val poligon = emptyList<LatLng>().toMutableList()
            polygon.forEach {
                val latlong = LatLng(it.latitude, it.longitude)
                poligon.add(latlong)
            }
            while (mapBoxMap == null) delay(500)
            val colorPoligon = if (pathColorRes == null) "#ffffff" else this@MapFragmentMapBox.myContext?.getString(pathColorRes)
            val colorStroke = if (pathStroke == null) "#ffffff" else this@MapFragmentMapBox.myContext?.getString(pathStroke)
            if (this@MapFragmentMapBox.myContext !is Activity) {
                return@launch
            }
            (this@MapFragmentMapBox!!.myContext as Activity).runOnUiThread {
                val myPoligon = PolygonOptions().addAll(poligon).fillColor(Color.parseColor(colorPoligon))
                myPoligon.strokeColor(Color.parseColor(colorStroke))
                mapBoxMap?.addPolygon(myPoligon)
            }
        }
    }

    fun quitPolygonFromMap(@NotNull polygon: MutableList<Location>) {
        launch {
            fun estaPoligonoEnMapa(myPoligon: Polygon, poligon: MutableList<LatLng>): Boolean {
                fun poligonoContieneLatLong(@NotNull poligon: Polygon, latLng: LatLng): Boolean {
                    poligon.points.forEach {
                        if (it.latitude == latLng.latitude && it.longitude == latLng.longitude && it.altitude == latLng.altitude) {
                            return true
                        }
                    }
                    return false
                }
                poligon.forEach {
                    if (!poligonoContieneLatLong(myPoligon, it)) {
                        return false
                    }
                }
                return true
            }

            val poligon = emptyList<LatLng>().toMutableList()
            polygon.forEach {
                val latlong = LatLng(it.latitude, it.longitude)
                poligon.add(latlong)
            }
            while (mapBoxMap == null) delay(500)
            mapBoxMap?.polygons?.forEach {
                if (estaPoligonoEnMapa(it, poligon)) {
                    (this@MapFragmentMapBox.myContext as Activity).runOnUiThread {
                        mapBoxMap?.removePolygon(it)
                    }
                }
            }
        }
    }

    fun createPolygon(
            @NotNull listenPolygono: (MutableList<Location>) -> Unit,
            @NotNull @DrawableRes pathIcon: Int,
            @Nullable @ColorRes pathColor: Int? = null,
            @Nullable @ColorRes pathStroke: Int? = null
    ) {
        val poligon = emptyList<Location>().toMutableList()
        val poligonsInMap = emptyList<LatLng>().toMutableList()
        var colorPoligon: String? = null
        var colorStroke: String? = null

        launch {

            while (mapBoxMap == null) delay(500)
            colorPoligon = if (pathColor == null) "#ffffff" else this@MapFragmentMapBox.myContext?.getString(pathColor!!)
            colorStroke = if (pathStroke == null) "#ffffff" else this@MapFragmentMapBox.myContext?.getString(pathStroke!!)

            (this@MapFragmentMapBox!!.myContext as Activity).runOnUiThread {
                val myPoligon = PolygonOptions().addAll(poligonsInMap).fillColor(Color.parseColor(colorPoligon))
                myPoligon.strokeColor(Color.parseColor(colorStroke))
                mapBoxMap?.addPolygon(myPoligon)
            }
            fun listenLocation(location: Location?) {
                if (location == null) {
                    return
                }
                poligon.add(location)
                addMarker(location, pathIcon)
            }

            fun listenLatLng(latLng: LatLng) {
                poligonsInMap.add(latLng)
            }
            mapBoxMap?.addOnMapClickListener(ActionClickMap(::listenLocation, ::listenLatLng))
        }

        launch {
            while (btn_crear_poligono == null) {
                delay(500)
            }
            btn_crear_poligono.setOnClickListener {
                val pol = PolygonOptions().addAll(poligonsInMap).fillColor(Color.parseColor(colorPoligon))
                pol.strokeColor(Color.parseColor(colorStroke))
                mapBoxMap?.addPolygon(pol)
                listenPolygono.invoke(poligon)
                poligonsInMap.clear()
            }
        }
    }

    private fun locationsIsEquals(location1: LatLng,location2: LatLng):Boolean{
        if(location1.longitude == location2.longitude && location1.latitude == location2.latitude){
           return true
        }
        return false
    }

    //Escuchador para captura de un punto
    private inner class ActionClickMap(
            val listenerPosition: (Location?) -> Unit,
            val listenerLatLng: ((LatLng) -> Unit)? = null
    ) : MapboxMap.OnMapClickListener {
        override fun onMapClick(point: LatLng) {
            val location = Location("")
            location.latitude = point.latitude
            location.longitude = point.longitude
            location.altitude = point.altitude
            if (myContext !is Activity) {
                listenerPosition.invoke(location)
                listenerLatLng?.invoke(point)
                return
            }
            (myContext as Activity).runOnUiThread {
                listenerPosition.invoke(location)
                listenerLatLng?.invoke(point)
            }
        }

    }

    //    No eliminar este codigo apartir de aqui
    override fun onPause() {
        super.onPause()
        try {
            map_offline?.onPause()

        } catch (e: Exception) {
            Log.e("error", "")
        }
    }

    override fun onStop() {
        super.onStop()
        try {
            map_offline?.onStop()
        } catch (e: Exception) {
            Log.e("error", "")
        }
    }

    override fun onSaveInstanceState(save: Bundle) {
        super.onSaveInstanceState(save)
        try {
            map_offline?.onSaveInstanceState(save)
        } catch (e: Exception) {
            Log.e("error", "")
        }
    }

    override fun onLowMemory() {
        super.onLowMemory()
        try {
            map_offline?.onLowMemory()
        } catch (e: Exception) {
            Log.e("error", "")
        }
    }

    override fun onDestroyView() {
        super.onDestroyView()

        try {
            map_offline?.onDestroy()
        } catch (e: Exception) {
            Log.e("error", "")
        }
    }

    override fun onDestroy() {
        super.onDestroy()

        try {
            map_offline?.onDestroy()
        } catch (e: Exception) {
            Log.e("error", "")
        }
    }
}