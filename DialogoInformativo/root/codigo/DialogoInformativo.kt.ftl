package ${applicationPackage}.Componentes.Dialogos;

import android.annotation.SuppressLint
import android.app.DialogFragment
import android.os.Bundle
import android.support.annotation.ColorRes
import android.support.annotation.DrawableRes
import android.support.annotation.StringRes
import android.support.v7.app.AppCompatActivity
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup


import ${applicationPackage}.R
import kotlinx.android.synthetic.main.dialogo_alerta.*
import org.jetbrains.annotations.NotNull


@Suppress("DEPRECATION")
/**
 * Created by Yesid on 26/08/2017.
 */
class DialogoInformativo() : DialogFragment() {

    private var configuracionDeDialogo : ConfiguracionDialogo? = null

    @SuppressLint("ValidFragment")
    constructor(@NotNull configuracionDialogo : ConfiguracionDialogo) : this() {
        this.configuracionDeDialogo = configuracionDialogo
    }


    private var vistaDialogo: View? = null

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setStyle(DialogFragment.STYLE_NORMAL, R.style.Dialogo)
        isCancelable = false
    }

    override fun onCreateView(inflater: LayoutInflater?, container: ViewGroup?, savedInstanceState: Bundle?): View {
        vistaDialogo = inflater!!.inflate(R.layout.dialogo_alerta, null)
        return vistaDialogo!!
    }

    override fun onResume() {
        super.onResume()
        creaEscuchadoresVista()
        logicaVista()
    }



    private fun creaEscuchadoresVista() {
        boton_aceptar!!.setOnClickListener {ejecutarAccionAceptar()}
        boton_cancelar!!.setOnClickListener { ejecutarAccionCancelar() }
    }

    private fun ejecutarAccionAceptar(){
        dismiss()
        if (!puedoEjecutarAccionAceptar()) { return}
        configuracionDeDialogo!!.accionAceptar!!()
    }

    private  fun puedoEjecutarAccionAceptar() : Boolean{
        return configuracionDeDialogo != null && configuracionDeDialogo!!.accionAceptar != null
    }

    private  fun ejecutarAccionCancelar(){
        dismiss()
        if(!puedoEjecutarAccionCancelar()){ return }
        configuracionDeDialogo!!.accionCancelar!!()
    }

    private fun puedoEjecutarAccionCancelar() : Boolean{
        return configuracionDeDialogo != null && configuracionDeDialogo!!.accionCancelar != null
    }

    private fun logicaVista() {
        llenaCamposDialogo()
        ponerEstiloDialogo()

    }

    private fun llenaCamposDialogo(){
        if (!puedoLlenarDialogo()) { return }
        llenarTitulo()
        llenarMensaje()
        llenarBotonAceptar()
        llenarBotonCancelar()
    }

    private fun puedoLlenarDialogo() : Boolean{
        return this.configuracionDeDialogo != null && this.configuracionDeDialogo!!.baseActivity != null
    }

    private fun llenarTitulo(){
        if (!puedoLlenarTitulo()){ return }
        titulo!!.text = retornarTextoDeRuta(configuracionDeDialogo!!.tituloTexto!!)
    }

    private fun puedoLlenarTitulo() : Boolean {
        return  this.configuracionDeDialogo!!.tituloTexto != null
    }

    private fun retornarTextoDeRuta(@StringRes rutaString : Int): String{
        return this.configuracionDeDialogo!!.baseActivity!!.getString(rutaString)
    }

    private fun llenarMensaje(){
        if (!puedoLlenarMensaje()) { return }
        this.mensaje!!.text = retornarTextoDeRuta(configuracionDeDialogo!!.mensajeTexto!!)
    }

    private fun puedoLlenarMensaje() : Boolean{
        return this.configuracionDeDialogo!!.mensajeTexto != null
    }

    private fun llenarBotonAceptar(){
        if (!puedoLlenarBotonAceptar()){ return }
        boton_aceptar!!.text = retornarTextoDeRuta(configuracionDeDialogo!!.botonAceptar!!)
    }

    private fun puedoLlenarBotonAceptar() : Boolean{
        return configuracionDeDialogo!!.botonAceptar != null
    }

    private fun llenarBotonCancelar(){
        if(!puedoLlenarBotonCancelar()) { return }
        boton_cancelar!!.text = retornarTextoDeRuta(configuracionDeDialogo!!.botonCancelar!!)
    }

    private fun puedoLlenarBotonCancelar() : Boolean{
        return configuracionDeDialogo!!.botonCancelar != null
    }

    private fun ponerEstiloDialogo(){
        if (!puedoLlenarDialogo()) { return }
        estiloTituloAlerta()
    }

    private fun estiloTituloAlerta(){

    }

    fun mostrarDialogo(){
        if(!puedoLlenarDialogo()){ return }
        show(configuracionDeDialogo!!.baseActivity!!.fragmentManager,retornarEtiquetaDialogo())
    }

    private fun retornarEtiquetaDialogo() : String{
        if (!puedoRetornarEtiquetaDialogo()){return ""}
        return configuracionDeDialogo!!.tipoDialogo!!.getEtiqueta()!!.etiqueta
    }

    private fun puedoRetornarEtiquetaDialogo() : Boolean{
        return configuracionDeDialogo!!.tipoDialogo != null && configuracionDeDialogo!!.tipoDialogo!!.getEtiqueta() != null
    }


    class ConfiguracionDialogo{
        var tipoDialogo: TipoDialogo? = null
        @StringRes var tituloTexto: Int? = null
        @StringRes var mensajeTexto: Int? = null
        @StringRes var botonAceptar: Int? = null
        @StringRes var botonCancelar: Int? = null

        var baseActivity: AppCompatActivity? = null
        var accionAceptar : (()->Unit)? =  null
        var accionCancelar : (()->Unit)? = null
    }

    class Estilo{
        @ColorRes var ColorIconoVector :Int ?= null
        @ColorRes var ColorLetraTituloAlerta : Int ?= null
        @ColorRes var ColorLetraMensajeAlerta : Int ?= null
        @ColorRes var ColorLetraBoton : Int ?= null

        @ColorRes var ColorFondoTitulo : Int ?= null
        @ColorRes var ColorFondoMensaje : Int ?= null
        @ColorRes var ColorFondoBoton : Int ?= null

        @DrawableRes var IconoAlerta : Int ?= null
    }

    enum class TipoDialogo{
        INFORMACION,
        ERROR,
        NOTIFICACION,
        ALERTA,
        VERIFICACION,
        ;
        private var estilo : Estilo? = null
        private var etiqueta : Etiqueta ?= null

        fun estiloPersonalizado(@NotNull estilo : Estilo){
            this.estilo = estilo
        }

        fun getEstilo():Estilo{
            if (!puedoRetornarElEstiloDelDialogo()){
              return generarEstiloPorDefecto()
            }
            return estilo!!
        }

        private fun puedoRetornarElEstiloDelDialogo() :Boolean{
            return estilo != null
        }

        private fun generarEstiloPorDefecto() : Estilo{
            val estilo = DialogoInformativo.Estilo()
            estilo.ColorLetraTituloAlerta = R.color.colorAccent
            estilo.ColorFondoTitulo = R.color.colorPrimaryDark
            estilo.ColorFondoMensaje = R.color.colorAccent
            estilo.ColorLetraMensajeAlerta = R.color.colorPrimaryDark
            estilo.ColorLetraBoton = R.color.cambio_color_letra_botones_dialogo
            estilo.ColorFondoBoton = R.color.cambio_color_fondo_botones_dialogo
            estilo.IconoAlerta = selectorIconoPorDefecto()
            estilo.ColorIconoVector = R.color.colorAccent
            return estilo
        }

        private @DrawableRes fun selectorIconoPorDefecto() : Int{
            return when(this){
                INFORMACION -> { R.drawable.information }
                ERROR->{R.drawable.error}
                NOTIFICACION->{R.drawable.information}
                ALERTA->{R.drawable.alerta}
                VERIFICACION->{R.drawable.ok}
            }
        }

        fun etiquetaDialogo(@NotNull etiqueta : Etiqueta){
            this.etiqueta = etiqueta
        }

        fun getEtiqueta() : Etiqueta?{
            return etiqueta
        }
    }

    enum class Etiqueta(val etiqueta :String){
        
    }
}