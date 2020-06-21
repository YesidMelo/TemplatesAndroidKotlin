package com.example.myapplication.Repositories.Database.Daos

import androidx.room.Dao
import androidx.room.Query
import com.example.myapplication.Repositories.Database.ModelsFromDB.LocatorData

@Dao
interface LocatorDataDao : BaseDao<LocatorData>{

    @Query("SELECT * FROM LocatorData ")
    fun getListLocatorData(): MutableList<LocatorData>

}