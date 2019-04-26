//
//  LoadingViewController.swift
//  303CodeTest
//
//  Created by ryan kowalski on 4/25/19.
//  Copyright © 2019 ryan kowalski. All rights reserved.
//

import UIKit

class LoadingViewController: UIViewController {
    var json: Any?

    override func viewDidLoad() {
        super.viewDidLoad()
        processJson()
    }
    
    func processJson(){
        if let path = Bundle.main.path(forResource: "download", ofType: "json") {
            
            do {
                let fileUrl = URL(fileURLWithPath: path)
                // Getting data from JSON file using the file URL
                let data = try Data(contentsOf: fileUrl, options: .mappedIfSafe)
                json = try? JSONSerialization.jsonObject(with: data)
                if let jsonObject = json as? [Any] {
                    for personDict in jsonObject as! [Dictionary<String, String>] {
                        let personObject = PersonObject(dictionary: personDict as NSDictionary)
                        Constants.personArray.append(personObject)
                    }
                    print(Constants.personArray)
                }
            } catch {
                // Handle error here
            }
        }
    }
    
    
}
