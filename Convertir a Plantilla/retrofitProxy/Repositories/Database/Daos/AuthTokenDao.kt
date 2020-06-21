package com.example.myapplication.Repositories.Database.Daos

import androidx.room.Dao
import androidx.room.Query
import com.example.myapplication.Repositories.Database.ModelsFromDB.Authtoken

@Dao
interface AuthTokenDao : BaseDao<Authtoken> {

    @Query("SELECT * FROM Authtoken ")
    fun getTokens():MutableList<Authtoken>



}