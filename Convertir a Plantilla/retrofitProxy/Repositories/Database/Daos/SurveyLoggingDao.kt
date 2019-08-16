package com.example.myapplication.Repositories.Database.Daos

import androidx.room.Dao
import androidx.room.Query
import com.example.myapplication.Repositories.Database.ModelsFromDB.SurveyLoggign

@Dao
interface SurveyLoggingDao : BaseDao<SurveyLoggign> {

    @Query("SELECT * FROM SurveyLoggign ")
    fun getListSurveyLoggign(): MutableList<SurveyLoggign>

}