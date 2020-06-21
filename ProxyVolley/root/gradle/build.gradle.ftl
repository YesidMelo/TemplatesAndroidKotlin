android{
   
    buildTypes {
        release {
            minifyEnabled false
            proguardFiles getDefaultProguardFile('proguard-android-optimize.txt'), 'proguard-rules.pro'

            resValue "string", "app_name", "Nombre_proyecto"
        
            buildConfigField "String", Servidor, "\"https://escuchap.herokuapp.com\""
            buildConfigField "boolean", MostrarToken, "false"
        }

        def Servidor = "Servidor"
        def MostrarToken = "MostrarToken"

        debug {
            debuggable true

            resValue "string", "app_name", "Nombre_proyecto"

            buildConfigField "String", Servidor, "\"https://escuchap.herokuapp.com\""
            buildConfigField "boolean", MostrarToken, "true"
        }


    }

    compileOptions {
        sourceCompatibility JavaVersion.VERSION_1_8
        targetCompatibility JavaVersion.VERSION_1_8
    }
}
dependencies {

    ${getConfigurationName("implementation ")} files('libs/okhttp-urlconnection-2.2.0.jar')
    ${getConfigurationName("implementation ")} 'org.jetbrains.kotlinx:kotlinx-coroutines-core:0.27.0-eap13'
    ${getConfigurationName("implementation ")} 'com.android.support:multidex:1.0.3'
    ${getConfigurationName("implementation ")} 'com.android.volley:volley:1.1.1'
    ${getConfigurationName("implementation ")} 'com.google.code.gson:gson:2.8.5'
    ${getConfigurationName("implementation ")} 'org.jetbrains.anko:anko:0.10.1'
    
}
