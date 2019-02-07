package ${packageName}.Componentes

import android.annotation.SuppressLint
import android.app.DialogFragment
import android.graphics.Color
import android.graphics.drawable.ColorDrawable
import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.Button
import ${packageName}.R
import kotlinx.android.synthetic.main.dialogo_alerta.*

/**/
@SuppressLint("ValidFragment")
class DialogoAlerta constructor(
        val Tipo                : TipoDialogo = TipoDialogo.OK,
        val Titulo              : String,
        val Mensaje             : String,
        val accionBotonAceptar  : (() ->Unit),
        val botonAceptar        : String = "Aceptar",
        val botonCancelar       : String = "Cancelar",
        val accionBotonCancelar : (() -> Unit)?= null
) : DialogFragment() {

    enum class TipoDialogo{
        OK,ERROR,INFORMACION,ADVERTENCIA
    }
    private var vista : View? = null

    override fun onCreateView(inflater: LayoutInflater?, container: ViewGroup?, savedInstanceState: Bundle?): View {
        dialog.window.setBackgroundDrawable(ColorDrawable(Color.TRANSPARENT))
        dialog.setCanceledOnTouchOutside(false)
        vista = inflater!!.inflate(R.layout.dialogo_alerta, null, false)
        return vista!!
    }

    override fun onResume() {
        super.onResume()
        SelectorVista()
        accionDialogo()
        llenarDialogo()
    }

    private fun SelectorVista(){
        when(Tipo){
            TipoDialogo.ADVERTENCIA -> {
                (vista?.findViewById(R.id.btn_aceptar2) as Button).visibility = View.GONE}
            TipoDialogo.OK,TipoDialogo.INFORMACION,TipoDialogo.ERROR -> {
                (vista?.findViewById(R.id.btn_aceptar) as Button).visibility = View.GONE
                (vista?.findViewById(R.id.btn_cancelar) as Button).visibility = View.GONE
            }
        }
    }

    private fun accionDialogo(){
        btn_aceptar?.setOnClickListener {
            dismiss()
            accionBotonAceptar.invoke()
        }
        btn_aceptar2?.setOnClickListener {
            dismiss()
            accionBotonAceptar.invoke()
        }
        btn_cancelar?.setOnClickListener {
            dismiss()
            accionBotonCancelar?.invoke()
        }
    }

    private fun llenarDialogo(){
        tv_titulo.text = Titulo
        tv_mensaje.text = Mensaje
        btn_aceptar.text = botonAceptar
        btn_aceptar2.text = botonAceptar
        btn_cancelar.text = botonCancelar
    }
}