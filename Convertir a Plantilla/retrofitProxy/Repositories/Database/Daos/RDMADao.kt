package com.example.myapplication.Repositories.Database.Daos

import androidx.room.Dao
import androidx.room.Query
import com.example.myapplication.Repositories.Database.ModelsFromDB.RDMA

@Dao
interface RDMADao : BaseDao<RDMA>{

    @Query("SELECT * FROM RDMA ")
    fun getListRDMA(): MutableList<RDMA>

}