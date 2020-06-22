package ${packageName}.Utilidades.DialogoPDF

import android.content.Context
import android.content.ContextWrapper
import androidx.appcompat.app.AppCompatActivity
import ${packageName}.Presentacion.Dialogos.DialogoPDF


private fun esUnContextoValidoParaMostrarMensaje(contex: Context) : Boolean{
    return contex is AppCompatActivity || contex is ContextWrapper
}

private fun traerContextValido(contex : Context) : Context{
    var finalContex : Context = contex
    while((finalContex !is AppCompatActivity) && (finalContex is ContextWrapper)){
        finalContex = (finalContex as ContextWrapper).baseContext
    }
    return finalContex
}

fun Context.mostrarDialogoTAC(puedoEditar : Boolean = false){
    if(!esUnContextoValidoParaMostrarMensaje(this)){ return }
    if(this !is AppCompatActivity){
        traerContextValido(this).mostrarDialogoTAC(puedoEditar)
        return
    }
    runOnUiThread {
        DialogoPDF.conInstancia().mostrarDialogo(supportFragmentManager,"DialogoPDF")
    }
}