package com.example.myapplication.Repositories.Database.ModelsFromDB

import androidx.room.Entity
import androidx.room.PrimaryKey

@Entity
class SubmittedData : BaseModelDB{

    @PrimaryKey(autoGenerate = true)
    var Id : Int  ?=  null
    var submission_date : String ?= null
    var submitted_sessions : String ?= null
    var last_idx_submitted : String ?= null
    var updated_datetime : String ?= null


    interface Elements : BaseModelDB.BaseElement {

        companion object{

            fun <T : Elements> convertTo(objc: SubmittedData,classe : Class<T>) : T {
                val objExit = classe.newInstance()

                objExit.setIdSubmittedData (objc.Id )
                objExit.setsubmission_date (objc.submission_date )
                objExit.setsubmitted_sessions (objc.submitted_sessions )
                objExit.setlast_idx_submitted (objc.last_idx_submitted )
                objExit.setupdated_datetime (objc.updated_datetime )

                return objExit
            }

        }

        fun setIdSubmittedData(Id : Int  ?)
        fun setsubmission_date(submission_date : String ?)
        fun setsubmitted_sessions(submitted_sessions : String ?)
        fun setlast_idx_submitted(last_idx_submitted : String ?)
        fun setupdated_datetime(updated_datetime : String ?)

        fun getIdSubmittedData (): Int  ?
        fun getsubmission_date (): String ?
        fun getsubmitted_sessions (): String ?
        fun getlast_idx_submitted (): String ?
        fun getupdated_datetime (): String ?

        fun convertTo(): SubmittedData{
            val objc = SubmittedData()

            objc.Id = this.getIdSubmittedData ()
            objc.submission_date = this.getsubmission_date ()
            objc.submitted_sessions = this.getsubmitted_sessions ()
            objc.last_idx_submitted = this.getlast_idx_submitted ()
            objc.updated_datetime = this.getupdated_datetime ()

            return objc
        }

    }



}