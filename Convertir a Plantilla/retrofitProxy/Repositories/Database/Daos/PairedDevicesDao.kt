package com.example.myapplication.Repositories.Database.Daos

import androidx.room.Dao
import androidx.room.Query
import com.example.myapplication.Repositories.Database.ModelsFromDB.PairedDevices

@Dao
interface PairedDevicesDao : BaseDao<PairedDevices> {

    @Query("SELECT * FROM PairedDevices ")
    fun getListPairedDevices(): MutableList<PairedDevices>
}