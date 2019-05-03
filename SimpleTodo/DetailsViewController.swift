//
//  DetailsViewController.swift
//  SimpleTodo
//
//  Created by admin on 2019-05-03.
//  Copyright © 2019 JValencia. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    let titleLabel: UILabel = {
        let lab = UILabel()
        lab.text = "Task Details:"
        lab.textColor = .black
        lab.font = UIFont.boldSystemFont(ofSize: 20)
        return lab
    } ()
    
    let nameLabel: UILabel = {
        let lab = UILabel()
        lab.text = "Task Name"
        lab.textColor = .black
        lab.font = UIFont.systemFont(ofSize: 18)
        return lab
    } ()
    
    let descriptionLabel: UILabel = {
        let lab = UILabel()
        lab.text = "Lorem Ipsum task decription text"
        lab.textColor = UIColor.darkGray
        lab.font = UIFont.systemFont(ofSize: 15)
        return lab
    } ()
    
    var todoCellInfo: Todo? {
        didSet {
            nameLabel.text = todoCellInfo?.title
            descriptionLabel.text = todoCellInfo?.todoDescription
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        let stackView = UIStackView(arrangedSubviews: [titleLabel, nameLabel, descriptionLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 30
        view.addSubview(stackView)
        
        // constraints
        
        stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
