//
//  Extensions.swift
//  CollectionViewMockUp
//
//  Created by Emir haktan Ozturk on 18.02.2018.
//  Copyright © 2018 emirhaktan. All rights reserved.
//

import UIKit

extension UIColor {
    static func rgb(red:CGFloat, green: CGFloat, blue:CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
}

extension UIView {
    func addConstraintsWithFormat(format:String, options:NSLayoutFormatOptions, views:UIView...){
        var viewsDictionary = [String:UIView]()
        for (index,view) in views.enumerated(){
            let key = "v\(index)"
            view.translatesAutoresizingMaskIntoConstraints = false
            viewsDictionary[key] = view
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: options, metrics: nil, views:viewsDictionary))
    }
}

extension UICollectionViewCell{
    func createAlert(title:String, message:String, actionTitle:String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: actionTitle, style: UIAlertActionStyle.default, handler: nil))
        self.window?.rootViewController?.present(alert, animated: true, completion: nil)
    }
}

extension UICollectionViewController{
    func createAlert(title:String, message:String, actionTitle:String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: actionTitle, style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

