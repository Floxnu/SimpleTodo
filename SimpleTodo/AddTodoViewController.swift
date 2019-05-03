//
//  AddTodoViewController.swift
//  SimpleTodo
//
//  Created by admin on 2019-05-02.
//  Copyright © 2019 JValencia. All rights reserved.
//
import UIKit

protocol AddTodoViewCotrollerDelegate {
    func addTodoDidFinish(_ todo: String, _ description: String)
    func addTodoDidCancel()
}

class AddTodoViewController: UIViewController {
    
    var delegate: AddTodoViewCotrollerDelegate?
    
    let descriptionLabel: UILabel = {
        let lab = UILabel()
        lab.text = "Enter Task Name:"
        lab.textColor = .black
        lab.font = UIFont.boldSystemFont(ofSize: 20)
        return lab
    } ()
    
    let todoTextField: UITextField = {
        let tf = UITextField(frame: .zero)
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Enter here..."
        return tf
    }()
    
    let detailLabel: UILabel = {
        let lab = UILabel()
        lab.text = "Task Description:"
        lab.textColor = .darkGray
        lab.font = UIFont.boldSystemFont(ofSize: 18)
        return lab
    } ()
    
    let descriptionTextField: UITextField = {
        let tf = UITextField(frame: .zero)
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Enter description..."
        return tf
    }()
    
    fileprivate func setUpUI() {
        view.backgroundColor = .white
        let stackView = UIStackView(arrangedSubviews: [descriptionLabel, todoTextField, detailLabel, descriptionTextField])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 30
        view.addSubview(stackView)
        
        // constraints
        
        stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        navigationItem.title = "Add Todo"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(didAddTodo))
    }
    
    
    
    @objc fileprivate func didAddTodo(){
        if let todo = todoTextField.text {
            delegate?.addTodoDidFinish(todo, descriptionTextField.text!)
            navigationController?.popViewController(animated: true)
        }
    }
    
}
