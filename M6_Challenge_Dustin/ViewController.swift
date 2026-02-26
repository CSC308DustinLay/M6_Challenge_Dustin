//
//  ViewController.swift
//  M6_Challenge_Dustin
//
//  Created by Heather Bishop on 2/26/26.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var modeControl: UISegmentedControl!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var ageField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    
    @IBAction func resultButton(_ sender: Any)
    {
        
    }
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        resultLabel.text = " Try it Out!"
        ageField.keyboardType = .numberPad
    }
    
    //models
    class Person
    {
        var name: String
        var age: Int
        
        init(name: String, age: Int)
        {
            self.name = name
            self.age = age
        }
        
        convenience init()
        {
            self.init(name: "Anonymous", age: 0)
        }
        convenience init(name: String)
        {
            self.init(name: name, age: 0)
        }
        convenience init(name: String, using age: Int)
        {
            self.init(name: name, age: age)
        }
    }
    
    class validatedPerson
    {
        let name: String
        let age: Int
        
        init?(name: String, age: Int)
        {
            guard !name.isEmpty, age > 0 else { return nil }
            
            self.name = name
            self.age = age
        }
    }
}

