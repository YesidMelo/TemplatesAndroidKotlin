package ${applicationPackage}.Repositorios.Persistencia

import android.arch.persistence.room.Database
import android.arch.persistence.room.RoomDatabase
import android.arch.persistence.room.TypeConverters
import ${applicationPackage}.Modelos.*
import ${applicationPackage}.Repositorios.Persistencia.Daos.${modelo}Dao

/**
Importante para que funcione bien esta plantilla debe usar las siguientes librerias en el gradle:
 def room_version = "1.1.1-rc1"
   implementation "android.arch.persistence.room:runtime:$room_version"
   annotationProcessor "android.arch.persistence.room:compiler:$room_version"
   implementation "android.arch.persistence.room:rxjava2:$room_version"
   implementation "android.arch.persistence.room:guava:$room_version"
   testImplementation "android.arch.persistence.room:testing:$room_version"

    def corutines_version = "0.22.5"
    implementation "org.jetbrains.kotlinx:kotlinx-coroutines-core:$corutines_version" 
*/
@Database(entities = arrayOf(
        ${modelo}::class
),version = 1)
@TypeConverters(*arrayOf(
        ConversorFecha::class
)
)

abstract class BaseDatos :RoomDatabase(){
    abstract fun ${modelo}Dao():${modelo}Dao
}