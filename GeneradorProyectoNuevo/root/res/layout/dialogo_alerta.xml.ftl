<?xml version="1.0" encoding="utf-8"?>
<LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
    android:layout_width="match_parent"
    android:layout_height="wrap_content"
    android:orientation="vertical">

    <RelativeLayout
        android:layout_width="match_parent"
        android:layout_height="wrap_content">

        <ImageView
            android:id="@+id/icono_titulo"
            android:layout_width="50dp"
            android:layout_height="50dp"
            android:layout_centerHorizontal="true"
            android:src="@drawable/ic_launcher_background" />

        <TextView
            android:id="@+id/titulo"
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:layout_centerInParent="true"
            android:text="@string/app_name"
            android:textColor="@color/colorAccent" />
    </RelativeLayout>

    <TextView
        android:id="@+id/mensaje"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:layout_gravity="center"
        android:text="mensaje" />

    <LinearLayout
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:orientation="horizontal">

        <Button
            android:id="@+id/boton_cancelar"
            android:layout_width="0dp"
            android:layout_height="wrap_content"
            android:layout_weight="0.48"
            android:text="cancelar" />

        <View
            android:layout_width="1dp"
            android:layout_height="match_parent" />

        <Button
            android:id="@+id/boton_aceptar"
            android:layout_width="0dp"
            android:layout_height="wrap_content"
            android:layout_weight="0.48"
            android:text="aceptar" />
    </LinearLayout>
</LinearLayout>