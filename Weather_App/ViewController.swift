//
//  ViewController.swift
//  Weather_App
//
//  Created by Durodola, Habib on 2017-09-09.
//  Copyright © 2017 Durodola, Habib. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var names: [String] = []
    var contacts: [String] = []
    
    @IBAction func load(_ sender: UIButton) {
        getWeatherApi();
    }
  // let urlString = URL(string: "http://samples.openweathermap.org/data/2.5/forecast?id=524901&appid=6e65fa567cc8107e28d13c931dce5db7")
     let urlString=URL(string:"http://api.androidhive.info/contacts/")
    
    override func viewDidLoad() {
        // Do any additional setup after loading the view, typically from a nib.
        
        
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getWeatherApi(){
        _ = [String]()
        _ = [String]()
        if let url = urlString {
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                if error !=  nil {
                    print(error as Any)
                    print("variable")
                } else {
                    
                    do {
                        if data != nil {
                          //  let json = try JSONSerialization.jsonObject(with: data!) as! [String: AnyObject]
                            let allContactsData = try Data(contentsOf: url)
                            let allContacts = try JSONSerialization.jsonObject(with: allContactsData, options: JSONSerialization.ReadingOptions.allowFragments) as! [String : AnyObject]
                            if let arrJSON = allContacts["contacts"] {
                                for index in 0...arrJSON.count-1 {
                                    let aObject = arrJSON[index] as! [String : AnyObject]
                                    self.names.append(aObject["name"] as! String)
                                    self.contacts.append(aObject["email"] as! String)
                                }
                            }
                            print(self.names)
                            print(self.contacts)
                            
                            
                            //                            let username = json["username"] as? String
                            //                            let email = json["email"] as? String
                            //                            let address = json["address"] as? [String : AnyObject]
                            //                            let street = address?["street"] as? String
                            //                            let geo = address?["geo"] as? [String : AnyObject]
                            //                            let lat = geo?["lat"] as? String
                            //
                            //                            if let names = json["name"] as? String
                            //                            {
                            //                                namesArray.append(names)
                            //                                namesArray.append(username!)
                            //                                namesArray.append(email!)
                            //                                namesArray.append(street!)
                            //                                namesArray.append(lat!)
                            //
                            //
                            //                                print(names)
                            //                                print("olawepo in ")
                            //                            }
                        }
                        
                        // print(namesArray)
                    }
                    catch {
                        
                    }
                }
                
            }
            task.resume()
        }
        
    }
    
}

