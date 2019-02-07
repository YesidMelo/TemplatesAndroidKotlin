package ${packageName}.Utilidades;


import android.content.Context
import android.graphics.Bitmap
import android.graphics.drawable.BitmapDrawable
import android.graphics.drawable.Drawable
import android.os.Build
import android.net.ConnectivityManager
import java.util.regex.Pattern
import android.support.annotation.RequiresApi

/**
 * Created by Yesid on 14/08/2017.
 */
 /**
 * funcion encargada de redimencionar una imagen de drawable
 */
@RequiresApi(Build.VERSION_CODES.LOLLIPOP)
fun redimencionaUnaImagen(context: Context,rutaAncho:Int,rutaAlto:Int,rutaImage:Int):Drawable
{
    val imagenOriginal= (context.getDrawable(rutaImage) as BitmapDrawable).bitmap
    val imagenRedimencionado =Bitmap.createScaledBitmap(
            imagenOriginal,
            context.resources.getDimension(rutaAncho).toInt(),
            context.resources.getDimension(rutaAlto).toInt(),
            false)
    return BitmapDrawable(context.resources,imagenRedimencionado)
}


/**
 * Funcion encargada de evaluar si un estring cumple con los estandares de una expresion regurlar
 */
fun validarConExpresionReg(aEvaluar:String, expresionRegular: Constantes.ExpresionRegular):Boolean{
    val patern= Pattern.compile(expresionRegular.expresion)
    val matcher=patern.matcher(aEvaluar)
    return matcher.find()
}

/**
 * Verifica tipo conexion a internet
 * En el manifiest:
 * <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE" />
 *  <uses-permission android:name="android.permission.INTERNET" />
 */
fun tipoConexionInternet(context: Context):Constantes.TipoConexionInternet{
    val conexion:ConnectivityManager=context.getSystemService(Context.CONNECTIVITY_SERVICE) as ConnectivityManager
    if(conexion.activeNetworkInfo!=null && conexion.activeNetworkInfo.type==ConnectivityManager.TYPE_WIFI)
    {
        return Constantes.TipoConexionInternet.WIFI
    }
    if(conexion.activeNetworkInfo!=null && conexion.activeNetworkInfo.type==ConnectivityManager.TYPE_MOBILE)
    {
        return Constantes.TipoConexionInternet.DATOS
    }
    return Constantes.TipoConexionInternet.SIN_CONEXION
}