package ${packageName}.Presentacion.${responsability}.Implementacion

import android.app.Activity
import android.content.Context
import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.app.Fragment


import ${packageName}.Presentacion.${responsability}.Interfaces.I${responsability}Presenter
import ${packageName}.Presentacion.${responsability}.Interfaces.I${responsability}View
import ${packageName}.Base.BaseFragment
import ${packageName}.R


 class ${responsability}Fragment : BaseFragment(){

	private var presenter:I${responsability}Presenter ?= null
	var on${responsability}Listener:On${responsability}Listener ?= null

 
    override fun onCreateView(inflater:LayoutInflater?, container:ViewGroup?, savedInstanceState:Bundle?):View {
        vistaFragment=inflater!!.inflate(R.layout.fragment_${responsability?lower_case},null,false)
        return super.onCreateView(inflater, container, savedInstanceState)
    }

    override fun creaElementosVista() {

    }

    override fun creaEscuchadoresVista() {
        presenter= ${responsability}Presenter(activity, ActionPresenter())
    }

    override fun logicaVista() {

    }

    public interface On${responsability}Listener{}

    private inner class ActionPresenter : I${responsability}View
    {
        override fun sinConexionInternet()
        {
        
        }
    }

}
