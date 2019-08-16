package com.example.myapplication.Repositories.Proxy


import com.example.myapplication.Repositories.Proxy.Apis.Mock.TestConceptual
import retrofit2.Call
import retrofit2.Retrofit

enum class Services {

    PRUEBA_CONSEPTO,
    LISTA_PRUEBA_CONCEPTO,
    PRUEBA_CONCEPTO_POST;

    companion object{
        fun getBaseURL(isMock : Boolean = false) : String{
            return if (isMock) generateBaseURLMock() else generateBaseURLReal()
        }

        private fun generateBaseURLMock() :String{
            return "http://www.mocky.io/v2/"
        }

        private fun generateBaseURLReal(): String{
            return ""
        }
    }


    fun getApi(retrofit: Retrofit,isMock: Boolean = false,body : String ?= null) : Call<Any>? {

        return if(isMock) getApiMock(retrofit,body) else getApiReal(retrofit,body)
    }

    private fun  getApiMock(retrofit: Retrofit,body : String ?= null )  : Call<Any>? {
        return when(this){

            PRUEBA_CONSEPTO -> retrofit.create(TestConceptual::class.java).getModelTest()
            LISTA_PRUEBA_CONCEPTO -> retrofit.create(TestConceptual::class.java).getListModelTest()
            PRUEBA_CONCEPTO_POST -> retrofit.create(TestConceptual::class.java).getModelTestPost(body)

        }
    }

    private fun  getApiReal(retrofit: Retrofit,body : String ?= null) : Call<Any>?{
        return when(this){
            PRUEBA_CONSEPTO -> null
            LISTA_PRUEBA_CONCEPTO -> null
            PRUEBA_CONCEPTO_POST -> null
        }
    }



}