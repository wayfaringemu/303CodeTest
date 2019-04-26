//
//  LoadingViewController.swift
//  303CodeTest
//
//  Created by ryan kowalski on 4/25/19.
//  Copyright © 2019 ryan kowalski. All rights reserved.
//

import UIKit

class PeopleViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - Outlets
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var lastFirstLAbel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var headerStackView: UIStackView!
    @IBOutlet weak var tableViewUIView: RoundShadowView!
    @IBOutlet weak var headerUIView: RoundShadowView!
    
    // MARK: - Variables
    
    var json: Any?
    
    override func viewWillAppear(_ animated: Bool) {
        setupView()
        processJson()
    }
    
    func setupView() {
        tableViewUIView.backgroundColor = .clear
        headerUIView.backgroundColor = .clear
        tableView.backgroundColor = .clear
        lastFirstLAbel.text = "Last Name, First"
        lastFirstLAbel.font = .boldSystemFont(ofSize: 17)
        cityLabel.text = "City"
        cityLabel.font = .boldSystemFont(ofSize: 17)
        self.view.backgroundColor = .lightGray
    }
    
    func processJson(){
        if let path = Bundle.main.path(forResource: "download", ofType: "json") {
            
            do {
                let fileUrl = URL(fileURLWithPath: path)
                let data = try Data(contentsOf: fileUrl, options: .mappedIfSafe)
                json = try? JSONSerialization.jsonObject(with: data)
                if let jsonObject = json as? [Any] {
                    for personDict in jsonObject as! [Dictionary<String, String>] {
                        let personObject = PersonObject(dictionary: personDict as NSDictionary)
                        Constants.personArray.append(personObject)
                    }
                }
            } catch {
                showAlert()
            }
        }
    }
    
    // MARK: - Alerts
    
    func showAlert() {
        let alert = UIAlertController(title: "Error Processing Data", message: "Would you like to try again?", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: {action in
            self.processJson()
            self.tableView.reloadData()
        }))
        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
        
        self.present(alert, animated: true)
        
    }
    
    // MARK: - TableView Methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Constants.personArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "PersonCell") as? PersonCell, let lastName = Constants.personArray[indexPath.row].lastNameString {
            cell.lastNameLabel.text = "\(lastName),"
            cell.firstNameLabel.text = Constants.personArray[indexPath.row].firstNameString
            cell.cityLabel.text = Constants.personArray[indexPath.row].cityString
            cell.backgroundColor = .clear
            return cell
        }
        return UITableViewCell()
    }
}

// MARK: - UITableViewCell

class PersonCell: UITableViewCell {
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
}

