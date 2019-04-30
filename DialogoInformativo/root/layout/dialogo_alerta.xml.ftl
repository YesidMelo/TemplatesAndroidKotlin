<?xml version="1.0" encoding="utf-8"?>
<android.support.constraint.ConstraintLayout
        xmlns:android="http://schemas.android.com/apk/res/android"
        xmlns:app="http://schemas.android.com/apk/res-auto"
        xmlns:tools="http://schemas.android.com/tools"
        android:layout_width="match_parent"
        android:layout_height="match_parent"

    >

    <android.support.v7.widget.CardView
        android:layout_width="250dp"
        android:layout_height="wrap_content"
        android:layout_marginStart="8dp"
        android:layout_marginTop="8dp"
        android:layout_marginEnd="8dp"
        android:layout_marginBottom="8dp"
        android:maxHeight="@dimen/maximo_alto_dialogo"
        android:minWidth="@dimen/ancho_maximo_dialogo"
        android:minHeight="@dimen/minimo_altoDialogo"
        app:cardCornerRadius="@dimen/radio_esquina_dialogo"
        app:layout_constraintBottom_toBottomOf="parent"
        app:layout_constraintEnd_toEndOf="parent"
        app:layout_constraintStart_toStartOf="parent"
        app:layout_constraintTop_toTopOf="parent">

        <android.support.constraint.ConstraintLayout
            android:layout_width="match_parent"
            android:layout_height="wrap_content"
            android:minHeight="@dimen/minimo_altoDialogo"
            android:maxHeight="@dimen/maximo_alto_dialogo"
            android:background="@color/colorPrimary"
            >

            <View
                android:id="@+id/fondo_titulo"
                android:layout_width="0dp"
                android:layout_height="50dp"
                android:maxHeight="@dimen/maximo_alto_titulo_dialogo"
                android:minHeight="@dimen/minimo_alto_titulo_dialogo"
                app:layout_constraintEnd_toEndOf="parent"
                app:layout_constraintStart_toStartOf="parent"
                app:layout_constraintTop_toTopOf="parent"
                style="@style/Cabezera_Dialogo"
                />

            <ImageView
                android:id="@+id/icono_titulo"
                android:layout_width="@dimen/icono_fondo_titulo_dialogo"
                android:layout_height="@dimen/icono_fondo_titulo_dialogo"
                app:layout_constraintBottom_toBottomOf="@+id/titulo"
                app:layout_constraintEnd_toEndOf="@+id/fondo_titulo"
                app:layout_constraintStart_toStartOf="@+id/fondo_titulo"
                app:layout_constraintTop_toTopOf="@+id/fondo_titulo"
                app:srcCompat="@drawable/ok"
                android:contentDescription="@string/app_name"
                />

            <TextView
                android:id="@+id/titulo"
                style="@style/Titulo_Dialogo"
                android:layout_width="wrap_content"
                android:layout_height="wrap_content"
                android:text="@string/Titulo"
                app:layout_constraintBottom_toBottomOf="@+id/fondo_titulo"
                app:layout_constraintEnd_toEndOf="@+id/fondo_titulo"
                app:layout_constraintStart_toStartOf="@+id/fondo_titulo"
                app:layout_constraintTop_toTopOf="@+id/fondo_titulo" />

            <View
                android:id="@+id/fondo_botones"
                style="@style/Cabezera_Dialogo"
                android:layout_width="0dp"
                android:layout_height="50dp"
                app:layout_constraintBottom_toBottomOf="parent"
                app:layout_constraintEnd_toEndOf="parent"
                app:layout_constraintStart_toStartOf="parent" />

            <View
                android:id="@+id/divider4"
                android:layout_width="1dp"
                android:layout_height="25dp"
                android:layout_marginStart="8dp"
                android:layout_marginBottom="8dp"
                android:background="?android:attr/listDivider"
                app:layout_constraintBottom_toBottomOf="@+id/fondo_botones"
                app:layout_constraintEnd_toEndOf="@+id/fondo_botones"
                app:layout_constraintStart_toStartOf="@+id/fondo_botones"
                app:layout_constraintTop_toTopOf="@+id/fondo_botones"
                android:visibility="invisible"
                />

            <Button
                android:id="@+id/boton_cancelar"
                android:layout_width="wrap_content"
                android:layout_height="wrap_content"
                android:text="@string/cancelar"
                app:layout_constraintBottom_toBottomOf="@+id/fondo_botones"
                app:layout_constraintEnd_toStartOf="@+id/divider4"
                app:layout_constraintStart_toStartOf="@+id/fondo_botones"
                app:layout_constraintTop_toTopOf="@+id/fondo_botones"
                style="@style/boton_dialogo"
                />

            <Button
                android:id="@+id/boton_aceptar"
                android:layout_width="wrap_content"
                android:layout_height="wrap_content"
                android:text="@string/aceptar"
                app:layout_constraintBottom_toBottomOf="@+id/fondo_botones"
                app:layout_constraintEnd_toEndOf="@+id/fondo_botones"
                app:layout_constraintStart_toEndOf="@+id/divider4"
                app:layout_constraintTop_toTopOf="@+id/fondo_botones"
                style="@style/boton_dialogo"
                />

            <TextView
                android:id="@+id/mensaje"
                android:layout_width="wrap_content"
                android:layout_height="wrap_content"
                android:layout_marginStart="16dp"
                android:layout_marginTop="8dp"
                android:layout_marginEnd="16dp"
                android:layout_marginBottom="8dp"
                android:text="@string/mensaje"
                app:layout_constraintBottom_toTopOf="@+id/fondo_botones"
                app:layout_constraintEnd_toEndOf="parent"
                app:layout_constraintStart_toStartOf="parent"
                app:layout_constraintTop_toBottomOf="@+id/fondo_titulo"
                style="@style/Mensaje_Dialogo"
                />

        </android.support.constraint.ConstraintLayout>
    </android.support.v7.widget.CardView>

</android.support.constraint.ConstraintLayout>
