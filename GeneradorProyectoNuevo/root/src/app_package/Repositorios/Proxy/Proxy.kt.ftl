package ${packageName}.Repositorios.Proxy;

import android.content.Context
import android.util.Log
import ${packageName}.Base.BaseModel
import ${packageName}.Repositorios.Produccion.IProduccionListener
import ${packageName}.Utilidades.Constantes
import com.android.volley.Request
import com.android.volley.RequestQueue
import com.android.volley.Response
import com.android.volley.VolleyError
import com.android.volley.toolbox.JsonArrayRequest
import com.android.volley.toolbox.JsonObjectRequest
import com.android.volley.toolbox.Volley
import com.google.gson.Gson
import com.google.gson.reflect.TypeToken
import org.json.JSONArray
import org.json.JSONObject
import java.lang.reflect.Type

/**
	Para que este proxy funcione correctamente se debe implementar las siguientes librerias en el gradle: 

	implementation 'com.android.volley:volley:1.1.1'
    implementation 'com.google.code.gson:gson:2.8.5'

    en la llave de cierre de dependencies se debe adicionar las siguientes lineas:

    kotlin {
    experimental {
        coroutines "enable"
    }
}
*/


class Proxy(val context: Context) {

    private val requestQueue:RequestQueue

    init {
        requestQueue=Volley.newRequestQueue(context)
    }

    private var objetoAEnviar:Any? =null

    fun <T:BaseModel,K:BaseModel>realizarSolicitud(objeto:T,clase:Class<K>,repositorio: Constantes.Repositorio,produccionListener:IProduccionListener){
        val solicitante:Metodos
        if(repositorio.rest!=null){
            if (!repositorio.rest.esArreglo) {
                solicitante=UnicoObjeto()
            } else {
                solicitante=ArrayObjetos()
            }
            when(repositorio.rest.tipoSolicitudServicio){
                Constantes.TipoSolicitudServicio.GET->  {solicitante.solicitudGet(objeto,clase,repositorio,produccionListener)}
                Constantes.TipoSolicitudServicio.POST-> {solicitante.solicitudPost(objeto,clase,repositorio,produccionListener)}
                Constantes.TipoSolicitudServicio.PUT->  {solicitante.solicitudPut(objeto,clase,repositorio,produccionListener)}
            }
        }
    }

    private interface Metodos{
        fun <T:BaseModel,K:BaseModel> solicitudGet  (objeto:T,clase:Class<K>,repositorio: Constantes.Repositorio,produccionListener:IProduccionListener)
        fun <T:BaseModel,K:BaseModel> solicitudPost (objeto:T,clase:Class<K>,repositorio: Constantes.Repositorio,produccionListener:IProduccionListener)
        fun <T:BaseModel,K:BaseModel> solicitudPut  (objeto:T,clase:Class<K>,repositorio: Constantes.Repositorio,produccionListener:IProduccionListener)
    }

    private inner class UnicoObjeto:Metodos{

        override fun <T : BaseModel, K : BaseModel> solicitudGet(objeto: T, clase: Class<K>, repositorio: Constantes.Repositorio, produccionListener: IProduccionListener) {
            val jsObjectRequest = JsonObjectRequest(
                Request.Method.GET,
                Constantes.Rest.BASE_URl.ruta+repositorio.rest!!.ruta,
                null,
                AccionSolicitud(objeto,clase,produccionListener,repositorio),
                AccionErrorVolley(produccionListener,repositorio)
            )
            requestQueue.add(jsObjectRequest)
        }

        override fun <T : BaseModel, K : BaseModel> solicitudPost(objeto: T, clase: Class<K>, repositorio: Constantes.Repositorio, produccionListener: IProduccionListener) {
            val jsObjectRequest = JsonObjectRequest(
                    Request.Method.POST,
                    Constantes.Rest.BASE_URl.ruta+repositorio.rest!!.ruta,
                    null,
                    AccionSolicitud(objeto,clase,produccionListener,repositorio),
                    AccionErrorVolley(produccionListener,repositorio)
            )
            requestQueue.add(jsObjectRequest)
        }

        override fun <T : BaseModel, K : BaseModel> solicitudPut(objeto: T, clase: Class<K>, repositorio: Constantes.Repositorio, produccionListener: IProduccionListener) {
            val jsObjectRequest = JsonObjectRequest(
                    Request.Method.PUT,
                    Constantes.Rest.BASE_URl.ruta+repositorio.rest!!.ruta,
                    null,
                    AccionSolicitud(objeto,clase,produccionListener,repositorio),
                    AccionErrorVolley(produccionListener,repositorio)
            )
            requestQueue.add(jsObjectRequest)
        }

        inner class AccionSolicitud<T : BaseModel, K : BaseModel>(
                val objeto:T,
                val clase:Class<K>?,
                val produccionListener: IProduccionListener,
                val repositorio: Constantes.Repositorio
        ):Response.Listener<JSONObject>{
            override fun onResponse(response: JSONObject?) {
                val gson= Gson()
                val obj:Any?
                if(clase !=null){
                    obj=gson.fromJson(response!!.toString(),clase)
                }else{
                    obj=gson.fromJson(response!!.toString(),Any::class.java)
                }
                produccionListener.Exito(obj,repositorio)
            }
        }
    }

    private inner class  ArrayObjetos:Metodos{
        override fun <T : BaseModel, K : BaseModel> solicitudGet(objeto: T, clase: Class<K>, repositorio: Constantes.Repositorio, produccionListener: IProduccionListener) {
            val jsObjectRequest = JsonArrayRequest(
                    Request.Method.GET,
                    Constantes.Rest.BASE_URl.ruta+repositorio.rest!!.ruta,
                    null,
                    AccionSolicitud(objeto,clase,repositorio,produccionListener),
                    AccionErrorVolley(produccionListener,repositorio)
            )
            requestQueue.add(jsObjectRequest)
        }

        override fun <T : BaseModel, K : BaseModel> solicitudPost(objeto: T, clase: Class<K>, repositorio: Constantes.Repositorio, produccionListener: IProduccionListener) {
            val jsObjectRequest = JsonArrayRequest(
                    Request.Method.POST,
                    Constantes.Rest.BASE_URl.ruta+repositorio.rest!!.ruta,
                    null,
                    AccionSolicitud(objeto,clase,repositorio,produccionListener),
                    AccionErrorVolley(produccionListener,repositorio)
            )
            requestQueue.add(jsObjectRequest)
        }

        override fun <T : BaseModel, K : BaseModel> solicitudPut(objeto: T, clase: Class<K>, repositorio: Constantes.Repositorio, produccionListener: IProduccionListener) {
            val jsObjectRequest = JsonArrayRequest(
                    Request.Method.PUT,
                    Constantes.Rest.BASE_URl.ruta+repositorio.rest!!.ruta,
                    null,
                    AccionSolicitud(objeto,clase,repositorio,produccionListener),
                    AccionErrorVolley(produccionListener,repositorio)
            )
            requestQueue.add(jsObjectRequest)
        }

        inner class AccionSolicitud<T : BaseModel, K : BaseModel>(
                val objeto:T,
                val clase:Class<K>?,
                val repositorio: Constantes.Repositorio,
                val produccionListener: IProduccionListener
        ):Response.Listener<JSONArray>{

            override fun onResponse(response: JSONArray?) {

//                val casteador = object : TypeToken<List<Any>>() {}.type
//                val listaObjetos = Gson().fromJson<List<Any>>(response!!.toString(), casteador)
                produccionListener.Exito(response!!.toString(),repositorio)
            }
        }
    }

    private inner class AccionErrorVolley(
            val produccionListener: IProduccionListener,
            val repositorio: Constantes.Repositorio
    ):Response.ErrorListener{
        override fun onErrorResponse(error: VolleyError?) {
            Log.e("error",Log.getStackTraceString(error))
            produccionListener.Falla(null,repositorio)
        }

    }
}
