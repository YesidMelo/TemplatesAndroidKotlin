package ${packageName}.Repositorios.Persistencia;


/**
 * para usar esta clase correctamente debe implementar en el gradle las siguientes librerias
 *  def room_version = "1.1.1-rc1"
 *  implementation "android.arch.persistence.room:runtime:$room_version"
 *  annotationProcessor "android.arch.persistence.room:compiler:$room_version"
 *  implementation "android.arch.persistence.room:rxjava2:$room_version"
 *  implementation "android.arch.persistence.room:guava:$room_version"
 *  testImplementation "android.arch.persistence.room:testing:$room_version"
 *
 *  Si se desea usar la actualizacion en tiempo real para la vista aprovechando la nuevar arquitectura mvvm
 *  proveida por android google implementar las siguientes librerias
 *  def lifecycle_version = "1.1.1"
 *  implementation "android.arch.lifecycle:extensions:$lifecycle_version"
 *  implementation "android.arch.lifecycle:viewmodel:$lifecycle_version" // use -ktx for Kotlin
 *  implementation "android.arch.lifecycle:livedata:$lifecycle_version"
 *  implementation "android.arch.lifecycle:runtime:$lifecycle_version"
 *  annotationProcessor "android.arch.lifecycle:compiler:$lifecycle_version"
 *  implementation "android.arch.lifecycle:common-java8:$lifecycle_version"
 *  implementation "android.arch.lifecycle:reactivestreams:$lifecycle_version"
 *  testImplementation "android.arch.core:core-testing:$lifecycle_version"
 *
 *  Created by Yesid on 16/06/2018.
 */
import android.arch.persistence.room.RoomDatabase

abstract  class Persistencia : RoomDatabase()
{

}
