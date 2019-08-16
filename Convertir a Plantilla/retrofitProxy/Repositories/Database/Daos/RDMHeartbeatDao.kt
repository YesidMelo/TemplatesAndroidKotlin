package com.example.myapplication.Repositories.Database.Daos

import androidx.room.Dao
import androidx.room.Query
import com.example.myapplication.Repositories.Database.ModelsFromDB.RDMHeartbeat

@Dao
interface RDMHeartbeatDao : BaseDao<RDMHeartbeat> {

    @Query("SELECT * FROM RDMHeartbeat ")
    fun getListRDMHeartbeat(): MutableList<RDMHeartbeat>

}