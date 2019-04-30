<resources>

    <!-- Estilos de dialogo -->
     <style name="Cabezera_Dialogo" parent="AppTheme">
        <item name="android:background">@color/colorPrimaryDark</item>
    </style>

    <style name="Dialogo" parent="Theme.AppCompat.Light.Dialog.Alert">
        <item name="android:windowBackground">@android:color/transparent</item>       
    </style>

    <style name="Titulo_Dialogo" parent="AppTheme">
        <item name="android:textColor">@color/colorAccent</item>
        <item name="android:textSize">@dimen/tamanio_titulo_dialogo</item>
        
    </style>

    <style name="Mensaje_Dialogo" parent="AppTheme">
        <item name="android:textSize">@dimen/tamanio_mensaje_dialogo</item>
        <item name="android:minHeight">@dimen/alto_minimo_mensaje</item>
        <item name="android:gravity">center</item>
        <item name="android:textColor">@color/colorPrimaryDark</item>
    </style>

    <style name="boton_dialogo" parent="AppTheme">
        <item name="android:textAllCaps">false</item>
        <item name="android:background">@drawable/fondo_boton_dialogo</item>
        <item name="android:textColor"> @color/cambio_color_letra_botones_dialogo</item>
    </style>

    <!-- fin estilos dialogo -->

</resources>
