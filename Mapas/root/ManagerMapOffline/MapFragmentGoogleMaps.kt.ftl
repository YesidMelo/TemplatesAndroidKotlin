package co.com.exsis.apsoft.Presentation.Dash.Home_Offline.MapOffline.ManagerMapOffline

import android.annotation.SuppressLint
import android.app.Activity
import android.content.Context
import android.graphics.Color
import android.location.Location
import android.os.Bundle
import android.support.annotation.ColorRes
import android.support.annotation.DrawableRes
import android.support.annotation.IdRes
import android.support.v4.app.Fragment
import android.support.v7.app.AppCompatActivity
import android.util.Log
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.Button
import co.com.exsis.apsoft.R
import com.google.android.gms.maps.CameraUpdateFactory
import com.google.android.gms.maps.GoogleMap
import com.google.android.gms.maps.SupportMapFragment
import com.google.android.gms.maps.model.*
import kotlinx.android.synthetic.main.fragment_map_offline.*
import kotlinx.coroutines.experimental.delay
import kotlinx.coroutines.experimental.launch
import org.jetbrains.annotations.NotNull
import org.jetbrains.annotations.Nullable

class MapFragmentGoogleMaps:Fragment(){


    companion object {
        private var map: MapFragmentGoogleMaps? = null
        fun getNewInstance(style:StyleMap = StyleMap.MAP_TYPE_TERRAIN): MapFragmentGoogleMaps {
            if (map == null) {
                map = MapFragmentGoogleMaps()
                map?.styleMap = style
            }
            return map!!
        }
    }



    enum class StyleMap(val style: Int) {
        SATELITE(GoogleMap.MAP_TYPE_SATELLITE),
        MAP_TYPE_HYBRID(GoogleMap.MAP_TYPE_HYBRID),
        MAP_TYPE_NONE(GoogleMap.MAP_TYPE_NONE),
        MAP_TYPE_TERRAIN(GoogleMap.MAP_TYPE_TERRAIN),
    }

    private var mapFragment:SupportMapFragment ?= null

    private var location: Location? = null
    private var zoom: Double? = null
    var styleMap: StyleMap = StyleMap.SATELITE
    var enabledLocation: Boolean = false
    private var myView: View? = null
    private var myContext: Context? = null
    private var myMapGoogle : GoogleMap ?= null
    private var myPosition :Marker ?= null

    private var listPolygons :MutableList<Polygon> = emptyList<Polygon>().toMutableList()

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
        myView = inflater.inflate(R.layout.fragment_map_offline, null, false)

        return myView
    }

    override fun onResume() {
        super.onResume()
        logic()
    }

    private fun logic(){
        if(mapFragment == null){
            mapFragment = SupportMapFragment.newInstance()
            mapFragment!!.getMapAsync{
                myMapGoogle = it
            }
        }

        childFragmentManager.beginTransaction().replace(R.id.map_google,mapFragment!!).commit()
        launch {
            while (myMapGoogle == null) delay(500)

            (myContext as Activity).runOnUiThread {
                myMapGoogle?.mapType = styleMap.style!!
            }
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
            while (myMapGoogle == null) delay( 500)

            val newPosition = LatLng(location.latitude,location.longitude)
            val cam = CameraPosition.builder().target(newPosition)
            if ( zoom != null){
                cam.zoom(zoom.toFloat())
            }
            if(pathIcon != null){
               addMarker(location,pathIcon)
            }
            (myContext as Activity).runOnUiThread {
                myMapGoogle?.moveCamera(CameraUpdateFactory.newCameraPosition(cam.build()))
            }
        }
    }

    fun addMarker(@NotNull location: Location, @NotNull @DrawableRes iconMarker: Int,@Nullable title:String ?= null) {
        launch {
            while (myMapGoogle == null) delay(500)
            val ltlon = LatLng(location.latitude, location.longitude)
            val markerOptions = MarkerOptions().position(ltlon)
            if(title != null){
                markerOptions.title(title)
            }
            markerOptions.icon(BitmapDescriptorFactory.fromResource(iconMarker))
            (myContext as Activity).runOnUiThread {
                myMapGoogle?.addMarker(markerOptions)
            }
        }
    }

    fun setMyPosition(@NotNull location: Location, @NotNull @DrawableRes pathIconMyPosition : Int)
    {
        launch {
            while (myMapGoogle ==  null) {delay(500)}
            val myPos = LatLng(location.latitude,location.longitude)
            if (myPosition == null){
                val createMark = MarkerOptions()
                        .position(myPos)
                        .icon(BitmapDescriptorFactory.fromResource(pathIconMyPosition))
                (myContext as Activity).runOnUiThread {

                    myPosition = myMapGoogle?.addMarker(createMark)
                }
                return@launch
            }

            val newMark = MarkerOptions()
                    .position(myPos)
                    .icon(BitmapDescriptorFactory.fromResource(pathIconMyPosition))
            (myContext as Activity).runOnUiThread {
                myPosition!!.remove()
                myPosition= myMapGoogle?.addMarker(newMark)
            }
        }
    }

    fun capturePosition(@NotNull listenerPosition: (Location?) -> Unit, @Nullable @DrawableRes pathIcon: Int? = null) {
        launch {
            while (myMapGoogle == null) delay(500)
            fun listen(latLng: LatLng?){
                if(latLng ==  null){
                    return
                }
                val location =Location("")
                location.latitude =latLng.latitude
                location.longitude =latLng.longitude
                if (pathIcon!= null) {
                    addMarker(location,pathIcon)
                }
                listenerPosition.invoke(location)
            }
            (myContext as Activity).runOnUiThread {
                myMapGoogle?.setOnMapClickListener(ActionClickMap(::listen))
            }
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
            while(myMapGoogle == null){delay(500)}
            val coordenates = emptyList<LatLng>().toMutableList()
            polygon.forEach {
                val latLng = LatLng(it.latitude,it.longitude)
                coordenates.add(latLng)
            }
            val colorPoligono = if(pathColorRes == null) "#ffffff" else this@MapFragmentGoogleMaps.myContext?.getString(pathColorRes)
            val colorStrocke = if(pathStroke == null) "#ffffff" else this@MapFragmentGoogleMaps.myContext?.getString(pathStroke)

            if (this@MapFragmentGoogleMaps.myContext !is Activity) return@launch

            (this@MapFragmentGoogleMaps.myContext as Activity).runOnUiThread{
                val polOp = PolygonOptions().clickable(true)
                polOp.addAll(coordenates)
                polOp.fillColor(Color.parseColor(colorPoligono))
                polOp.strokeColor(Color.parseColor(colorStrocke))
                val pol = myMapGoogle?.addPolygon(polOp)
                pol?.tag = tag
                listPolygons.add(pol!!)
            }
        }
    }

    fun quitPolygonFromMap(@NotNull polygon: MutableList<Location>) {
        launch {
            while (myMapGoogle == null) delay(500)
            val listLatlng = emptyList<LatLng>().toMutableList()
            polygon.forEach {
                val lt=LatLng(it.latitude,it.longitude)
                listLatlng.add(lt)
            }
            fun estaPoligonoEnMapa (miPoligono : Polygon,poligonEvaluate:MutableList<LatLng>):Boolean{
                fun poligonoContieneLatLong(poligono:Polygon,latLng: LatLng):Boolean{
                    poligono.points.forEach {
                        Log.e("Error","poligono contiene lat long : it: ${it.latitude} == ${latLng.latitude}\n ${it.longitude} == ${latLng.longitude} \n ${it.latitude == latLng.latitude && it.longitude == latLng.longitude} ")
                        if(it.latitude == latLng.latitude && it.longitude == latLng.longitude){
                            return true
                        }
                    }
                    return false
                }
                poligonEvaluate.forEach {
                    if (!poligonoContieneLatLong(miPoligono,it)){
                        return false
                    }
                }
                return true
            }

            (myContext as Activity).runOnUiThread {
                listPolygons.forEach {
                    if (estaPoligonoEnMapa(it,listLatlng)){
                        it.remove()
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

        myView?.findViewById<Button>(R.id.btn_crear_poligono)?.setOnClickListener {}
        launch {
            while (myMapGoogle == null) delay(500)
            colorPoligon = if(pathColor == null) "#ffffff" else this@MapFragmentGoogleMaps.myContext?.getString(pathColor!!)
            colorStroke = if(pathStroke == null) "#ffffff" else this@MapFragmentGoogleMaps.myContext?.getString(pathStroke!!)

            fun listenLocation(location: Location?){
                if (location == null )return
                poligon.add(location)
                addMarker(location,pathIcon)
            }
            fun listenLatLong(latLng: LatLng?){
                if (latLng == null) return
                poligonsInMap.add(latLng)
            }

            (myContext as Activity).runOnUiThread {
                myMapGoogle?.setOnMapClickListener(ActionClickMap (::listenLatLong,::listenLocation))
            }
        }
        launch {
            while (myMapGoogle == null) delay(500)
            while (btn_crear_poligono == null) delay(500)

            btn_crear_poligono.setOnClickListener {
                (myContext as Activity).runOnUiThread {
                    if(poligonsInMap.isEmpty()){
                        return@runOnUiThread
                    }
                    val myPolOP =PolygonOptions().addAll(poligonsInMap)
                    myPolOP.strokeColor(Color.parseColor(colorStroke))
                    myPolOP.fillColor(Color.parseColor(colorPoligon))
                    val myPol=myMapGoogle?.addPolygon(myPolOP)
                    listPolygons.add(myPol!!)
                    poligonsInMap.clear()
                }
            }

        }

    }

    private fun locationsIsEquals(location1: LatLng, location2: LatLng):Boolean{
        if(location1.longitude == location2.longitude && location1.latitude == location2.latitude){
            return true
        }
        return false
    }

    override fun onDestroyView() {
        super.onDestroyView()
        map = null
    }

    private inner class ActionClickMap(
            val listenLatlong: (LatLng?)->Unit,
            val listenLocation:((Location?)->Unit)?= null
    ):GoogleMap.OnMapClickListener{
        override fun onMapClick(p0: LatLng?) {
            if(p0 == null){
                listenLocation?.invoke(null)
                listenLatlong.invoke(null)
                return
            }

            val location= Location("")
            location.latitude = p0.latitude
            location.longitude =p0.longitude
            if(myContext !is Activity){
                listenLocation?.invoke(location)
                listenLatlong.invoke(p0)
                return
            }
            (myContext as Activity).runOnUiThread {
                listenLocation?.invoke(location)
                listenLatlong.invoke(p0)
            }
        }

    }
}