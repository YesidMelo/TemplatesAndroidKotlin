package com.example.myapplication.Repositories.Proxy.Apis.Mock

import retrofit2.Call
import retrofit2.http.*

interface TestConceptual {

    @GET("5d55b16a350000a524087f3d")
    fun getModelTest() : Call<Any>

    @GET("5d55db9c350000f859087fc9")
    fun getListModelTest() : Call<Any>

    @Headers("Content-Type: application/json")
    @POST("5d55b16a350000a524087f3d")
    fun getModelTestPost(@Body body:String?) : Call<Any>

    @POST("5d55db9c350000f859087fc9")
    fun getListModelsWithAuthorization(@Header("Authorization") token : String?)

}