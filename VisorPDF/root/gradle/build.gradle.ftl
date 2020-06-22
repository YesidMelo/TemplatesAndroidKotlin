android{
    compileOptions {
        sourceCompatibility JavaVersion.VERSION_1_8
        targetCompatibility JavaVersion.VERSION_1_8
    }
}
dependencies {

    ${getConfigurationName("implementation ")} 'org.jetbrains.kotlinx:kotlinx-coroutines-core:0.27.0-eap13'
    ${getConfigurationName("implementation ")} 'com.android.support:multidex:1.0.3'
    ${getConfigurationName("implementation ")} 'com.android.support.constraint:constraint-layout:1.1.3'
    ${getConfigurationName("implementation ")} 'androidx.appcompat:appcompat:1.1.0'
    ${getConfigurationName("implementation ")} 'com.android.support:cardview-v7:28.0.0'
    
    
}
