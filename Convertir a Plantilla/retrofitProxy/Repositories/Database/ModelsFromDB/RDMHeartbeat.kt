package com.example.myapplication.Repositories.Database.ModelsFromDB

import androidx.room.Entity
import androidx.room.PrimaryKey

@Entity
class RDMHeartbeat : BaseModelDB{

    @PrimaryKey(autoGenerate = true)
    var Id : Int ?= null
    var heartbeat_datetime : String ?= null
    var last_seen_datetime : String ?= null

    interface Elements : BaseModelDB.BaseElement {

        companion object{

            fun <T : Elements> convertTo(objc: RDMHeartbeat,classe : Class<T>) : T {
                val objExit = classe.newInstance()

                objExit.setIdRDMHeartbeat(objc.Id )
                objExit.setheartbeat_datetime(objc.heartbeat_datetime )
                objExit.setlast_seen_datetime(objc.last_seen_datetime )

                return objExit
            }

        }

        fun setIdRDMHeartbeat(Id : Int ?)
        fun setheartbeat_datetime(heartbeat_datetime : String ?)
        fun setlast_seen_datetime(last_seen_datetime : String ?)

        fun getIdRDMHeartbeat() : Int ?
        fun getheartbeat_datetime() : String ?
        fun getlast_seen_datetime() : String ?

        fun convertTo(): RDMHeartbeat{
            val objc = RDMHeartbeat()

            objc.Id = this.getIdRDMHeartbeat()
            objc.heartbeat_datetime = this.getheartbeat_datetime()
            objc.last_seen_datetime = this.getlast_seen_datetime()

            return objc
        }

    }



}