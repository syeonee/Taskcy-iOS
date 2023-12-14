//
//  Task.swift
//  Taskcy
//
//  Created by 김시연 on 2023/12/01.
//

import Foundation

struct Task : Codable, Equatable {
    var name: String
    var date: String
    var startTime: String?
    var endTime: String?
    var status: Status
    
    mutating func update(name: String, date: String, startTime: String?, endTime: String?, status: Status) {
        self.name = name
        self.date = date
        self.startTime = name
        self.endTime = date
        self.status = status
    }
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.name == rhs.name && lhs.date == rhs.date
    }
}

enum Status: String, Codable {
    case todo = "todo"
    case ongoing = "ongoing"
    case complete = "complete"
    
}

class TaskManager {
    
    static let shared = TaskManager()
    
    var tasks: [Task] = []
    
    func createTask(name: String, date: String, startTime: String?, endTime: String?, status: Status) -> Task {
        return Task(name: name, date: date, startTime: startTime, endTime: endTime, status: status)
    }
    
    func addTask(_ task: Task) {
        tasks.append(task)
        saveTask()
    }
    
    func deleteTask(_ task: Task) {
        tasks = tasks.filter { $0.name != task.name && $0.date != task.date }

        saveTask()
    }
    
    func updateTask(_ task: Task) {
        guard let index = tasks.firstIndex(of: task) else { return }
        tasks[index].update(name: task.name, date: task.date, startTime: task.startTime, endTime: task.endTime, status: task.status)
        saveTask()
    }
    
    func saveTask() {
        Storage.store(tasks, to: .documents, as: "tasks.json")
    }
    
    func retrieveTask() {
        tasks = Storage.retrive("tasks.json", from: .documents, as: [Task].self) ?? []
    }
}

class TaskViewModel {
    
    private let manager = TaskManager.shared
    
    var tasks: [Task] {
        return manager.tasks
    }
    
    var todos: [Task] {
        return tasks.filter { $0.startTime == "" }
    }
    
    var events: [Task] {
        return tasks.filter { $0.startTime != "" }
    }
    
    
    func addTask(_ task: Task) {
        manager.addTask(task)
    }
    
    func deleteTask(_ task: Task) {
        manager.deleteTask(task)
    }
    
    func updateTask(_ task: Task) {
        manager.updateTask(task)
    }
    
    func loadTasks() {
        manager.retrieveTask()
    }
}
