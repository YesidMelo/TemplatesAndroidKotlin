package ${applicationPackage}.Repositorios.Persistencia.Daos

import android.arch.persistence.room.*
import ${applicationPackage}.Modelos.${modelo}

@Dao
interface ${modelo}Dao {
	
	@Insert(onConflict = OnConflictStrategy.REPLACE)
    fun insertar${modelo}      (${modelo?lower_case}: ${modelo})

    @Delete
    fun eliminar${modelo}      (${modelo?lower_case}: ${modelo})

    @Update(onConflict = OnConflictStrategy.REPLACE)
    fun actualizar${modelo}      (${modelo?lower_case}: ${modelo})

    @Query("select * from ${modelo} ")
    fun lista${modelo}s        ():MutableList<${modelo}>
    
}