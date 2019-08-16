package com.example.myapplication.Repositories.Database.ModelsFromDB

import androidx.room.Entity
import androidx.room.PrimaryKey


@Entity
class RDMA : BaseModelDB{

    @PrimaryKey(autoGenerate = true)
    var Id : Int ?= null
    var app_name : String ?= null
    var rdm_url : String ?= null

    interface Elements  : BaseModelDB.BaseElement {

        companion object{

            fun <T : Elements> convertTo(rdma: RDMA,classe : Class<T>) : T {
                val objExit = classe.newInstance()

                objExit.setIdRDMA(rdma.Id)
                objExit.setapp_name(rdma.app_name)
                objExit.setrdm_url(rdma.rdm_url)

                return objExit
            }

        }

        fun setIdRDMA(Id : Int ?)
        fun setapp_name(app_name : String ?)
        fun setrdm_url(rdm_url : String ?)


        fun getIdRDMA (): Int ?
        fun getapp_name (): String ?
        fun getrdm_url (): String ?

        fun convertTo(): RDMA{
            val objc = RDMA()

            objc.Id = this.getIdRDMA()
            objc.app_name = this.getapp_name()
            objc.rdm_url = this.getrdm_url()

            return objc
        }

    }



}