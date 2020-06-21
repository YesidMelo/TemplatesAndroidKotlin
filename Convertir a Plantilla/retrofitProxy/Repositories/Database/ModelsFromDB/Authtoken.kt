package com.example.myapplication.Repositories.Database.ModelsFromDB

import androidx.room.Entity
import androidx.room.PrimaryKey

@Entity
class Authtoken :BaseModelDB {

    @PrimaryKey(autoGenerate = true)
    var Id : Int ?= null
    var token : String ?= null
    var expiration_datatime : String  ?= null

    interface Elements : BaseModelDB.BaseElement{

        companion object{

            fun <T : Elements> convertTo(authtoken: Authtoken,classe : Class<T>) : T {
                val objExit = classe.newInstance()

                objExit.setIdToken(authtoken.Id)
                objExit.setToken(authtoken.token)
                objExit.setExpirationDatetime(authtoken.expiration_datatime)

                return objExit
            }

        }

        fun getIdToken() : Int?
        fun getToken() : String?
        fun getExpirationDatatime():String?

        fun setIdToken(id : Int?)
        fun setToken(token : String?)
        fun setExpirationDatetime(expirationDatetime : String?)

        fun convertTo(): Authtoken{
            val auth = Authtoken()

            auth.Id = this.getIdToken()
            auth.token = this.getToken()
            auth.expiration_datatime = this.getExpirationDatatime()

            return auth
        }

    }



}