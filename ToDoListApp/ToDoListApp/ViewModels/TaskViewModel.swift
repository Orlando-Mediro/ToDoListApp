//
//  TaskViewModel.swift
//  ToDoListApp
//
//  Created by Orlando Medina Rodriguez on 12/5/24.
//

import SwiftUI

class TaskViewModel: ObservableObject {
    @Published var tasks: [Task] = []
    
    private let tasksKey = "task_key"
    
    init() {
        loadTasks()
    }
    
    // MARK: CRUD Functions
    func addTask(title: String) {
        let newTask = Task(title: title, isCompleted: false)
        tasks.append(newTask)
        saveTasks()
    }
    
    func deleteTask(at offsets: IndexSet) {
        tasks.remove(atOffsets: offsets)
        saveTasks()
    }
    
    func updateTask(task: Task, title: String, isCompleted: Bool) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks[index].isCompleted.toggle()
            saveTasks()
        }
    }
    
    // MARK: - Data Persistence using UserDefaults

    // Save notes to UserDefaults
    private func saveTasks() {
        do {
            let encodedData = try JSONEncoder().encode(tasks)
            UserDefaults.standard.set(encodedData, forKey: tasksKey)
        } catch {
            print("Error encoding notes: \(error)")
        }
    }

    // Load notes from UserDefaults
    private func loadTasks() {
        if let savedData = UserDefaults.standard.data(forKey: tasksKey) {
            do {
                tasks = try JSONDecoder().decode([Task].self, from: savedData)
            } catch {
                print("Error decoding notes: \(error)")
                tasks = []
            }
        }
    }
}
