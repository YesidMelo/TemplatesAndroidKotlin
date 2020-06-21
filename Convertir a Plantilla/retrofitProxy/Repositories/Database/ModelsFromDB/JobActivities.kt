package com.example.myapplication.Repositories.Database.ModelsFromDB

import androidx.room.Entity
import androidx.room.PrimaryKey

@Entity
class JobActivities :BaseModelDB {

    @PrimaryKey(autoGenerate = true)
    var Id : Int ?= null
    var job_activity_id : Int ?= null
    var job_name : String ?= null
    var job_activity_name : String ?= null
    var utility_id : Int ?= null
    var utility_name : String ?= null


    interface Elements : BaseModelDB.BaseElement{

        companion object{

            fun <T : Elements> convertTo(jobActivities: JobActivities,classe : Class<T>) : T {
                val objExit = classe.newInstance()

                objExit.setIdJobActivities(jobActivities.Id)
                objExit.setjob_activity_id(jobActivities.job_activity_id)
                objExit.setjob_name(jobActivities.job_name)
                objExit.setjob_activity_name(jobActivities.job_activity_name)
                objExit.setutility_id(jobActivities.utility_id)
                objExit.setutility_name(jobActivities.utility_name)

                return objExit
            }

        }


        fun setIdJobActivities(Id : Int?)
        fun setjob_activity_id(job_activity_id : Int?)
        fun setjob_name(job_name : String?)
        fun setjob_activity_name(job_activity_name : String?)
        fun setutility_id(utility_id : Int?)
        fun setutility_name(utility_name : String?)


        fun getIdJobActivities() :  Int?
        fun getjob_activity_id() :  Int?
        fun getjob_name() :  String?
        fun getjob_activity_name() :  String?
        fun getutility_id() :  Int?
        fun getutility_name() :  String?

        fun convertTo(): JobActivities{
            val objc = JobActivities()

            objc.Id = this.getIdJobActivities()
            objc.job_activity_id = this.getjob_activity_id()
            objc.job_name = this.getjob_name()
            objc.job_activity_name = this.getjob_activity_name()
            objc.utility_id = this.getutility_id()
            objc.utility_name = this.getutility_name()

            return objc
        }
    }


}