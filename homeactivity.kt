package com.example.uts_jacques

import android.os.Bundle
import android.widget.Button
import android.widget.EditText
import android.widget.TextView
import android.widget.Toast
import androidx.appcompat.app.AppCompatActivity
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView

class HomeActivity : AppCompatActivity() {

    private lateinit var tvHeaderName: TextView
    private lateinit var tvSummary: TextView
    private lateinit var etTaskInput: EditText
    private lateinit var btnAdd: Button
    private lateinit var rvTasks: RecyclerView

    private val taskList = mutableListOf<TaskModel>()
    private lateinit var adapter: TaskAdapter

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_home)

        tvHeaderName = findViewById(R.id.tvHeaderName)
        tvSummary = findViewById(R.id.tvSummary)
        etTaskInput = findViewById(R.id.etTaskInput)
        btnAdd = findViewById(R.id.btnAdd)
        rvTasks = findViewById(R.id.rvTasks)

        val name = intent.getStringExtra("USER_NAME")
        tvHeaderName.text = if (!name.isNullOrEmpty()) "Hello, $name" else "Hello, dess"

        adapter = TaskAdapter(
            taskList = taskList,
            onDeleteClick = { position ->
                if (position in taskList.indices) {
                    taskList.removeAt(position)
                    adapter.notifyItemRemoved(position)
                    adapter.notifyItemRangeChanged(position, taskList.size)
                    updateSummary()
                }
            },
            onStatusChange = {
                updateSummary()
            }
        )

        rvTasks.layoutManager = LinearLayoutManager(this)
        rvTasks.adapter = adapter

        btnAdd.setOnClickListener {
            val taskText = etTaskInput.text.toString().trim()
            if (taskText.isNotEmpty()) {
                taskList.add(TaskModel(taskText))
                adapter.notifyItemInserted(taskList.size - 1)
                etTaskInput.setText("")
                updateSummary()
                Toast.makeText(this, "Tugas berhasil ditambahkan", Toast.LENGTH_SHORT).show()
            } else {
                Toast.makeText(this, "Isi tugas terlebih dahulu", Toast.LENGTH_SHORT).show()
            }
        }

        updateSummary()
    }

    private fun updateSummary() {
        val completed = taskList.count { it.isCompleted }
        val uncompleted = taskList.size - completed
        tvSummary.text = "Completed: $completed | Uncompleted: $uncompleted"
    }
}
