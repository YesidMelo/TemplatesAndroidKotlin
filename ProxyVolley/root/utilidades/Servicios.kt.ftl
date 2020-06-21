package ${packageName}.Utilidades.ProxyVolley

import ${packageName}.DataAccess.ProxyVolley.Metodo
import ${packageName}.DataAccess.ProxyVolley.ProxyVolley

enum class Servicios(
    val url : String,
    val urlMock : String ,
    val metodo : Metodo,
    val nombreArchivoLocal : String ?= null
) : ProxyVolley.VolleyService{

    ;

    private var esMock = false

    fun cambiaEstadoMock(esMock :Boolean = false) : Servicios{
        this.esMock = esMock
        return this
    }

    override fun getURL(): String {
        return if(!esMock) url else urlMock
    }

    override fun getMethod(): Metodo {
        return metodo
    }

    private var complemento : String ?= null

    fun setComplemento(complemento : String): Servicios{
        this.complemento = complemento
        return this
    }

    override fun complemento(): String? {
        return complemento
    }

    override fun getNombreDocumentoMock(): String? {
        return nombreArchivoLocal
    }

}