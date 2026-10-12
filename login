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
            android:layout_marginTop="24dp"
            android:contentDescription="Cat Header"
            android:scaleType="fitCenter"
            android:src="@drawable/cat_header" />

        <TextView
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:layout_marginTop="24dp"
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
