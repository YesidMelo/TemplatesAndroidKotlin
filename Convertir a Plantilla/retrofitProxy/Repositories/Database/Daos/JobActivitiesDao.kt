package com.example.myapplication.Repositories.Database.Daos

import androidx.room.Dao
import androidx.room.Query
import com.example.myapplication.Repositories.Database.ModelsFromDB.JobActivities

@Dao
interface JobActivitiesDao : BaseDao<JobActivities>{

    @Query("SELECT * FROM JobActivities ")
    fun getJobActivities(): MutableList<JobActivities>
}