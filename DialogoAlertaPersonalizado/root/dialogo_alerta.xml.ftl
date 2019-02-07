<?xml version="1.0" encoding="utf-8"?>
<android.support.constraint.ConstraintLayout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    xmlns:tools="http://schemas.android.com/tools"
    android:id="@+id/ContenedorPrincipalDialogo"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    android:background="@android:color/transparent"
    android:orientation="vertical">


    <android.support.constraint.ConstraintLayout
        android:id="@+id/ContenidoDialogo"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:background="@android:color/holo_green_dark"
        android:maxWidth="250dp"
        android:maxHeight="150dp"
        android:minWidth="250dp"
        android:minHeight="100dp"
        app:layout_constrainedHeight="true"
        app:layout_constrainedWidth="true"
        app:layout_constraintBottom_toBottomOf="parent"
        app:layout_constraintEnd_toEndOf="parent"
        app:layout_constraintStart_toStartOf="parent"
        app:layout_constraintTop_toTopOf="parent">

        <TextView
            android:id="@+id/tv_titulo"
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:layout_marginStart="8dp"
            android:layout_marginTop="8dp"
            android:layout_marginEnd="8dp"
            android:text="Titulo"
            app:layout_constraintEnd_toEndOf="parent"
            app:layout_constraintStart_toStartOf="parent"
            app:layout_constraintTop_toTopOf="parent"
            tools:ignore="HardcodedText" />

        <TextView
            android:id="@+id/tv_mensaje"
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:layout_marginStart="8dp"
            android:layout_marginTop="8dp"
            android:layout_marginEnd="8dp"
            android:text="Mensaje"
            app:layout_constraintEnd_toEndOf="parent"
            app:layout_constraintStart_toStartOf="parent"
            app:layout_constraintTop_toBottomOf="@+id/tv_titulo" />

        <Button
            android:id="@+id/btn_cancelar"
            android:layout_width="0dp"
            android:layout_height="wrap_content"
            android:layout_margin="0dp"
            android:background="@android:color/holo_green_light"
            android:minWidth="0dp"
            android:minHeight="0dp"
            android:padding="0dp"
            android:text="Cancelar"
            android:textAllCaps="false"
            android:visibility="visible"
            app:layout_constraintBottom_toBottomOf="parent"
            app:layout_constraintEnd_toStartOf="@+id/Division"
            app:layout_constraintStart_toStartOf="parent"
            tools:ignore="HardcodedText" />

        <Button
            android:id="@+id/btn_aceptar"
            android:layout_width="0dp"
            android:layout_height="wrap_content"
            android:layout_margin="0dp"
            android:background="@android:color/holo_green_light"
            android:minWidth="0dp"
            android:minHeight="0dp"
            android:padding="0dp"
            android:text="Aceptar"
            android:textAllCaps="false"
            app:layout_constraintBottom_toBottomOf="parent"
            app:layout_constraintEnd_toEndOf="parent"
            app:layout_constraintStart_toEndOf="@+id/Division"
            tools:ignore="HardcodedText" />

        <View
            android:id="@+id/Division"
            android:layout_width="1dp"
            android:layout_height="10dp"
            android:background="?android:attr/listDivider"
            android:visibility="gone"
            app:layout_constraintBottom_toBottomOf="parent"
            app:layout_constraintEnd_toEndOf="parent"
            app:layout_constraintStart_toStartOf="parent"
            app:layout_constraintTop_toBottomOf="@+id/tv_mensaje" />

        <Button
            android:id="@+id/btn_aceptar2"
            android:layout_width="0dp"
            android:layout_height="wrap_content"
            android:layout_margin="0dp"
            android:background="@android:color/holo_green_light"
            android:minWidth="0dp"
            android:minHeight="0dp"
            android:padding="0dp"
            android:text="Aceptar"
            android:textAllCaps="false"
            android:textIsSelectable="false"
            app:layout_constraintBottom_toBottomOf="parent"
            app:layout_constraintEnd_toEndOf="parent"
            app:layout_constraintStart_toStartOf="parent"
            tools:ignore="HardcodedText" />

    </android.support.constraint.ConstraintLayout>
</android.support.constraint.ConstraintLayout>