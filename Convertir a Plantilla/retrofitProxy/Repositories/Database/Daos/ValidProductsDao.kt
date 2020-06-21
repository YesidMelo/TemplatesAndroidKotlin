package com.example.myapplication.Repositories.Database.Daos

import androidx.room.Dao
import androidx.room.Query
import com.example.myapplication.Repositories.Database.ModelsFromDB.ValidProducts

@Dao
interface ValidProductsDao : BaseDao<ValidProducts>{

    @Query("SELECT * FROM ValidProducts ")
    fun getListValidProducts(): MutableList<ValidProducts>

}