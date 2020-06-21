package com.example.myapplication.Repositories.Database

import android.content.Context
import androidx.room.Database
import androidx.room.Room
import androidx.room.RoomDatabase
import com.example.myapplication.Repositories.Database.Daos.*
import com.example.myapplication.Repositories.Database.ModelsFromDB.*

/*
    RoomVersion

    implementation "androidx.room:room-runtime:$roomVersion"
    implementation "androidx.room:room-ktx:$roomVersion"
    kapt "androidx.room:room-compiler:$roomVersion"
    androidTestImplementation "androidx.room:room-testing:$roomVersion"

*/


@Database(
        entities = arrayOf(
                Authtoken::class,
                JobActivities::class,
                LocatorData::class,
                PairedDevices::class,
                RDMA::class,
                RDMHeartbeat::class,
                SubmittedData::class,
                SurveyLoggign::class,
                ValidProducts::class
        ),
        version = 1
)
abstract class ManagerDatabase : RoomDatabase(){

    interface StartConsult{
        fun <T : BaseModelDB> getManagerTable(contex :Context) : BaseDao<T>?
    }

    companion object{
        private val NAME_DATABASE = "RDMA_DB"

        @Volatile
        private var instance : ManagerDatabase?= null

        fun getInstance(context : Context) : ManagerDatabase? {
            instance ?: synchronized(this){
                instance = Room.databaseBuilder(context.applicationContext,ManagerDatabase::class.java, NAME_DATABASE).build()
            }
            return instance
        }

    }

    abstract fun authTokenDao() : AuthTokenDao
    abstract fun JobActivities() : JobActivitiesDao
    abstract fun LocatorData() : LocatorDataDao
    abstract fun PairedDevices() : PairedDevicesDao
    abstract fun RDMA() : RDMADao
    abstract fun RDMHeartbeat() : RDMHeartbeatDao
    abstract fun SubmittedData() : SubmittedDataDao
    abstract fun SurveyLoggign() : SurveyLoggingDao
    abstract fun ValidProducts() : ValidProductsDao

}