<#if Ingles == false>
package ${packageName}.Mapfragment

<#elseif Ingles == true>
package ${packageName}.Mapfragment
    <#if TipoMapa == "google_maps">
    import ${packageName}.Maps.MapFragmentGoogleMaps
    <#elseif TipoMapa = "MapBox">
import ${packageName}.Maps.MapFragmentGoogleMaps
    <#elseif TipoMapa = "Ambos">
import ${packageName}.Maps.MapFragmentGoogleMaps
import ${packageName}.Maps.MapFragmentMapBox
    </#if>

</#if>

import android.location.Location
import android.os.Bundle
import android.util.Log
import ${applicationPackage}.R
import android.support.v7.app.AppCompatActivity

<#if TipoMapa = "MapBox">
import com.mapbox.mapboxsdk.Mapbox
</#if>

import kotlinx.coroutines.experimental.delay
import kotlinx.coroutines.experimental.launch


/*
    Para que esta plantilla funcione es necesario que se integre las siguientes librerias en el gradle

    implementation "com.android.support:appcompat-v7:28.0.0"
    <#if TipoMapa == "google_maps">
    https://developers.google.com/maps/documentation/android-sdk/start

    <#elseif TipoMapa == "MapBox">
    implementation 'com.mapbox.mapboxsdk:mapbox-android-sdk:6.6.0'
    <#elseif TipoMapa == "Ambos">
    implementation 'com.mapbox.mapboxsdk:mapbox-android-sdk:6.6.0'
    https://www.mapbox.com/help/define-android-sdk/
    https://developers.google.com/maps/documentation/android-sdk/start
    </#if>

*/
class MapaOffline : AppCompatActivity() {

    private enum class PositionsDefault(val Name:String,val Lng:Double,val lat:Double){
        BOGOTA("Bogota",-74.0847373,4.68387645),
        BOGOTA1("Bogota",-74.07581091,4.67536477),
        BOGOTA2("Bogota",-74.08409357,4.66835004),
        BOGOTA3("Bogota",-74.09585238,4.67540754),
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_mapa_offline)

    }

    override fun onResume() {
        super.onResume()
        startFragment()
    }

    /**
    Codigo ejemplo
     * zoom 4 muestra toda colombia
     * zomm 10 muestra toda bogota
     * zoom 15 detalle de cuadras
     */
    private fun startFragment(){
    <#if TipoMapa == "MapBox">
        Mapbox.getInstance(this.applicationContext!!, "pk.eyJ1IjoiZXhzaXMiLCJhIjoiY2pvazN0bXM5MGJocjNycGY2MmYwcXVzOSJ9.dY-iQ4LxeURMR0zmLAN2Yw")
        MapFragmentMapBox.getNewInstance()
    <#elseif TipoMapa == "google_maps"    
        val fr= MapFragmentGoogleMaps.getNewInstance()
    </#if>      
      
        fr.navigateToMap(R.id.fr_contaniner_fragment_offline,this)

        val location = Location("")
        location.latitude = PositionsDefault.BOGOTA.lat
        location.longitude = PositionsDefault.BOGOTA.Lng
        fr.initialPosition(location,15.toDouble())

        val location1 = Location("")
        location1.latitude = PositionsDefault.BOGOTA1.lat
        location1.longitude = PositionsDefault.BOGOTA1.Lng
//        fr.addMarker(location1,android.R.drawable.ic_delete)

        val location2 = Location("")
        location2.latitude = PositionsDefault.BOGOTA2.lat
        location2.longitude = PositionsDefault.BOGOTA2.Lng

        val location3 = Location("")
        location3.latitude = PositionsDefault.BOGOTA3.lat
        location3.longitude = PositionsDefault.BOGOTA3.Lng
//        fr.addMarker(location2,android.R.drawable.ic_delete)

//        fun listener(location: Location?){
//            Log.e("","")
//        }
//        fr.capturePosition (::listener,android.R.drawable.ic_delete)
        val list= emptyList<Location>().toMutableList()
        list.add(location)
        list.add(location1)
        list.add(location2)
        list.add(location3)
//        launch {
//            fr.putPolygonInMap(list,R.color.green_transparent)
//            delay(10000)
//            fr.quitPolygonFromMap(list)
//        }
        fun listenPoligon(poligon:MutableList<Location>) {

        }
//        fr.createPolygon(::listenPoligon,android.R.drawable.ic_delete,pathColor = R.color.transparent_black)
//        navigateBetweenFragments(R.id.fr_contaniner_fragment_offline,null,fr,false)

        launch {
            for (cont in 0..5) {
                delay(10000)
                fr.setMyPosition(location,android.R.drawable.ic_delete)
                delay(10000)
                fr.setMyPosition(location1,android.R.drawable.ic_delete)
                delay(10000)
                fr.setMyPosition(location2,android.R.drawable.ic_delete)
                delay(10000)
                fr.setMyPosition(location3,android.R.drawable.ic_delete)
            }
        }

    }

}
