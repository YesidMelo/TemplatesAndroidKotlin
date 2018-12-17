package ${packageName}


import android.annotation.SuppressLint
import android.content.Context
import android.support.v7.widget.LinearLayoutManager
import android.support.v7.widget.RecyclerView
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.Button
import android.widget.ImageView
import android.widget.TextView
import ${applicationPackage}.Modelos.${Modelo}
import ${applicationPackage}.R
/**
para que esta plantilla funcione debe asegurarse que los siguientes paquetes se encuentren en el gradle
*/
class ${Modelo}Adapter(
	val context:Context,
	val list${Modelo}:MutableList<${Modelo}>,
	val recicler:RecyclerView,
	val ${Modelo?lower_case}Borrar : ((${Modelo})->Unit)? = null,
	val ${Modelo?lower_case}Seleccionado : ((${Modelo})->Unit) ?= null
): RecyclerView.Adapter <${Modelo}Adapter.ItemList${Modelo}>(){

	init{
		inicioRecicler()		
	}

	private fun inicioRecicler(){
		if(recicler.adapter != null){
			recicler.adapter!!.notifyDataSetChanged()
			return 
		}

		recicler.layoutManager = LinearLayoutManager(context)
		recicler.adapter = this
	}

	override fun onCreateViewHolder(p0: ViewGroup, p1: Int): ItemList${Modelo} {
        val view = LayoutInflater.from(context).inflate(R.layout.item_recycler_${Modelo?lower_case},null,false)
        val params = RecyclerView.LayoutParams ( RecyclerView.LayoutParams.MATCH_PARENT, RecyclerView.LayoutParams.WRAP_CONTENT)
        view.layoutParams = params
        return ItemList${Modelo}(view)
    }

    override fun getItemCount(): Int {
        return list${Modelo}.size
    }

    override fun onBindViewHolder(p0: ItemList${Modelo}, p1: Int) {
        p0.llenarVista(list${Modelo}[p1])
    }

	inner class ItemList${Modelo} (val vista:View):RecyclerView.ViewHolder(vista){
		var ${Modelo?lower_case} : ${Modelo} ?= null

		val tv_text = vista.findViewById<TextView>(R.id.tv_text)
        <#if Estilo == "card_btn_derecho">
        val iv_delete = vista.findViewById<ImageView>(R.id.iv_delete)
        <#elseif Estilo == "card_btn_izquierdo">
        val iv_edit = vista.findViewById<ImageView>(R.id.iv_edit)
        <#elseif Estilo == "card_btn_izquierdo_derecho">
        val iv_delete = vista.findViewById<ImageView>(R.id.iv_delete)
        val iv_edit = vista.findViewById<ImageView>(R.id.iv_edit)
        <#elseif Estilo == "card_titulo_mensaje">
        val tv_titulo = vista.findViewById<TextView>(R.id.tv_titulo)
        <#elseif Estilo == "card_titulo_mensaje_boton">
        val tv_titulo = vista.findViewById<TextView>(R.id.tv_titulo)
        val btn_adapter = vista.findViewById<TextView>(R.id.tv_text)
        </#if>

        init {
            escuchadoresVista()
        }

        fun escuchadoresVista(){
    	<#if Estilo == "card_btn_derecho">
        	iv_delete.setOnClickListener{
        		${Modelo?lower_case}Borrar?.invoke(this.${Modelo?lower_case}!!)
        	}
        <#elseif Estilo == "card_btn_izquierdo">
        	iv_edit.setOnClickListener{
        		${Modelo?lower_case}Seleccionado?.invoke(${Modelo?lower_case}!!)
        	}
        <#elseif Estilo == "card_btn_izquierdo_derecho">
        	iv_delete.setOnClickListener{
        		${Modelo?lower_case}Borrar?.invoke(this.${Modelo?lower_case}!!)
        	}
        	iv_edit.setOnClickListener{
        		${Modelo?lower_case}Seleccionado?.invoke(${Modelo?lower_case}!!)
        	}
    	<#elseif Estilo == "card_titulo_mensaje">
    		vista.setOnClickListener{
        		${Modelo?lower_case}Seleccionado?.invoke(${Modelo?lower_case}!!)
        	}
        <#elseif Estilo == "card_titulo_mensaje_boton">
        	btn_adapter.setOnClickListener{
        		${Modelo?lower_case}Seleccionado?.invoke(${Modelo?lower_case}!!)
        	}
        </#if>

        }

		fun llenarVista(${Modelo?lower_case}: ${Modelo}){
			this.${Modelo?lower_case} = ${Modelo?lower_case}
		}
	}
}
