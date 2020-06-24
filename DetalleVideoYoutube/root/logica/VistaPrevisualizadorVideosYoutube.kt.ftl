package ${packageName}.Presentacion.UtilidadesVista.PrevisualizadorVideosYoutube

import android.annotation.SuppressLint
import android.content.Context
import android.util.AttributeSet
import android.util.Log
import android.view.LayoutInflater
import android.view.View
import android.widget.LinearLayout
import android.widget.Toast
import ${packageName}.Presentacion.UtilidadesVista.PrevisualizadorVideosYoutube.utilidades_visualizador_youtube.DetalleVideoYoutube
import ${packageName}.Presentacion.UtilidadesVista.PrevisualizadorVideosYoutube.utilidades_visualizador_youtube.ProxyYoutube
import ${packageName}.R
import com.squareup.picasso.Picasso
import kotlinx.android.synthetic.main.vista_previsualizador_videos_youtube.view.*
import java.net.URL

@SuppressLint("SetTextI18n")
class VistaPrevisualizadorVideosYoutube @JvmOverloads constructor(
    context: Context,
    attrs: AttributeSet? = null,
    defStyle: Int = 0,
    defStyleRes: Int = 0
) : LinearLayout(context, attrs, defStyle, defStyleRes) {

    init {
        LayoutInflater.from(context).inflate(R.layout.vista_previsualizador_videos_youtube,this,true)
        ponerEscuchadores()
    }

    private fun ponerEscuchadores(){
        imagen_video_youtube.setOnClickListener {
            escuchadorSeleccionVideo?.invoke(urlVideoYoutube)
        }
    }

    private var urlVideoYoutube : String = "https://www.youtube.com/watch?v=b7LGlxa5_f8"
    fun conUrlYoutube(urlVideoYoutube : String = "https://www.youtube.com/watch?v=b7LGlxa5_f8") : SolicitanteEscuchadorVista{
        this.urlVideoYoutube = urlVideoYoutube
        return SolicitanteEscuchadorVista()
    }

    private var escuchadorSeleccionVideo : ((String)->Unit) ?= null
    inner class SolicitanteEscuchadorVista{
        fun conEscuchadorVideoSeleccionado(escuchadorSeleccionVideo : ((String)->Unit)) : AccionesVista{
            this@VistaPrevisualizadorVideosYoutube.escuchadorSeleccionVideo = escuchadorSeleccionVideo
            return AccionesVista()
        }
    }

    inner class AccionesVista{
        fun mostrarVista(){
            this@VistaPrevisualizadorVideosYoutube.mostrarVista()
        }

        fun ocultarVista(){
            this@VistaPrevisualizadorVideosYoutube.ocultarVista()
        }
    }

    fun mostrarVista(){
        post {
            visibility = View.VISIBLE
            llenarImagen()
            llamarDetalleVideo()
        }
    }

    private fun llenarImagen(){
        var urlImagen = "http://img.youtube.com/vi/"+filtrarIdVideo()+"/0.jpg"
        Picasso
            .get()
            .load(urlImagen)
            .placeholder(android.R.drawable.ic_delete)
            .into(imagen_video_youtube)
    }

    private fun filtrarIdVideo() : String {
        val query = URL(urlVideoYoutube).query
        val params = query.split("&")
        var id : String = ""
        for(caracter in params){
            var param1 = caracter.split("=")
            if(param1[0].equals("v")){
                id = param1[1]
            }
        }
        return id
    }

    private fun llamarDetalleVideo(){
        ProxyYoutube(context,urlVideoYoutube)
            .conEscuchadorExitoConsulta {
                post {
                    llenarDetalleVideo(it)
                }
            }
            .conEscuchadorFalla {
                post {
                    Toast.makeText(context,"surgio un problema durante la consulta",Toast.LENGTH_LONG).show()
                }
            }
            .iniciarConsulta()
    }


    private fun llenarDetalleVideo(detalle : DetalleVideoYoutube?){
        if (detalle == null ){ return }
        titulo_video.setText(context.getString(R.string.titulo_video)+" : "+detalle.title)
        autor_video_youtube.setText(context.getString(R.string.autor_video)+" : "+detalle.author_name)
    }

    fun ocultarVista(){
        post {
            visibility = View.GONE
        }
    }


}