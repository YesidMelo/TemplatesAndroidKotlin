dependencies {
  def room_version = "1.1.1-rc1"
  ${getConfigurationName("compile")} "android.arch.persistence.room:runtime:$room_version"
  ${getConfigurationName("compile")} "android.arch.persistence.room:rxjava2:$room_version"
  ${getConfigurationName("compile")} "android.arch.persistence.room:guava:$room_version"

  ${getConfigurationName("annotationProcessor")} "android.arch.persistence.room:compiler:$room_version"
  ${getConfigurationName("testImplementation")} "android.arch.persistence.room:testing:$room_version"
    // Libreria room
    

   //Libreria corutinas android
    def corutines_version = "0.22.5"
    implementation "org.jetbrains.kotlinx:kotlinx-coroutines-core:$corutines_version"

implementation 'com.mapbox.mapboxsdk:mapbox-android-sdk:6.7.1'
}