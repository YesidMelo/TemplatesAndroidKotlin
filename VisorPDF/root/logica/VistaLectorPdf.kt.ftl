package ${packageName}.Presentacion.UtilidadesVista.VisorPDF

import android.annotation.SuppressLint
import android.content.Context
import android.util.AttributeSet
import android.view.LayoutInflater
import android.webkit.WebSettings
import android.webkit.WebView
import android.widget.LinearLayout
import ${packageName}.R
import kotlinx.coroutines.GlobalScope
import kotlinx.coroutines.launch

@SuppressLint("SetJavaScriptEnabled")
class VistaLectorPdf @JvmOverloads constructor(
    context: Context, attrs: AttributeSet? = null, defStyleAttr: Int = 0
) : LinearLayout(context, attrs, defStyleAttr) {

    init {
        instancia = this
        LayoutInflater.from(context).inflate(R.layout.view_lector_pdf,this,true)
        buscarElementosDeVista()


    }

    private var lector_pdf : WebView?= null
    private fun buscarElementosDeVista(){

        lector_pdf = findViewById(R.id.lector_pdf)

    }


    companion object{
        private var instancia : VistaLectorPdf?= null

        fun getInstancia() : VistaLectorPdf?
        {
            return instancia
        }
    }

    private var urlConsulta = "https://riptutorial.com/Download/webrtc-es.pdf"
    fun conURLConsulta( urlConsulta : String) : VistaLectorPdf {
        this.urlConsulta = urlConsulta
        return this
    }

    private var escuchadorInicioCarga : (()->Unit)?=null
    private fun conNotificacionInicioDeCarga(escuchadorInicioCarga : (()->Unit)) : VistaLectorPdf{
        this.escuchadorInicioCarga = escuchadorInicioCarga
        return this
    }

    private var escuchadorFinCarga : (()->Unit)?=null
    private fun conNotificacionFinCarga(escuchadorFinCarga : (()->Unit)) : VistaLectorPdf{
        this.escuchadorFinCarga = escuchadorFinCarga
        return this
    }


    fun consultarPdf(){
        GlobalScope.launch {
            post{
                preconfiguracionWbView()
                escuchadorInicioCarga?.invoke()
                lector_pdf?.loadUrl("https://docs.google.com/gview?embedded=true&url="+urlConsulta)
                escuchadorFinCarga?.invoke()
            }
        }
    }

    private fun preconfiguracionWbView(){
        lector_pdf?.settings?.javaScriptEnabled = true
        lector_pdf?.settings?.pluginState = WebSettings.PluginState.ON
    }


}