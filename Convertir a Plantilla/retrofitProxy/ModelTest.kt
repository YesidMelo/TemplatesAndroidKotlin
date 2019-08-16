package com.example.myapplication

import com.example.myapplication.Repositories.Database.ModelsFromDB.Authtoken
import com.example.myapplication.Repositories.Proxy.RetrofitManager

class ModelTest : RetrofitManager.RetrofitParcelable , Authtoken.Elements{


    var Id: Int ?= null
    var Variable1 : String? = null
    var Variable2 : String? = null

    override fun getIdToken(): Int? {
        return Id
    }

    override fun getToken(): String? {
        return Variable1
    }

    override fun getExpirationDatatime(): String? {
        return Variable2
    }

    override fun setIdToken(id: Int?) {
        this.Id = id
    }

    override fun setToken(token: String?) {
        this.Variable1 = token
    }

    override fun setExpirationDatetime(expirationDatetime: String?) {
        this.Variable2 = expirationDatetime
    }


}