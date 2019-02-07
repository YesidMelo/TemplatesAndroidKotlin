package ${packageName}.Presentacion.Launcher.Implementacion

import android.content.Intent
import android.os.Bundle

import ${packageName}.Base.BaseActivity
import ${packageName}.Presentacion.Principal.PrincipalActivity
import ${packageName}.Presentacion.Launcher.Interfaces.ILauncherView
import ${packageName}.R

class LauncherActivity : BaseActivity() {
    
    override fun onCreate(savedInstanceState:Bundle?) {
        setContentView(R.layout.activity_launcher)
        super.onCreate(savedInstanceState)
    }

    
    override fun logicaVista() {
        val hilo=Thread( AccionPostInicio())
        hilo.start()
    }

    private inner class AccionPostInicio : Runnable
    {

        override fun run() {
            try {
                Thread.sleep(3000)
                val intent=Intent(this@LauncherActivity, PrincipalActivity::class.java)
                startActivity(intent)
                finish()
            } catch (e:InterruptedException) {

            }

        }
    }
    
    private inner class AccionPresenter : ILauncherView
    {
        override fun sinConexionInternet(){
        
        }
    }

}
