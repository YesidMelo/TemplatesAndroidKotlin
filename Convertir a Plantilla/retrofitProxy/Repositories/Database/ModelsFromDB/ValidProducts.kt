package com.example.myapplication.Repositories.Database.ModelsFromDB

import androidx.room.Entity
import androidx.room.PrimaryKey

@Entity
class ValidProducts : BaseModelDB{

    @PrimaryKey(autoGenerate = true)
    var Id : Int ?= null
    var uuid : String  ?= null
    var product_name : String ?= null
    var product_type : String ?= null

    interface Elements : BaseModelDB.BaseElement {

        companion object{

            fun <T : Elements> convertTo(objc: ValidProducts,classe : Class<T>) : T {
                val objExit = classe.newInstance()

                objExit.setIdValidProduct (objc.Id )
                objExit.setuuid (objc.uuid )
                objExit.setproduct_name (objc.product_name )
                objExit.setproduct_type (objc.product_type )

                return objExit
            }

        }

        fun setIdValidProduct (Id : Int ?)
        fun setuuid (uuid : String  ?)
        fun setproduct_name (product_name : String ?)
        fun setproduct_type (product_type : String ?)

        fun getIdValidProduct (): Int ?
        fun getuuid (): String  ?
        fun getproduct_name (): String ?
        fun getproduct_type (): String ?

        fun convertTo(): ValidProducts{
            val objc = ValidProducts()

            objc.Id = this.getIdValidProduct()
            objc.uuid = this.getuuid()
            objc.product_name = this.getproduct_name()
            objc.product_type = this.getproduct_type()

            return objc
        }

    }



}