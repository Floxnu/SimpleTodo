//
//  Todo.swift
//  SimpleTodo
//
//  Created by admin on 2019-05-01.
//  Copyright © 2019 JValencia. All rights reserved.
//

import Foundation

enum taskPriority {
    case highPriority
    case mediumPriority
    case lowPriority
    case completed
}

class Todo {
    let title: String 
    let todoDescription: String
    var taskPriority: taskPriority
    var isTaskComplete: Bool
    
    init(title: String, todoDescription: String, taskPriority: taskPriority, isTaskComplete: Bool) {
        self.title = title
        self.todoDescription = todoDescription
        self.taskPriority = taskPriority
        self.isTaskComplete = isTaskComplete
    }
}
