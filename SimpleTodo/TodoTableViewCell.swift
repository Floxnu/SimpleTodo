//
//  TodoTableViewCell.swift
//  SimpleTodo
//
//  Created by admin on 2019-05-01.
//  Copyright © 2019 JValencia. All rights reserved.
//

import UIKit

class TodoTableViewCell: UITableViewCell {

//    ///
//    let taskName: UILabel = {
//        let lb = UILabel()
//        lb.text = "TaskName"
//        return lb
//    } ()
//
//    let taskShortDescription: UILabel = {
//        let lb = UILabel()
//        lb.text = "This is a short description"
//        return lb
//    } ()
//
//    let checkBox: UISwitch = {
//        let sw = UISwitch()
//        sw.isOn = false
//        return sw
//    } ()
    
    var todoCellInfo: Todo! {
        didSet {
//            taskName.text = todoCellInfo?.title
//            taskShortDescription.text = todoCellInfo?.todoDescription
//            checkBox.isOn = todoCellInfo!.isTaskComplete
            textLabel?.text = todoCellInfo?.title
            detailTextLabel?.text = todoCellInfo?.todoDescription
            
            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }


    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: UITableViewCellStyle.subtitle, reuseIdentifier: reuseIdentifier)
        self.textLabel?.text = "This is a text"
        self.detailTextLabel?.text = "This is a loger detail text"
        
        self.selectionStyle = UITableViewCellSelectionStyle.default
        
        var image = UIImage.init(named: "checkEmpty")
        image = image?.resizeImage(targetSize: CGSize(width: 30, height: 30))
        self.imageView?.image = image

    }
    
    func refreshInfo(){
        if todoCellInfo.isTaskComplete {
            var image = UIImage.init(named: "checkFilled")
            image = image?.resizeImage(targetSize: CGSize(width: 30, height: 30))
            self.imageView?.image = image
        } else {
            var image = UIImage.init(named: "checkEmpty")
            image = image?.resizeImage(targetSize: CGSize(width: 30, height: 30))
            self.imageView?.image = image
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: true)
        if isEditing == false {
            if selected{
                if todoCellInfo.isTaskComplete {
                    todoCellInfo.isTaskComplete = false
                } else {
                    todoCellInfo.isTaskComplete = true
                }
                
            }
            
            refreshInfo()
        
        }
    }
    
    

}

import UIKit
extension UIImage {
    func resizeImage(targetSize: CGSize) -> UIImage {
        let size = self.size
        let widthRatio  = targetSize.width  / size.width
        let heightRatio = targetSize.height / size.height
        let newSize = widthRatio > heightRatio ?  CGSize(width: size.width * heightRatio, height: size.height * heightRatio) : CGSize(width: size.width * widthRatio,  height: size.height * widthRatio)
        let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
        
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        self.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }
}
