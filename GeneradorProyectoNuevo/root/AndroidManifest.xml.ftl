<?xml version="1.0" encoding="utf-8"?>
<manifest xmlns:android="http://schemas.android.com/apk/res/android"
    package="${packageName}">

    <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE" />
    <uses-permission android:name="android.permission.INTERNET" />

    <application
        android:allowBackup="true"
	    android:icon="@mipmap/ic_launcher"
	    android:label="@string/app_name"
	    android:roundIcon="@mipmap/ic_launcher_round"
	    android:supportsRtl="true"
	    android:theme="@style/AppTheme"
        >
        <activity android:name=".Presentacion.Launcher.Implementacion.LauncherActivity">
            <intent-filter>
                <action android:name="android.intent.action.MAIN" />

                <category android:name="android.intent.category.LAUNCHER" />
            </intent-filter>
        </activity>
        <activity android:name=".Presentacion.Principal.PrincipalActivity" />
    </application>

</manifest>