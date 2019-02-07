package ${packageName}.Base


import android.app.Fragment
import android.os.Bundle
import android.support.annotation.Nullable
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup


/**
 * Created by Yesid on 21/08/2017.
 */

open class BaseFragment : Fragment(){
     /**
     * Encargado de capturar la vista del fragmento en caso de necesitar personalizaciones como fuentes etc
     * con versiones anteriores a 24  (Crear Funcion de insercion de fuentes)
     */
    open protected var vistaFragment: View? = null

    /**
     * Actividad base para la creacion del contexto y manejo de accion
     * actividades
     */
    open protected var baseActivity: BaseActivity? = null


    override fun onCreateView(inflater: LayoutInflater?, container: ViewGroup?, savedInstanceState: Bundle?): View {
        baseActivity = this.activity as BaseActivity?
        return vistaFragment!!
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
}
