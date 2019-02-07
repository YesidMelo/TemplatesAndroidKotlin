package ${packageName}.Repositorios.Produccion;

import ${packageName}.Modelos.Respuesta;
import ${packageName}.Utilidades.Constantes

/**
 * Created by Yesid on 21/08/2017.
 */

interface IProduccionListener {
    fun Falla(respuesta: Respuesta?, error: Constantes.Repositorio)
    fun Exito(respuesta: Any?, repo: Constantes.Repositorio)
}
