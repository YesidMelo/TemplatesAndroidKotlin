package ${applicationPackage}.Repositorios.Persistencia.Conversores

import android.arch.persistence.room.TypeConverter
import java.util.*

class ConversorFecha {

    @TypeConverter
    fun toDate(time:Long?): Date?
    {
        if(time==null) {
            return null
        }
        return Date(time)
    }

    @TypeConverter
    fun toLong(date:Date?):Long?
    {
        if(date==null) return null
        return date.time
    }
}