package com.example.myapplication.Repositories.Database.Daos

import androidx.room.Dao
import androidx.room.Query
import com.example.myapplication.Repositories.Database.ModelsFromDB.SubmittedData

@Dao
interface SubmittedDataDao: BaseDao<SubmittedData>{

    @Query("SELECT * FROM SubmittedData ")
    fun getListSubmittedData(): MutableList<SubmittedData>

}