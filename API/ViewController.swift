//
//  ViewController.swift
//  API
//
//  Created by Yazan Alraddadi on 09/04/1443 AH.
//

import UIKit
struct Facts : Codable {
    var fact: String
}
class ViewController: UIViewController {
    
   

    override func viewDidLoad() {
        super.viewDidLoad()
        
        getCharacters ()
    }
    func getCharacters () {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "dog-facts-api.herokuapp.com"
        urlComponents.path = "/api/v1/resources/dogs/all"
        var urlRequest = URLRequest (url:urlComponents.url!)
        let urlSession = URLSession.shared
        let task = urlSession.dataTask(with: urlRequest) { (data: Data?, response: URLResponse?, error: Error?) in
            do {
                let JSONDecoder = JSONDecoder()
                let Characters = try JSONDecoder.decode([Facts].self, from: data!)
                print (Characters)
            }
            catch {
                print("err:\(error)")
            }
            }
        task.resume()
        
            
        }
        
        
        // Do any additional setup after loading the view.
    }




