package ${packageName}.Presentacion.UtilidadesVista.PrevisualizadorVideosYoutube.utilidades_visualizador_youtube

import android.content.Context
import com.android.volley.Request
import com.android.volley.Response
import com.android.volley.VolleyError
import com.android.volley.toolbox.StringRequest
import com.android.volley.toolbox.Volley
import com.google.gson.Gson

class ProxyYoutube(private val context: Context,private val urlVideoYoutube : String) {

    private val urlConsultaDetalleVideoYoutube =  "http://www.youtube.com/oembed?url="+urlVideoYoutube+"&format=json"

    private var escuchadorExito : ((DetalleVideoYoutube?)->Unit) ?= null
    fun conEscuchadorExitoConsulta(escuchadorExito : ((DetalleVideoYoutube?)->Unit)) : SolicitanteEscuchadorFalla {
        this.escuchadorExito = escuchadorExito
        return SolicitanteEscuchadorFalla()
    }

    private var escuchadorFalla : ((VolleyError?) -> Unit) ?= null
    inner class SolicitanteEscuchadorFalla {
        fun conEscuchadorFalla(escuchadorFalla : ((VolleyError?) -> Unit)) : SolicitantenIniciarConsulta{
            this@ProxyYoutube.escuchadorFalla = escuchadorFalla
            return SolicitantenIniciarConsulta()
        }
    }

    inner class SolicitantenIniciarConsulta{
        fun iniciarConsulta(){
            this@ProxyYoutube.iniciarConsulta()
        }
    }

    private fun iniciarConsulta(){
        Thread{
            val queue = Volley.newRequestQueue(context)
            val stringRes = StringRequest(
                Request.Method.GET,
                urlConsultaDetalleVideoYoutube,
                object : Response.Listener<String>{
                    override fun onResponse(response: String?) {
                        val detalleVideo = Gson().fromJson(response,DetalleVideoYoutube::class.java)
                        escuchadorExito?.invoke(detalleVideo)
                    }
                },
                object : Response.ErrorListener{
                    override fun onErrorResponse(error: VolleyError?) {
                        escuchadorFalla?.invoke(error)
                    }

                }
            )
            queue.add(stringRes)
        }.start()
    }

}