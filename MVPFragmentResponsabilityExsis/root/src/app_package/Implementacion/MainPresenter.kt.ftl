package ${packageName}.Presentacion.${responsability}.Implementacion;

import android.content.Context;
import ${packageName}.Presentacion.${responsability}.Interfaces.I${responsability}BL;
import ${packageName}.Presentacion.${responsability}.Interfaces.I${responsability}Presenter;
import ${packageName}.Presentacion.${responsability}.Interfaces.I${responsability}View;
import ${packageName}.Presentacion.${responsability}.Interfaces.I${responsability}Listener;

class ${responsability}Presenter(
    val context:Context,
    val view:I${responsability}View
    ) : I${responsability}Presenter  {


    private val bl: I${responsability}BL 

    init{
        bl=${responsability}BL(context, ActionListener())
    }


    private inner class ActionListener : I${responsability}Listener
    {
        override fun sinConexionInternet()
        {
        view.sinConexionInternet()
        }
    }
}
