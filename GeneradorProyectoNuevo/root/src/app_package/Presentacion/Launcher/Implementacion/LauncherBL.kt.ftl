package ${packageName}.Presentacion.Launcher.Implementacion

import android.content.Context
import ${packageName}.Presentacion.Launcher.Interfaces.ILauncherBL
import ${packageName}.Presentacion.Launcher.Interfaces.ILauncherListener
import ${packageName}.Utilidades.Constantes
import ${packageName}.Modelos.Respuesta

class LauncherBL(
    val context     :Context,
    val listener    :ILauncherListener
    ) : ILauncherBL {

    
    override fun Falla(respuesta: Respuesta?, error: Constantes.Repositorio) {
        
    }

    override fun Exito(respuesta: Any?, repo: Constantes.Repositorio) {
        
    }
}
