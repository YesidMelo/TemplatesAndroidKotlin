package ${applicationPackage}.Repositorios.Produccion

import android.app.Activity
import android.arch.persistence.room.Room
import android.content.Context
import android.util.Log
import kotlinx.coroutines.experimental.Job
import kotlinx.coroutines.experimental.launch
import java.util.*
import ${applicationPackage}.Repositorios.Persistencia.BaseDatos

import ${applicationPackage}.Modelos.${modelo}

class Repo${modelo}(val context:Context) {
	<#if crearConsultorBaseDatos == false>
		/**
		Debe insertar las siguientes lineas en BaseDatos
		en las entities ${modelo}::class

		dentro de la case
		abstract fun ${modelo}Dao(): ${modelo}Dao
		*/
	</#if>

	fun crear${modelo}(respuestaOk: (Any?) -> Unit, respuestaFalla: () -> Unit, ${modelo?lower_case}: ${modelo}) = launch {
        try{
            val db = Room.databaseBuilder(this@Repo${modelo}.context,BaseDatos::class.java,BaseDatos.nombreBaseDatos).build().${modelo}Dao()
            db.insertar${modelo}(${modelo?lower_case})
            ejecutaRespuestaOk(respuestaOk)
        }
        catch (e:Exception){
            Log.e("Error","",e)
            ejecutaRespuestaFalla(respuestaFalla)
        }
    }
    fun actualizar${modelo}(respuestaOk: (Any?) -> Unit, respuestaFalla: () -> Unit, ${modelo?lower_case}: ${modelo}) = launch {
        try{
            val db = Room.databaseBuilder(this@Repo${modelo}.context,BaseDatos::class.java,BaseDatos.nombreBaseDatos).build().${modelo}Dao()
            db.actualizar${modelo}(${modelo?lower_case})
            ejecutaRespuestaOk(respuestaOk)
        }
        catch (e:Exception){
            Log.e("Error","",e)
            ejecutaRespuestaFalla(respuestaFalla)
        }
    }
    fun eliminar${modelo}(respuestaOk: (Any?) -> Unit, respuestaFalla: () -> Unit, ${modelo?lower_case}: ${modelo}) = launch {
        try{
            val db = Room.databaseBuilder(this@Repo${modelo}.context,BaseDatos::class.java,BaseDatos.nombreBaseDatos).build().${modelo}Dao()
            db.eliminar${modelo}(${modelo?lower_case})
            ejecutaRespuestaOk(respuestaOk)
        }
        catch (e:Exception){
            Log.e("Error","",e)
            ejecutaRespuestaFalla(respuestaFalla)
        }
    }
    fun lista${modelo}s(respuestaOk: (Any?) -> Unit, respuestaFalla: () -> Unit) = launch {
        try{
            val db = Room.databaseBuilder(this@Repo${modelo}.context,BaseDatos::class.java,BaseDatos.nombreBaseDatos).build().${modelo}Dao()
            val lista = db.lista${modelo}s()
            ejecutaRespuestaOk(respuestaOk,lista)
        }
        catch (e:Exception){
            Log.e("Error","",e)
            ejecutaRespuestaFalla(respuestaFalla)
        }
    }
    fun eliminar${modelo}s(respuestaOk: (Any?) -> Unit, respuestaFalla: () -> Unit) = launch {
        try{
            val db = Room.databaseBuilder(this@Repo${modelo}.context,BaseDatos::class.java,BaseDatos.nombreBaseDatos).build().${modelo}Dao()
            val lista = db.lista${modelo}s()
            lista.forEach {
                db.eliminar${modelo}(it)
            }
            ejecutaRespuestaOk(respuestaOk)
        }
        catch (e:Exception){
            Log.e("Error","",e)
            ejecutaRespuestaFalla(respuestaFalla)
        }
    }
    private fun ejecutaRespuestaOk(respuestaOk: (Any?) -> Unit,objeto: Any? = null){
        if (this@Repo${modelo}.context !is Activity){
            respuestaOk(objeto)
            return
        }
        (this@Repo${modelo}.context as Activity).runOnUiThread{
            respuestaOk.invoke(objeto)
        }
    }
    private fun ejecutaRespuestaFalla(respuestaFalla: () -> Unit){
        if (this@Repo${modelo}.context !is Activity){
            respuestaFalla.invoke()
            return
        }
        (this@Repo${modelo}.context as Activity).runOnUiThread{
            respuestaFalla.invoke()
        }
    }

}