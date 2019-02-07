package ${packageName}.Componentes.Progress

import android.annotation.SuppressLint
import android.app.DialogFragment
import android.content.Context
import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import ${packageName}.R

@SuppressLint("ValidFragment")
class Progress:DialogFragment() {

    var contexto:Context ?= null

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        //setStyle(DialogFragment.STYLE_NORMAL, R.style.Dialogo)
        this.isCancelable=false
    }
    override fun onCreateView(inflater: LayoutInflater?, container: ViewGroup?, savedInstanceState: Bundle?): View {
        val vista=LayoutInflater.from(contexto).inflate(R.layout.progress,null,false)
        return vista
    }
}