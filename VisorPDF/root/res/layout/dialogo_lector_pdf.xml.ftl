<?xml version="1.0" encoding="utf-8"?>
<androidx.constraintlayout.widget.ConstraintLayout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    xmlns:tools="http://schemas.android.com/tools"
    android:id="@+id/contenedor_dialogo_terminos_y_condiciones"
    android:layout_width="match_parent"
    android:layout_height="wrap_content"
    android:orientation="vertical">

    <androidx.cardview.widget.CardView
        android:layout_width="0dp"
        android:layout_height="wrap_content"
        android:layout_marginStart="8dp"
        android:layout_marginTop="8dp"
        android:layout_marginEnd="8dp"
        android:layout_marginBottom="8dp"
        app:cardBackgroundColor="@color/colorPrimary"
        app:cardCornerRadius="@dimen/esquinas_dialogos"
        app:layout_constraintBottom_toBottomOf="parent"
        app:layout_constraintEnd_toEndOf="parent"
        app:layout_constraintStart_toStartOf="parent"
        app:layout_constraintTop_toTopOf="parent">

        <androidx.constraintlayout.widget.ConstraintLayout
            android:layout_width="match_parent"
            android:layout_height="wrap_content">


            <${packageName}.Presentacion.UtilidadesVista.VisorPDF.VistaLectorPdf
                android:id="@+id/vistaLectorPdf"
                android:layout_width="0dp"
                android:layout_height="@dimen/dialogo_pdf"
                app:layout_constraintBottom_toTopOf="@+id/boton_cancelar"
                app:layout_constraintEnd_toEndOf="parent"
                app:layout_constraintStart_toStartOf="parent"
                app:layout_constraintTop_toBottomOf="@+id/titulo_dialogo_pdf"
                tools:ignore="MissingConstraints" />

            <Button
                android:id="@+id/boton_aceptar"
                style="@style/botones_dialogo"
                android:layout_width="0dp"
                android:layout_height="wrap_content"
                android:layout_marginStart="8dp"
                android:layout_marginBottom="8dp"
                android:text="@string/aceptar"
                android:textAllCaps="false"
                app:layout_constraintBottom_toBottomOf="parent"
                app:layout_constraintEnd_toStartOf="@+id/guideline"
                app:layout_constraintStart_toStartOf="parent" />

            <androidx.constraintlayout.widget.Guideline
                android:id="@+id/guideline"
                android:layout_width="wrap_content"
                android:layout_height="wrap_content"
                android:orientation="vertical"
                app:layout_constraintEnd_toEndOf="parent"
                app:layout_constraintGuide_percent="0.5"
                app:layout_constraintStart_toStartOf="parent" />

            <Button
                android:id="@+id/boton_cancelar"
                style="@style/botones_dialogo"
                android:layout_width="0dp"
                android:layout_height="wrap_content"
                android:layout_marginBottom="8dp"
                android:text="@string/cancelar"
                android:textAllCaps="false"
                app:layout_constraintBottom_toBottomOf="parent"
                app:layout_constraintEnd_toEndOf="parent"
                app:layout_constraintStart_toStartOf="@+id/guideline" />

            <TextView
                android:id="@+id/titulo_dialogo_pdf"
                style="@style/Titulo_dialogo"
                android:layout_width="wrap_content"
                android:layout_height="wrap_content"
                android:layout_marginStart="8dp"
                android:layout_marginTop="8dp"
                android:layout_marginEnd="8dp"
                android:text="@string/titulo_dialogo_pdf"
                app:layout_constraintEnd_toEndOf="parent"
                app:layout_constraintStart_toStartOf="parent"
                app:layout_constraintTop_toTopOf="parent" />

        </androidx.constraintlayout.widget.ConstraintLayout>
    </androidx.cardview.widget.CardView>
</androidx.constraintlayout.widget.ConstraintLayout>