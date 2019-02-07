package ${packageName}.Base

import android.app.Activity
import android.os.Bundle
import android.support.v7.app.AppCompatActivity
import android.view.View


import ${packageName}.R
import ${packageName}.Componentes.Dialogos.Dialogo
import ${packageName}.Componentes.Progress.Progress
import ${packageName}.Utilidades.Constantes

/**
 * Created by Yesid on 21/08/2017.
 */

open class BaseActivity :AppCompatActivity() {
    open protected var BaseFragment: BaseFragment? = null
    open protected var vistaActividad: View? = null
    private var progress:Progress ?= null

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
    }

    override fun onResume() {
        super.onResume()
        creaElementosVista()
        creaEscuchadoresVista()
        logicaVista()
    }

    open protected fun creaElementosVista() {}

    open protected fun creaEscuchadoresVista() {}

    open protected fun logicaVista() {}

    //---------------------[Navegacion entre fragmentos]---------------------
    /**
     * Funcion encargada de la navegacion entre fragmentos
     */
    fun <T:BaseFragment>navegacionEntreFragmentos(
            rutaContenedor:Int,
            animacion: Constantes.AnimacionNavegacionEntreFragmentos?,
            fragment:T,
            etiqueta:Constantes.EtiquetasDeFragmentos
            )
    {
        val navegador=fragmentManager.beginTransaction()
        if(animacion!=null){
            navegador.setCustomAnimations(animacion.rutaAnimEntrada,animacion.rutaAnimSalida)
        }
        navegador.replace(rutaContenedor,fragment)
        if(etiqueta.etiqueta != null){
            navegador.addToBackStack(etiqueta.etiqueta)
        }
        navegador.commit()
    }
    //---------------------[Navegacion entre fragmentos]---------------------
     //---------------------[Progress]---------------------
    /**
     * Muestra progress en la aplicacion
     */
    fun muestraProgress(){
        progress= Progress()
        progress!!.contexto=this
        progress!!.show(fragmentManager,"progress")
    }

    /**
     * oculta progress en la aplicacion
     */
    fun cierraProgress()
    {
        progress!!.dismiss()
        progress = null
    }
    //---------------------[Progress]---------------------
    //---------------------[muestraDialogo]---------------------
    fun mostrarDialogo(
            titulo:String?,
            mensaje:String,
            botonAceptar:String?,
            botonCancelar:String?,
            etiquetasDialogo: Constantes.EtiquetasDialogo,
            escuchadorDialogo: Dialogo.EscuchadorDialogo
    )
    {
        val dialogo=Dialogo(
                titulo,
                mensaje,
                botonAceptar,
                botonCancelar,
                etiquetasDialogo,
                escuchadorDialogo
        )
        dialogo.show(fragmentManager,etiquetasDialogo.etiqueta)
    }
    //---------------------[muestraDialogo]---------------------
}
