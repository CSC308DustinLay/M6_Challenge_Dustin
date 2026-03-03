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
        let nameRaw = nameField.text ?? ""
        let ageRaw = ageField.text ?? ""
        
        switch modeControl.selectedSegmentIndex
        {
        case 0:
            guard !nameRaw.isEmpty, !ageRaw.isEmpty, let age = Int(ageRaw) else
            {
                showAlert(title: "Error", message: "Ensure all fields are vaild")
                return
            }
            let p = Person(name: nameRaw, age: age)
            resultLabel.text = "Designated -> \(p.name), \(p.age)"
            
        case 1:
            if nameRaw.isEmpty
            {
                let p = Person()
                resultLabel.text = "Convenince -> \(p.name), \(p.age)"
                return
            }
            
            if ageRaw.isEmpty
            {
                let p = Person(name: nameRaw)
                resultLabel.text = "Convenince2 -> \(p.name), \(p.age)"
                return
            }
            
            if let age = Int(ageRaw)
            {
                let p = Person(name: nameRaw, age: age)
                resultLabel.text = "Convenince3 -> \(p.name), \(p.age)"
            }
            else
            {
                showAlert(title: "Invaild", message: "Age must be number")
            }
            
        case 2:
            guard !nameRaw.isEmpty, !ageRaw.isEmpty, let age = Int(ageRaw) else
            {
                showAlert(title: "Error", message: "Ensure all fields are vaild")
                return
            }
            if let vp = validatedPerson(name: nameRaw, age: age)
            {
                resultLabel.text = "Failable -> \(vp.name), \(vp.age)"
            }
            
            
        default:
            break
        }
    }
    
    func showAlert(title: String, message: String)
    {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
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

