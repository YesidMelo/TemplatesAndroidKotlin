package com.example.myapplication.Repositories.Database.ModelsFromDB

import androidx.room.ColumnInfo
import androidx.room.Entity
import androidx.room.PrimaryKey

@Entity
class PairedDevices : BaseModelDB{

    @PrimaryKey(autoGenerate = true)
    var Id : Int ?= null
    var serial_number : String  ?= null
    var product_type : String ?= null
    var product_name : String ?= null
    var uuid : String ?= null

    @ColumnInfo(name = "is_registered")
    var registered : Boolean ?= null
    var last_seen_datatime : String ?= null
    var paired_datatime : String ?= null

    interface Elements : BaseModelDB.BaseElement {

        companion object{

            fun <T : Elements> convertTo(pairedDevices: PairedDevices,classe : Class<T>) : T {
                val objExit = classe.newInstance()

                objExit.setIdPairedDevices(pairedDevices.Id )
                objExit.setserial_number(pairedDevices.serial_number )
                objExit.setproduct_type(pairedDevices.product_type )
                objExit.setproduct_name(pairedDevices.product_name )
                objExit.setuuid(pairedDevices.uuid )
                objExit.setregistered(pairedDevices.registered )
                objExit.setlast_seen_datatime(pairedDevices.last_seen_datatime )
                objExit.setpaired_datatime(pairedDevices.paired_datatime )

                return objExit
            }

        }

        fun setIdPairedDevices (Id : Int?)
        fun setserial_number (serial_number : String ?)
        fun setproduct_type (product_type : String?)
        fun setproduct_name (product_name : String?)
        fun setuuid (uuid : String?)
        fun setregistered (registered : Boolean?)
        fun setlast_seen_datatime (last_seen_datatime : String?)
        fun setpaired_datatime (paired_datatime : String?)


        fun getIdPairedDevices(): Int ?
        fun getserial_number(): String  ?
        fun getproduct_type(): String ?
        fun getproduct_name(): String ?
        fun getuuid(): String ?
        fun getregistered(): Boolean ?
        fun getlast_seen_datatime(): String ?
        fun getpaired_datatime(): String ?

        fun convertTo(): PairedDevices{
            val objc = PairedDevices()

            objc.Id = this.getIdPairedDevices()
            objc.serial_number = this.getserial_number()
            objc.product_type = this.getproduct_type()
            objc.product_name = this.getproduct_name()
            objc.uuid = this.getuuid()
            objc.registered = this.getregistered()
            objc.last_seen_datatime = this.getlast_seen_datatime()
            objc.paired_datatime = this.getpaired_datatime()

            return objc
        }

    }



}