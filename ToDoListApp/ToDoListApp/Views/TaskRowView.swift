//
//  TaskRowView.swift
//  ToDoListApp
//
//  Created by Orlando Medina Rodriguez on 12/5/24.
//

import SwiftUI

struct TaskRowView: View {
    @ObservedObject var viewModel: TaskViewModel
    var task: Task
    
    var body: some View {
        HStack {
            //Checkbox
            Image(systemName: task.isCompleted ? "checkmark.square" : "square")
                .onTapGesture {
                    viewModel.updateTask(task: task, title: task.title, isCompleted: !task.isCompleted)
                }
            
            Text(task.title)
                .font(.headline)
        }
    }
}

struct TaskRowView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = TaskViewModel()
        TaskRowView(viewModel: viewModel, task: Task(title: "This is a sample task", isCompleted: false))
            .previewLayout(.sizeThatFits)
    }
}
