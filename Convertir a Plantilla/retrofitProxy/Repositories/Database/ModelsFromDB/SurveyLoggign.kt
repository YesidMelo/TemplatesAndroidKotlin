package com.example.myapplication.Repositories.Database.ModelsFromDB

import androidx.room.Entity
import androidx.room.ForeignKey
import androidx.room.PrimaryKey

@Entity(
        foreignKeys = arrayOf(
                ForeignKey(
                        entity = JobActivities::class,
                        parentColumns = arrayOf("Id"),
                        childColumns = arrayOf("job_activity_id")
                )
        )
)
class SurveyLoggign : BaseModelDB {

    @PrimaryKey(autoGenerate = true)
    var Id : Int ?= null
    var job_activity_id :Int ?= null
    var start_datetime :String ?= null
    var end_datetime :String ?= null

    interface Elements : BaseModelDB.BaseElement {

        companion object{

            fun <T : Elements> convertTo(objc: SurveyLoggign,classe : Class<T>) : T {
                val objExit = classe.newInstance()

                objExit.setIdSurveyLoggign(objc.Id )
                objExit.setjob_activity_id(objc.job_activity_id )
                objExit.setstart_datetime(objc.start_datetime )
                objExit.setend_datetime(objc.end_datetime )

                return objExit
            }

        }

        fun setIdSurveyLoggign (Id : Int ?)
        fun setjob_activity_id (job_activity_id :Int ?)
        fun setstart_datetime (start_datetime :String ?)
        fun setend_datetime (end_datetime :String ?)

        fun getIdSurveyLogging (): Int ?
        fun getjob_activity_id ():Int ?
        fun getstart_datetime ():String ?
        fun getend_datetime ():String ?

        fun convertTo(): SurveyLoggign{
            val objc = SurveyLoggign()


            objc.Id = this.getIdSurveyLogging ()
            objc.job_activity_id = this.getjob_activity_id()
            objc.start_datetime = this.getstart_datetime()
            objc.end_datetime = this.getend_datetime()

            return objc
        }

    }



}