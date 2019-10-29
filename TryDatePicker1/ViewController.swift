//
//  ViewController.swift
//  TryDatePicker1
//
//  Created by Van Le on 10/29/19.
//  Copyright © 2019 ITPS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    let datePicker = UIDatePicker()
    let toolbar = UIToolbar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        datePicker.datePickerMode = .date
        textField.inputView = datePicker
        
        setupToolbar()
    }
    
    // Toolbar
    func setupToolbar() {
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneAction))
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelAction))
        
        toolbar.setItems([cancelButton, flexSpace, doneButton], animated: true)
        textField.inputAccessoryView = toolbar
    }
    
    @objc func doneAction() {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        textField.text = formatter.string(from: datePicker.date)
        view.endEditing(true)
    }
    @objc func cancelAction() {
        self.view.endEditing(true)
    }

}

