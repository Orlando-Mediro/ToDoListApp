//
//  AddTaskView.swift
//  ToDoListApp
//
//  Created by Orlando Medina Rodriguez on 12/5/24.
//

import SwiftUI

struct AddTaskView: View {
    @ObservedObject var viewModel: TaskViewModel
    @Binding var isPresented: Bool
    
    @State private var title: String = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Enter the name of the task")){
                    TextField("title", text: $title)
                }
            }
            .navigationTitle("Add New Task")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add") {
                        let trimmedTitle = title.trimmingCharacters(in: .whitespaces)
                        if !trimmedTitle.isEmpty {
                            viewModel.addTask(title: trimmedTitle)
                            isPresented = false
                        }
                    }
                    .disabled(title.trimmingCharacters(in: .whitespaces).isEmpty)
                }
                
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        isPresented = false
                    }
                }
            }
        }
    }
}

struct AddNoteView_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskView(viewModel: TaskViewModel(), isPresented: .constant(true))
    }
}
