package ${packageName}.DataAccess.ProxyVolley

import android.content.Context
import android.util.Log
import ${packageName}.BuildConfig
import ${packageName}.Modelos.ProxyVolley.UsuarioToken
import ${packageName}.Utilidades.ProxyVolley.IdentificadorSharedPreferences

class ManejadorDeCabezerasDePeticiones {

    private var contexto : Context ?= null
    fun conContexto(context: Context) : ManejadorDeCabezerasDePeticiones{
        this.contexto = context
        return this
    }

    private var metodo : Metodo = Metodo.GET
    fun conMetodo(metodo : Metodo) : ManejadorDeCabezerasDePeticiones{
        this.metodo = metodo
        return this
    }

    private val mapaCabezeras = emptyMap<String,String>().toMutableMap()
    fun generarCabezeras() : ManejadorDeCabezerasDePeticiones{
        mapaCabezeras["Content-Type"]= "application/json"
        verificaElMetodoDeEnvio()
        verificarToken()
        return this
    }

    private fun verificarToken(){
        PreferenciasUsuario(contexto!!)
            .conEscuchadorExito { objeto, _ ->
                if(objeto == null ){ return@conEscuchadorExito }
                val usuario = objeto as User

                if(usuario.token == null ){ return@conEscuchadorExito}
                mapaCabezeras["Authorization"]= usuario.token!!

                if(BuildConfig.MostrarToken){
                        Log.e("Token : ",usuario.token!!)
                }

            }
            .conEscuchadorFalla { _, _ ->
                Log.e("manejador cabezera","Fallo la carga del token")
            }
            .traerObjeto(User::class.java,IdentificadorSharedPreferences.Token)
    }
    private fun verificaElMetodoDeEnvio(){
        if(metodo == Metodo.PATCH){
            mapaCabezeras["X-HTTP-Method-Override"]= "PATCH"
        }
    }

    fun traerCabezeras() : MutableMap<String,String>{
        return mapaCabezeras
    }

}