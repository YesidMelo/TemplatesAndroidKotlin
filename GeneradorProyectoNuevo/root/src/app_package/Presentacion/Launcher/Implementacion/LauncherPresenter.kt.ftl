package ${packageName}.Presentacion.Launcher.Implementacion

import android.content.Context
import ${packageName}.Presentacion.Launcher.Interfaces.ILauncherBL
import ${packageName}.Presentacion.Launcher.Interfaces.ILauncherPresenter
import ${packageName}.Presentacion.Launcher.Interfaces.ILauncherView
import ${packageName}.Presentacion.Launcher.Interfaces.ILauncherListener

class LauncherPresenter(
        val context: Context,
        val view :ILauncherView
    )
 : ILauncherPresenter {

    
    private val  bl:ILauncherBL

    init{
        bl = LauncherBL(context,ActionListener())
    }
    

  

    private inner class ActionListener : ILauncherListener
    {
        override fun sinConexionInternet()
        {
            view.sinConexionInternet()
        }
    }
}
