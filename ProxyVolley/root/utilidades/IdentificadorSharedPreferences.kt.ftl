package ${packageName}.Utilidades.ProxyVolley

import ${packageName}.DataAccess.ProxyVolley.PreferenciasServidor

enum class IdentificadorSharedPreferences (private val identificador: String): PreferenciasServidor.PreferenciasServidorIdentificador {
    Token("Token");

    override fun traerIdentificador(): String {
        return identificador
    }
}