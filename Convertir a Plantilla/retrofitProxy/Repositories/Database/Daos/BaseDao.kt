package com.example.myapplication.Repositories.Database.Daos

import androidx.room.Delete
import androidx.room.Insert
import androidx.room.Update
import com.example.myapplication.Repositories.Database.ModelsFromDB.BaseModelDB

interface BaseDao <T : BaseModelDB> {
    @Insert
    fun insert(obj : T)

    @Update
    fun update(obj: T)

    @Delete
    fun delete(obj : T)


}