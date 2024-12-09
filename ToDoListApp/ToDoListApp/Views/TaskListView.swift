//
//  ToDoListView.swift
//  ToDoListApp
//
//  Created by Orlando Medina Rodriguez on 12/5/24.
//

import SwiftUI

struct ToDoListView: View {
    @StateObject var viewModel = TaskViewModel()
    @State var showingAddTask = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.tasks) { task in
                    HStack {
                        TaskRowView(viewModel: viewModel, task: task)
                    }
                }
                .onDelete(perform: viewModel.deleteTask)
            }
            .navigationTitle("To-Do List")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        showingAddTask = true
                    }) {
                        Image(systemName: "plus")
                    }
                }
                
                ToolbarItem(placement: .topBarLeading) {
                    EditButton()
                }
            }
            .sheet(isPresented: $showingAddTask) {
                AddTaskView(viewModel: viewModel, isPresented: $showingAddTask)
            }
        }
    }
}

struct TaskListView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView()
    }
}
