package ${packageName}.Componentes.Dialogos;

import android.annotation.SuppressLint
import android.app.DialogFragment
import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.Button
import android.widget.ImageView
import android.widget.TextView

import ${packageName}.R
import ${packageName}.Utilidades.Constantes

/**
 * Created by Yesid on 26/08/2017.
 */
class Dialogo() : DialogFragment() 
{

    private var tipoDialogo: Constantes.TipoDialogo? = null
    private var tituloTexto: String? = null
    private var mensajeTexto: String? = null
    private var botonAceptar: String? = null
    private var botonCancelar: String? = null
    private var etiquetasDialogo: Constantes.EtiquetasDialogo? = null
    private var escuchadorDialogo: EscuchadorDialogo? = null

    @SuppressLint("ValidFragment")
    constructor(
            titulo: String?,
            mensaje: String,
            botonAceptar: String?,
            botonCancelar: String?,
            etiquetasDialogo: Constantes.EtiquetasDialogo,
            escuchadorDialogo: EscuchadorDialogo
    ) : this() {
        this.escuchadorDialogo = escuchadorDialogo
        this.tipoDialogo = tipoDialogo
        this.tituloTexto = titulo
        this.mensajeTexto = mensaje
        this.botonAceptar = botonAceptar
        this.botonCancelar = botonCancelar
        this.etiquetasDialogo = etiquetasDialogo
    }


    private var vistaDialogo: View? = null

    //    Titulo
    private var titulo: TextView? = null
    private var icono_titulo: ImageView? = null

    //    Mensaje
    private var mensaje: TextView? = null

    //    botones
    private var aceptar: Button? = null
    private var cancelar: Button? = null

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        /* este estilo se debe pegar en stiles.xml
        <style name="Dialogo" parent="Theme.AppCompat.Light.Dialog.Alert">
        <!--<item name="android:windowFrame">@null</item>-->
        <item name="android:windowBackground">@android:color/transparent</item>
        <!--<item name="android:windowIsFloating">true</item>-->
        <!--<item name="android:windowContentOverlay">@null</item>-->
        <!--<item name="android:windowTitleStyle">@null</item>-->
        <!--<item name="android:windowAnimationStyle">@android:style/Animation.Dialog</item>-->
        <!--<item name="android:windowSoftInputMode">stateUnspecified|adjustPan</item>-->
        <!--<item name="android:backgroundDimEnabled">false</item>-->
        <!--<item name="android:background">@android:color/holo_green_dark</item>-->
    </style>
        */
        //setStyle(DialogFragment.STYLE_NORMAL, R.style.Dialogo)
    }

    override fun onCreateView(inflater: LayoutInflater?, container: ViewGroup?, savedInstanceState: Bundle?): View {
        creaElementosVista(inflater)
        creaEscuchadoresVista()
        logicaVista()
        return vistaDialogo!!
    }

    private fun creaElementosVista(inflater: LayoutInflater?) {
        vistaDialogo = inflater!!.inflate(R.layout.dialogo_alerta, null)
        titulo = vistaDialogo!!.findViewById(R.id.titulo)
        icono_titulo = vistaDialogo!!.findViewById(R.id.icono_titulo)
        mensaje = vistaDialogo!!.findViewById(R.id.mensaje)
        aceptar = vistaDialogo!!.findViewById(R.id.boton_aceptar)
        cancelar = vistaDialogo!!.findViewById(R.id.boton_cancelar)

    }

    private fun creaEscuchadoresVista() {
        aceptar!!.setOnClickListener {
                    escuchadorDialogo!!.respuestaAfirmativa(etiquetasDialogo!!)
                    dismiss()
                }
        
        cancelar!!.setOnClickListener{
                    escuchadorDialogo!!.respuestaNegativa(etiquetasDialogo!!)
                    dismiss()
                }
        
    }

    private fun logicaVista() {
        if (tituloTexto != null) {
            titulo!!.text = tituloTexto
        }
        mensaje!!.text = mensajeTexto

        when (tipoDialogo) {
            Constantes.TipoDialogo.INFORMACION,
            Constantes.TipoDialogo.ERROR,
            Constantes.TipoDialogo.NOTIFICACION,
            Constantes.TipoDialogo.ALERTA
            -> {
                icono_titulo!!.setImageDrawable(resources.getDrawable(android.R.drawable.ic_delete))
            }
            Constantes.TipoDialogo.VERIFICACION
            -> {
                icono_titulo!!.setImageDrawable(resources.getDrawable(android.R.drawable.alert_dark_frame))
            }
        }
        if (botonCancelar == null) {
            cancelar!!.visibility = View.GONE
        } else {
            cancelar!!.text = botonCancelar
        }

    }

    interface EscuchadorDialogo {
        fun respuestaAfirmativa(etiquetasDialogo: Constantes.EtiquetasDialogo)
        fun respuestaNegativa(etiquetasDialogo: Constantes.EtiquetasDialogo)
    }
}