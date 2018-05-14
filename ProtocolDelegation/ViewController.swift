//
//  ViewController.swift
//  ProtocolDelegation
//
//  Created by iDeveloper2 on 14/05/18.
//  Copyright © 2018 iDeveloper2. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var langName = [String]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.langName = ["Swift", "Java","C"]
        self.tableView.delegate = self
        self.tableView.dataSource = self

        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(self.addlang))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Prepare segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "nextsegue" else {
            return
        }
        let gonext = segue.destination as! SecondViewController
        gonext.delegate = self
        if let index = sender as? Int {
            gonext.langname = self.langName[index]
            gonext.index = index
        }
    }
    
    @objc func addlang() {
        self.performSegue(withIdentifier: "nextsegue", sender: nil)
    }
    
}

// MARK: - UITableview delegate
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.langName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = self.langName[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "nextsegue", sender: indexPath.row)
    }
    
}

// MARK: - Updatetableview delegate
extension ViewController: UPdateTableViewDelegate {
    func updatetableviewresponse(langname: String, index: Int?) {
        guard let index = index else {
            self.langName.append(langname)
            return
        }
        self.langName[index] = langname
    }
}


