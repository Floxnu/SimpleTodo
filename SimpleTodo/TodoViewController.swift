//
//  ViewController.swift
//  SimpleTodo
//
//  Created by admin on 2019-05-01.
//  Copyright © 2019 JValencia. All rights reserved.
//

import UIKit

struct PriorityLevel {
    let levelName: String
    var todos: [Todo]
}


class TodoViewController: UITableViewController, AddTodoViewCotrollerDelegate {
    
    func addTodoDidFinish(_ todo: String, _ description: String) {
        sectionHeaders[1].todos.append(Todo.init(title: todo, todoDescription: description , taskPriority: .mediumPriority, isTaskComplete: false))
        tableView.reloadData()
    }
    
    func addTodoDidCancel() {
        return
    }
    

    var todoList: [Todo] = [Todo.init(title: "Assigment 6", todoDescription: "Do the assignment for the thing", taskPriority: .highPriority, isTaskComplete: false),Todo.init(title: "Go Home", todoDescription: "This thing is working now", taskPriority: .mediumPriority, isTaskComplete: false)]
    
    var sectionHeaders: [PriorityLevel] = [PriorityLevel.init(levelName: "High Priority", todos: []), PriorityLevel.init(levelName: "Medium Priority", todos: [Todo.init(title: "Assigment 6", todoDescription: "Do the assignment for the thing", taskPriority: .highPriority, isTaskComplete: false),Todo.init(title: "Go Home", todoDescription: "This thing is working now", taskPriority: .mediumPriority, isTaskComplete: false)]), PriorityLevel.init(levelName: "Low Priority", todos: []), PriorityLevel.init(levelName: "Complete", todos: [])]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.register(TodoTableViewCell.self, forCellReuseIdentifier: "todo")
        
        navigationItem.title = "Todo"
        
//      navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTodo))
//      navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: nil)
        navigationItem.rightBarButtonItems = [UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTodo)), editButtonItem]
        tableView.allowsMultipleSelectionDuringEditing = true
        
    }
    
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        let detailsViewToShow = DetailsViewController()
        detailsViewToShow.todoCellInfo = sectionHeaders[indexPath.section].todos[indexPath.row]
        navigationController?.pushViewController(detailsViewToShow, animated: true)
    }
    
    
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        tableView.setEditing(editing, animated: animated)
        if editing{
            navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Delete", style: .done, target: self, action: #selector(deleteSelectedRows))
        } else {
            navigationItem.leftBarButtonItem = nil
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let current = sectionHeaders[section]
        return current.levelName
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sectionHeaders.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let current = sectionHeaders[section]
        return current.todos.count
    }
    
    @objc func addTodo(){
        
        let addTodoVC = AddTodoViewController()
        addTodoVC.delegate = self
        navigationController?.pushViewController(addTodoVC, animated: true)
        
    }
    
    @objc func deleteSelectedRows (){
        if let selectedRows = tableView.indexPathsForSelectedRows {
            if selectedRows.count > 0 {
                
                    selectedRows.forEach { (index) in
                        sectionHeaders[index.section].todos.remove(at: index.row)
                    }
                
                    tableView.endEditing(false)
                
                    tableView.beginUpdates()
                    tableView.deleteRows(at: selectedRows, with: .automatic)
                    tableView.endUpdates()
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "todo", for: indexPath) as! TodoTableViewCell
        let current = sectionHeaders[indexPath.section]
        cell.todoCellInfo = current.todos[indexPath.row]
        cell.backgroundColor = UIColor.white
        cell.accessoryType = .detailDisclosureButton
        return cell
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {

        let todoToMove = sectionHeaders[sourceIndexPath.section].todos.remove(at: sourceIndexPath.row)
        sectionHeaders[destinationIndexPath.section].todos.insert(todoToMove, at: destinationIndexPath.row)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .delete:
            sectionHeaders[indexPath.section].todos.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            return
        default:
            return
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if isEditing == false{
            
            let selectedInfo = sectionHeaders[indexPath.section].todos[indexPath.row]
            if selectedInfo.isTaskComplete {
                let todoToMove = sectionHeaders[indexPath.section].todos.remove(at: indexPath.row)
                sectionHeaders[3].todos.append(todoToMove)
                tableView.moveRow(at: indexPath, to: IndexPath(row: sectionHeaders[3].todos.count - 1, section: 3 ))
            } else {
                let todoToMove = sectionHeaders[indexPath.section].todos.remove(at: indexPath.row)
                sectionHeaders[2].todos.append(todoToMove)
                tableView.moveRow(at: indexPath,to: IndexPath(row: sectionHeaders[2].todos.count - 1, section: 2) )
            }
        }
    }
}

