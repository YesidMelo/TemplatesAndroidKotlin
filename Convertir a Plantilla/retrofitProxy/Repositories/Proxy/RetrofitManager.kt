package com.example.myapplication.Repositories.Proxy

import android.util.Log
import com.google.gson.Gson
import com.google.gson.JsonSyntaxException
import com.google.gson.reflect.TypeToken
import retrofit2.Call
import retrofit2.Callback
import retrofit2.Response
import retrofit2.Retrofit
import retrofit2.converter.gson.GsonConverterFactory

/*
    implementation 'com.squareup.retrofit2:retrofit:2.4.0'
    implementation 'com.squareup.retrofit2:converter-gson:2.4.0'
    implementation "org.jetbrains.kotlin:kotlin-stdlib-jdk7:$kotlin_version"
*/
class RetrofitManager {

    interface RetrofitParcelable{}

    companion object{


        private var isMock : Boolean = true
        private var retrofit :Retrofit ?= null

        private fun getRetrofit() : Retrofit{

            if (retrofit != null ){
                return retrofit!!
            }

            val baseURL = Services.getBaseURL(isMock)

            retrofit = Retrofit.Builder().baseUrl(Services.getBaseURL(isMock)).addConverterFactory(GsonConverterFactory.create()).build()
            return retrofit!!

        }
    }

    fun startConsult(configConsult : Config){

        val call = generateCall(configConsult)

        if (!iCanStartService(call)){
            configConsult.failResponse?.invoke()
            return
        }

        call!!.enqueue(ListenerResponses(configConsult))

    }

    private fun generateCall(configConsult : Config) : Call<Any>? {

        if(configConsult.getObjectToSend() != null){
            return configConsult.services!!.getApi(getRetrofit(), isMock, Gson().toJson(configConsult.getObjectToSend()!!) )
        }

        return configConsult.services!!.getApi(getRetrofit(), isMock)

    }

    private fun iCanStartService( call : Call<Any>?) : Boolean{
        return call != null
    }

    private class ListenerResponses( val conf : Config) : Callback<Any> {

        override fun onFailure(call: Call<Any>, t: Throwable) {
            conf.failResponse?.invoke()
        }

        override fun onResponse(call: Call<Any>, response: Response<Any>) {
            val funcToStar = selectResponseBasedOnHttpCode(response)
            funcToStar?.invoke()
        }

        private fun selectResponseBasedOnHttpCode(response: Response<Any>) : (()->Unit)? {
            return when(response.code()){

                200 ->  fun (){ generateResponse200(response) }
                201 ->  fun (){}
                204 ->  fun (){}
                400 ->  fun (){}
                401 ->  fun (){}
                404 ->  fun (){}
                else -> fun (){ codeNotFound(response.code()) }

            }
        }

        private fun generateResponse200(response: Response<Any>){
            val gson = Gson()
            val json  = gson.toJson(response.body())

            if (generateResponseWithJsonEmpty(json)){ return }
            if (generateResponseWithUniqueObject(json, gson)){ return }
            if (generateResponseWithArrayObject(json,gson)){ return }

            conf.failResponse?.invoke()
        }

        private fun generateResponseWithJsonEmpty(json : String) : Boolean {

            if(json.isEmpty()){
                conf.successResponse?.invoke(null,null)
                return true
            }

            return false
        }

        private fun generateResponseWithUniqueObject(json : String,gson : Gson) : Boolean{
            return try {

                val myObj = gson.fromJson(json,conf.getObjectReceived())
                conf.successResponse?.invoke(myObj as RetrofitParcelable,null)
                true

            }catch (e : JsonSyntaxException){

                false
            }
        }

        private fun generateResponseWithArrayObject(json : String,gson : Gson): Boolean{
            return try {
                val type = object : TypeToken < MutableList<Any> >(){}.getType()
                val myArayObj = gson.fromJson<MutableList<Any>>(json,type)

                val finalList = emptyList<RetrofitParcelable>().toMutableList()

                myArayObj.forEach {
                    obj ->
                    val myObj = gson.fromJson(gson.toJson(obj),conf.getObjectReceived())
                    finalList.add(myObj as RetrofitParcelable)
                }

                conf.successResponse?.invoke(null,finalList)

                true
            }catch (e : Exception){
                Log.e("Error","",e)
                false
            }
        }


        private fun codeNotFound(code : Int){
            Log.e("Error", "The code $code was not found")
            conf.failResponse?.invoke()
        }

    }


    class Config{

        var services : Services ?= null

        var failResponse :(()->Unit)? = null
        private var objectToSend : RetrofitParcelable ?= null
        private var objectReceived : Class<*> ?= null

        var successResponse : ((RetrofitParcelable?,MutableList<RetrofitParcelable>?) ->Unit)? = null

        fun <T : RetrofitParcelable> setObjectToSend(objToSend : T){
            this.objectToSend = objToSend
        }

        fun <K : RetrofitParcelable> setObjectReceived(objectReceived : Class<K>){
            this.objectReceived = objectReceived
        }

        fun getObjectToSend() : RetrofitParcelable? {
             return this.objectToSend
        }

        fun getObjectReceived() : Class<*>?{
            return  this.objectReceived
        }

    }

}