//
//  SecondViewController.swift
//  ProtocolDelegation
//
//  Created by iDeveloper2 on 14/05/18.
//  Copyright © 2018 iDeveloper2. All rights reserved.
//

import UIKit

protocol UPdateTableViewDelegate: class {
    func updatetableviewresponse(langname:String, index: Int?)
}

class SecondViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    var delegate: UPdateTableViewDelegate?
    var langname:String?
    var index:Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.textField.text = self.langname
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func submitbutton(_ sender: UIButton) {
        self.delegate?.updatetableviewresponse(langname: self.textField.text!, index: self.index)
        _ = self.navigationController?.popViewController(animated: true)
    }
    

}
