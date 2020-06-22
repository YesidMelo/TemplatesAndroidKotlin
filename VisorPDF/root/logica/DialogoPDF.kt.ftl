package ${packageName}.Presentacion.Dialogos

import android.graphics.Color
import android.graphics.drawable.ColorDrawable
import android.os.Bundle
import android.util.Log
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.view.WindowManager
import android.widget.Button
import androidx.constraintlayout.widget.Guideline
import androidx.fragment.app.DialogFragment
import androidx.fragment.app.FragmentManager
import ${packageName}.Presentacion.UtilidadesVista.VisorPDF.VistaLectorPdf
import ${packageName}.R

class DialogoPDF private constructor(): DialogFragment() {


    private var contenedorPrincipal : View?= null
    override fun onCreateView(
        inflater: LayoutInflater,
        container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        dialog?.window?.setBackgroundDrawable(ColorDrawable(Color.TRANSPARENT))
        contenedorPrincipal = inflater.inflate(R.layout.dialogo_lector_pdf,null,false)
        isCancelable = false

        buscaElementosDeVista()
        conEscuchadores()
        llenarPDF()
        mostrarPDF()
        verificarBotonesAMostrar()

        return contenedorPrincipal
    }

    private var boton_aceptar : Button?= null
    private var boton_cancelar : Button?= null
    private var vistaLectorPdf : VistaLectorPdf?= null
    private var guideline : Guideline?= null
    private fun buscaElementosDeVista(){
        boton_aceptar = contenedorPrincipal?.findViewById(R.id.boton_aceptar )
        boton_cancelar = contenedorPrincipal?.findViewById(R.id.boton_cancelar )
        vistaLectorPdf = contenedorPrincipal?.findViewById(R.id.vistaLectorPdf )
        guideline = contenedorPrincipal?.findViewById(R.id.guideline )
    }

    private fun conEscuchadores(){
        boton_aceptar?.setOnClickListener {
            dismiss()
            escuchadorAceptar?.invoke()
        }
        boton_cancelar?.setOnClickListener {
            dismiss()
            escuchadorCancelar?.invoke()
        }
    }

    private fun llenarPDF(){
        if(URL == null ){
            return
        }
        vistaLectorPdf?.conURLConsulta(URL!!)
    }

    private fun mostrarPDF(){
        vistaLectorPdf?.consultarPdf()
    }

    private fun verificarBotonesAMostrar(){
        if(creaNuevoPerfil){ return }
        boton_cancelar?.visibility = View.GONE
        guideline?.setGuidelinePercent(1f)
    }

    override fun onStart() {
        super.onStart()
        dialog?.window?.setLayout(WindowManager.LayoutParams.MATCH_PARENT, WindowManager.LayoutParams.WRAP_CONTENT)
    }

    override fun show(manager: FragmentManager, tag: String?) {
        try {
            if (estoyVisible) return
            if (isAdded) return
            estoyVisible = true
            super.show(manager, tag)
        } catch (e: Exception) {
            Log.e("DialogoPDF","",e)
        }
    }



    override fun dismiss() {
        estoyVisible = false
        if(fragmentManager == null ){
            return
        }
        super.dismiss()
    }

    companion object{
        private var estoyVisible = false
        private var instancia : DialogoPDF ?= null

        fun conInstancia () : DialogoPDF{
            if(instancia == null ){
                instancia = DialogoPDF()
            }
            return instancia!!
        }
    }

    private var URL :String ?= null
    fun conURL(URL :String?) : DialogoPDF{
        this.URL  = URL
        return this
    }

    private var escuchadorAceptar : (()->Unit) ?= null
    fun conEscuchadorAceptar(escuchadorAceptar : (()->Unit)) : DialogoPDF{
        this.escuchadorAceptar = escuchadorAceptar

        return this
    }

    private var escuchadorCancelar : (()->Unit) ?= null
    fun conEscuchadorCancelar(escuchadorCancelar : (()->Unit)) : DialogoPDF{
        this.escuchadorCancelar = escuchadorCancelar

        return this
    }

    private var creaNuevoPerfil = false
    fun creaNuevoUsuario(creaNuevoPerfil : Boolean = false)  : DialogoPDF{
        this.creaNuevoPerfil = creaNuevoPerfil
        return this
    }

    fun mostrarDialogo(fragmentManager :FragmentManager, etiqueta : String){
        conInstancia()
            .show(fragmentManager,etiqueta)
    }
}
