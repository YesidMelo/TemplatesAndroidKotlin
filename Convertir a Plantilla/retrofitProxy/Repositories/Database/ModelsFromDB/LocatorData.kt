package com.example.myapplication.Repositories.Database.ModelsFromDB


import androidx.room.Entity
import androidx.room.ForeignKey
import androidx.room.PrimaryKey

@Entity(
        foreignKeys = arrayOf(
                ForeignKey(
                        entity = SurveyLoggign::class,
                        parentColumns = arrayOf("Id"),
                        childColumns = arrayOf("survey_loggin_id")
                )
        )
)
class LocatorData : BaseModelDB{

    @PrimaryKey(autoGenerate = true)
    var Id : Int ?= null
    var survey_loggin_id : Int ?= null
    var log_datetime : String ?= null
    var log_data : String ?= null
    var submitted : Int ?= null

    interface Elements : BaseModelDB.BaseElement {

        companion object{

            fun <T : Elements> convertTo(locatorData: LocatorData,classe : Class<T>) : T {
                val objExit = classe.newInstance()

                objExit.setIdLocatorData(locatorData.Id)
                objExit.setsurvey_loggin_id(locatorData.survey_loggin_id)
                objExit.setlog_datetime(locatorData.log_datetime)
                objExit.setlog_data(locatorData.log_data)
                objExit.setsubmitted(locatorData.submitted)


                return objExit
            }

        }


        fun setIdLocatorData(Id : Int ?)
        fun setsurvey_loggin_id(survey_loggin_id : Int ?)
        fun setlog_datetime(log_datetime : String ?)
        fun setlog_data(log_data : String ?)
        fun setsubmitted(submitted : Int ?)

        fun getIdLocatorData() : Int ?
        fun getsurvey_loggin_id() : Int ?
        fun getlog_datetime() : String ?
        fun getlog_data() : String ?
        fun getsubmitted() : Int ?

        fun convertTo(): LocatorData{
            val objc = LocatorData()

            objc.Id = this.getIdLocatorData()
            objc.survey_loggin_id = this.getsurvey_loggin_id()
            objc.log_datetime = this.getlog_datetime()
            objc.log_data = this.getlog_data()
            objc.submitted = this.getsubmitted()

            return objc
        }

    }



}