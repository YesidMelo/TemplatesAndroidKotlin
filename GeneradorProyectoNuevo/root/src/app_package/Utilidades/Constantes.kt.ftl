package ${packageName}.Utilidades;

/**
 * Created by Yesid on 14/08/2017.
 */

class Constantes {
    
   /**
     * Etiquetas de dialogo
     */
    enum class TipoDialogo {
        INFORMACION,
        ERROR,
        NOTIFICACION,
        ALERTA,
        VERIFICACION
    }

     /**
     * Etiquetas de dialogo
     */
    enum class EtiquetasDialogo(val etiqueta:String,val tipoDialogo: TipoDialogo) {
        
    }
    
    

    /**
     * Elementos encargados de realizar consultas en la base de datos local
     */
    enum class Consultas{}

    /**
     * Elementos Caracteristicos de firebase
     */
    enum class Firebase(
        val nodo:String?,
        val tipoRepo: TipoRepo
    ){
        ;
        /**
         * Selecciona que funcion realizara en firebase
         */
        enum class TipoRepo{
            DATABASE_REAL_TIME,
            AUTHENTICACION
        }
    }

    enum class TipoSolicitudServicio{
        GET,POST,PUT
    }
    /**
     * Contenedor de elementos rest
     */
    enum class Rest(
            val tipoSolicitudServicio: TipoSolicitudServicio?,
            val esArreglo:Boolean,
            val ruta:String?
    ){
        BASE_URl(null,false,null)
    }

    /**
     * Contenedor de los servicio soap
     */
    enum class Soap(){}

    /**
     * Contenedor de los servicio Shared preferences
     */
    enum class SharedPreferences(){}

    /**
     * Selector del tipo de repositorio
     */
    enum class Repositorio(
            val consulta:Consultas?,
            val firebase: Firebase?,
            val rest: Rest?,
            val soap: Soap?,
            val sharedpreferences:SharedPreferences?
            ){
            
            }

    /**
     * Animaciones para la naveegacion
     */
    enum class AnimacionNavegacionEntreFragmentos(val rutaAnimEntrada:Int, val rutaAnimSalida:Int)
    {

    }

    /**
     * Etiiquetas de fragmentos
     */
    enum class EtiquetasDeFragmentos(val etiqueta:String?)
    {
        ACCESO_CUENTA(null)
    }

     /**
     * Expreciones regulares
     */
    enum class ExpresionRegular(val expresion:String){
        EMAIL("^[_a-z0-9-]+(.[_a-z0-9-]+)*@[a-z0-9-]+(.[a-z0-9-]+)*(.[a-z]{2,4})$")
    }
    
    /**
     * Tipos de conexion a internet
     */
    enum class TipoConexionInternet(){
        SIN_CONEXION,
        WIFI,
        DATOS,
    }
}
