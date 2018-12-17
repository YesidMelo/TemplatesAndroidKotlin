<?xml version="1.0" encoding="utf-8"?>
<android.support.v7.widget.CardView xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    xmlns:tools="http://schemas.android.com/tools"
    android:layout_width="match_parent"
    android:layout_height="match_parent">
    <android.support.constraint.ConstraintLayout
    xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    xmlns:tools="http://schemas.android.com/tools" android:layout_width="match_parent"
    android:layout_height="match_parent">
<#if Estilo == "default">    
    <TextView
    android:id="@+id/tv_text"
    android:layout_width="0dp"
    android:layout_height="wrap_content"
    android:layout_marginStart="8dp"
    android:layout_marginTop="8dp"
    android:layout_marginEnd="8dp"
    android:layout_marginBottom="8dp"
    android:text="TextView"
    app:layout_constraintBottom_toBottomOf="parent"
    app:layout_constraintEnd_toEndOf="parent"
    app:layout_constraintStart_toStartOf="parent"
    app:layout_constraintTop_toTopOf="parent" />
<#elseif Estilo == "card_btn_derecho">
        <TextView
    android:id="@+id/tv_text"
    android:layout_width="0dp"
    android:layout_height="wrap_content"
    android:layout_marginStart="8dp"
    android:layout_marginTop="8dp"
    android:layout_marginEnd="8dp"
    android:layout_marginBottom="8dp"
    android:text="TextView"
    app:layout_constraintBottom_toBottomOf="parent"
    app:layout_constraintEnd_toStartOf="@+id/iv_delete"
    app:layout_constraintStart_toStartOf="parent"
    app:layout_constraintTop_toTopOf="parent" />

    <ImageView android:id="@+id/iv_delete" android:layout_width="wrap_content"
    android:layout_height="wrap_content" android:layout_marginEnd="8dp"
    app:layout_constraintBottom_toBottomOf="@+id/tv_text"
    app:layout_constraintEnd_toEndOf="parent" app:layout_constraintTop_toTopOf="@+id/tv_text"
    app:srcCompat="@android:drawable/ic_delete" />

<#elseif Estilo == "card_btn_izquierdo">
<TextView
    android:id="@+id/tv_text"
    android:layout_width="0dp"
    android:layout_height="wrap_content"
    android:layout_marginStart="8dp"
    android:layout_marginTop="8dp"
    android:layout_marginEnd="8dp"
    android:layout_marginBottom="8dp"
    android:text="TextView"
    app:layout_constraintBottom_toBottomOf="parent"
    app:layout_constraintEnd_toEndOf="parent"
    app:layout_constraintStart_toEndOf="@+id/iv_edit"
    app:layout_constraintTop_toTopOf="parent" />

    <ImageView
    android:id="@+id/iv_edit"
    android:layout_width="wrap_content"
    android:layout_height="wrap_content"
    android:layout_marginStart="8dp"
    app:layout_constraintBottom_toBottomOf="@+id/tv_text"
    app:layout_constraintStart_toStartOf="parent"
    app:layout_constraintTop_toTopOf="@+id/tv_text"
    app:srcCompat="@android:drawable/ic_menu_preferences" /> 
<#elseif Estilo == "card_btn_izquierdo_derecho">
<TextView
    android:id="@+id/tv_text"
    android:layout_width="0dp"
    android:layout_height="wrap_content"
    android:layout_marginStart="8dp"
    android:layout_marginTop="8dp"
    android:layout_marginEnd="8dp"
    android:layout_marginBottom="8dp"
    android:text="TextView"
    app:layout_constraintBottom_toBottomOf="parent"
    app:layout_constraintEnd_toStartOf="@+id/iv_delete"
    app:layout_constraintStart_toEndOf="@+id/iv_edit"
    app:layout_constraintTop_toTopOf="parent"
    app:layout_constraintVertical_bias="0.501" />

    <ImageView
    android:id="@+id/iv_delete"
    android:layout_width="wrap_content"
    android:layout_height="wrap_content"
    android:layout_marginEnd="8dp"
    app:layout_constraintBottom_toBottomOf="@+id/tv_text"
    app:layout_constraintEnd_toEndOf="parent"
    app:layout_constraintTop_toTopOf="@+id/tv_text"
    app:srcCompat="@android:drawable/ic_delete" />

    <ImageView
    android:id="@+id/iv_edit"
    android:layout_width="wrap_content"
    android:layout_height="wrap_content"
    android:layout_marginStart="8dp"
    app:layout_constraintBottom_toBottomOf="@+id/tv_text"
    app:layout_constraintStart_toStartOf="parent"
    app:layout_constraintTop_toTopOf="@+id/tv_text"
    app:srcCompat="@android:drawable/ic_menu_preferences" />
<#elseif Estilo == "card_titulo_mensaje">
<TextView
    android:id="@+id/tv_titulo"
    android:layout_width="0dp"
    android:layout_height="wrap_content"
    android:layout_marginStart="8dp"
    android:layout_marginTop="8dp"
    android:layout_marginEnd="8dp"
    android:layout_marginBottom="8dp"
    android:text="TextView"
    app:layout_constraintBottom_toTopOf="@+id/divider"
    app:layout_constraintEnd_toEndOf="parent"
    app:layout_constraintStart_toStartOf="parent"
    app:layout_constraintTop_toTopOf="parent" />

    <TextView
    android:id="@+id/tv_text"
    android:layout_width="0dp"
    android:layout_height="wrap_content"
    android:layout_marginStart="8dp"
    android:layout_marginEnd="8dp"
    android:text="TextView"
    app:layout_constraintEnd_toEndOf="parent"
    app:layout_constraintStart_toStartOf="parent"
    app:layout_constraintTop_toBottomOf="@+id/divider" />

    <View
    android:id="@+id/divider"
    android:layout_width="368dp"
    android:layout_height="1dp"
    android:layout_marginStart="8dp"
    android:layout_marginTop="8dp"
    android:layout_marginEnd="8dp"
    android:layout_marginBottom="8dp"
    android:background="?android:attr/listDivider"
    android:visibility="invisible"
    app:layout_constraintBottom_toBottomOf="parent"
    app:layout_constraintEnd_toEndOf="parent"
    app:layout_constraintStart_toStartOf="parent"
    app:layout_constraintTop_toTopOf="parent" />

<#elseif Estilo == "card_titulo_mensaje_boton">
 <TextView
    android:id="@+id/tv_titulo"
    android:layout_width="0dp"
    android:layout_height="wrap_content"
    android:layout_marginStart="8dp"
    android:layout_marginTop="8dp"
    android:layout_marginEnd="8dp"
    android:layout_marginBottom="8dp"
    android:text="TextView"
    app:layout_constraintBottom_toTopOf="@+id/divider"
    app:layout_constraintEnd_toEndOf="parent"
    app:layout_constraintStart_toStartOf="parent"
    app:layout_constraintTop_toTopOf="parent" />

    <TextView
    android:id="@+id/tv_text"
    android:layout_width="0dp"
    android:layout_height="wrap_content"
    android:layout_marginStart="8dp"
    android:layout_marginEnd="8dp"
    android:text="TextView"
    app:layout_constraintEnd_toEndOf="parent"
    app:layout_constraintStart_toStartOf="parent"
    app:layout_constraintTop_toBottomOf="@+id/divider" />

    <Button
    android:id="@+id/btn_adapter"
    android:layout_width="0dp"
    android:layout_height="wrap_content"
    android:layout_marginTop="24dp"
    android:text="Button"
    app:layout_constraintEnd_toEndOf="@+id/tv_text"
    app:layout_constraintStart_toStartOf="@+id/tv_text"
    app:layout_constraintTop_toBottomOf="@+id/tv_text" />

    <View
    android:id="@+id/divider"
    android:layout_width="368dp"
    android:layout_height="1dp"
    android:layout_marginStart="8dp"
    android:layout_marginTop="8dp"
    android:layout_marginEnd="8dp"
    android:layout_marginBottom="8dp"
    android:background="?android:attr/listDivider"
    android:visibility="invisible"
    app:layout_constraintBottom_toBottomOf="parent"
    app:layout_constraintEnd_toEndOf="parent"
    app:layout_constraintStart_toStartOf="parent"
    app:layout_constraintTop_toTopOf="parent" />

</#if>
        </android.support.constraint.ConstraintLayout>
</android.support.v7.widget.CardView>