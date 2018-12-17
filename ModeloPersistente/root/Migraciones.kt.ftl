package ${applicationPackage}.Repositorios.Persistencia
import android.arch.persistence.db.SupportSQLiteDatabase
import android.arch.persistence.room.Room
import android.arch.persistence.room.migration.Migration
import android.content.Context

class Migraciones(
        val context:Context,
        val nameDatabase: String
        ) {

    val MIGRATION_1_2 =  object :Migration(1,2){
        override fun migrate(database: SupportSQLiteDatabase) {
            //database.execSQL("My script")
        }

    }

    init {
        Room.databaseBuilder(context, BaseDatos::class.java, nameDatabase)
                .addMigrations(this.MIGRATION_1_2)
                .build()
    }
}