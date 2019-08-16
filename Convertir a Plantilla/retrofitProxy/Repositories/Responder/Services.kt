package com.example.myapplication.Repositories.Responder


import android.content.Context
import com.example.myapplication.Repositories.Database.Daos.BaseDao
import com.example.myapplication.Repositories.Database.ManagerDatabase
import com.example.myapplication.Repositories.Database.ModelsFromDB.BaseModelDB
import com.example.myapplication.Repositories.Proxy.Apis.Mock.TestConceptual
import com.example.myapplication.Repositories.Proxy.RetrofitManager
import retrofit2.Call
import retrofit2.Retrofit

enum class Services : RetrofitManager.ServiceToStart,ManagerDatabase.StartConsult {

    PRUEBA_CONSEPTO,
    LISTA_PRUEBA_CONCEPTO,
    PRUEBA_CONCEPTO_POST ,
    CONSULTAR_TOKEN;


    override fun getApi(retrofit: Retrofit, isMock: Boolean, body: String?): Call<Any>? {
        return if(isMock) getApiMock(retrofit,body) else getApiReal(retrofit,body)
    }

    private fun  getApiMock(retrofit: Retrofit,body : String ?= null )  : Call<Any>? {
        return when(this){

            PRUEBA_CONSEPTO -> retrofit.create(TestConceptual::class.java).getModelTest()
            LISTA_PRUEBA_CONCEPTO -> retrofit.create(TestConceptual::class.java).getListModelTest()
            PRUEBA_CONCEPTO_POST -> retrofit.create(TestConceptual::class.java).getModelTestPost(body)
            else -> null
        }
    }

    private fun  getApiReal(retrofit: Retrofit,body : String ?= null) : Call<Any>?{
        return when(this){
            PRUEBA_CONSEPTO -> null
            LISTA_PRUEBA_CONCEPTO -> null
            PRUEBA_CONCEPTO_POST -> null
            else -> null
        }
    }

    override fun <T : BaseModelDB> getManagerTable(contex: Context): BaseDao<T>? {
        return when(this){
            CONSULTAR_TOKEN -> ManagerDatabase.getInstance(contex)!!.authTokenDao() as BaseDao<T>
            else -> null
        }
    }

}