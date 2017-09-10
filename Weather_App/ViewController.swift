//
//  ViewController.swift
//  Weather_App
//
//  Created by Durodola, Habib on 2017-09-09.
//  Copyright © 2017 Durodola, Habib. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func load(_ sender: UIButton) {
        getLocationApi();
    }
    let urlString = URL(string: "http://jsonplaceholder.typicode.com/users/1")
    
    override func viewDidLoad() {
        // Do any additional setup after loading the view, typically from a nib.
        
        
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getLocationApi(){
        _ = [String]()
        var namesArray = [String]()
        if let url = urlString {
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                if error !=  nil {
                    print(error as Any)
                    print("variable")
                } else {
                    
                    do {
                        if data != nil {
                            let json = try JSONSerialization.jsonObject(with: data!) as! [String: AnyObject]
                            _ = json["name"] as? String
                            let username = json["username"] as? String
                            let email = json["email"] as? String
                            let address = json["address"] as? [String : AnyObject]
                            let street = address?["street"] as? String
            
                            let geo = address?["geo"] as? [String : AnyObject]
                            let lat = geo?["lat"] as? String
                            
                            if let names = json["name"] as? String
                            {
                                namesArray.append(names)
                                namesArray.append(username!)
                                namesArray.append(email!)
                                namesArray.append(street!)
                                namesArray.append(lat!)
                                
                                
                                print(names)
                                print("olawepo in ")
                            }
                        }
                        
                        print(namesArray)
                    }
                    catch {
                        
                    }
                }
                
            }
            task.resume()
        }
        
    }
    
}

