<?xml version="1.0" encoding="utf-8"?>
<ScrollView xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    android:background="#F4EBFB"
    android:fillViewport="true">

    <LinearLayout
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:orientation="vertical"
        android:padding="24dp">

        <ImageView
            android:id="@+id/imgCatHeader"
            android:layout_width="match_parent"
            android:layout_height="180dp"
            android:layout_marginTop="16dp"
            android:contentDescription="Cat Header"
            android:scaleType="fitCenter"
            android:src="@drawable/cat_header" />

        <TextView
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:layout_marginTop="20dp"
            android:text="Hey There,\nYou're back!"
            android:textColor="#673AB7"
            android:textSize="28sp"
            android:textStyle="bold" />

        <TextView
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:layout_marginTop="24dp"
            android:text="email"
            android:textColor="#212121"
            android:textSize="14sp" />

        <EditText
            android:id="@+id/etEmail"
            android:layout_width="match_parent"
            android:layout_height="50dp"
            android:layout_marginTop="6dp"
            android:background="@drawable/bg_rounded_input"
            android:inputType="textEmailAddress"
            android:paddingHorizontal="16dp"
            android:textColor="#212121"
            android:textSize="14sp" />

        <TextView
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:layout_marginTop="16dp"
            android:text="Password"
            android:textColor="#212121"
            android:textSize="14sp" />

        <EditText
            android:id="@+id/etPassword"
            android:layout_width="match_parent"
            android:layout_height="50dp"
            android:layout_marginTop="6dp"
            android:background="@drawable/bg_rounded_input"
            android:inputType="textPassword"
            android:paddingHorizontal="16dp"
            android:textColor="#212121"
            android:textSize="14sp" />

        <Button
            android:id="@+id/btnLogin"
            android:layout_width="match_parent"
            android:layout_height="54dp"
            android:layout_marginTop="32dp"
            android:background="@drawable/bg_rounded_button"
            android:text="LOGIN"
            android:textAllCaps="true"
            android:textColor="#FFFFFF"
            android:textSize="16sp"
            android:textStyle="bold"
            app:backgroundTint="@null" />

    </LinearLayout>
</ScrollView>


package com.example.uts_jacques // Sesuaikan package name lo

import android.content.Intent
import android.os.Bundle
import android.widget.Button
import android.widget.EditText
import android.widget.Toast
import androidx.appcompat.app.AppCompatActivity

class LoginActivity : AppCompatActivity() {

    private lateinit var etEmail: EditText
    private lateinit var etPassword: EditText
    private lateinit var btnLogin: Button

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_login)

        etEmail = findViewById(R.id.etEmail)
        etPassword = findViewById(R.id.etPassword)
        btnLogin = findViewById(R.id.btnLogin)

        btnLogin.setOnClickListener {
            val email = etEmail.text.toString().trim()
            val password = etPassword.text.toString().trim()

            if (email.isEmpty()) {
                etEmail.error = "Email tidak boleh kosong"
                etEmail.requestFocus()
                return@setOnClickListener
            }

            if (password.isEmpty()) {
                etPassword.error = "Password tidak boleh kosong"
                etPassword.requestFocus()
                return@setOnClickListener
            }

            Toast.makeText(this, "Login Berhasil!", Toast.LENGTH_SHORT).show()

            val username = if (email.contains("@")) email.split("@")[0] else email
            val intent = Intent(this, HomeActivity::class.java).apply {
                putExtra("USER_NAME", username)
            }
            startActivity(intent)
            finish()
        }
    }
}
