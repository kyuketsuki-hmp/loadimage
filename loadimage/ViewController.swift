//
//  ViewController.swift
//  loadimage
//
//  Created by mic-student5 on 8/25/19.
//  Copyright © 2019 mic. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func loadImage(_ sender: UIButton) {
        
        //URlSession - ios 9
        
        let address = "https://img.kpopmap.com/2018/04/TWICE-Quiz-1.jpg"
        
        if let myurl = URL(string: address){
        
        var request = URLRequest(url : myurl)
            
        request.httpMethod = "GET" //POST,PUT,PATCH,DEL
        let session = URLSession(configuration: URLSessionConfiguration.default)
        
        let task =  session.dataTask(with: request) { (data, response, error) in
                
                if error == nil {
                    
                    if data != nil {
                        //Thread will be handle by IOS
                        //OperationQueue must be used after IOS 10
                        
                        //jump back to main thread
                        OperationQueue.main.addOperation {
                        
                        
                        let image = UIImage(data: data!)
                        
                        self.imageView.image = image
                        }
                    }
                    else {
                        print ("No Image Data")
                    
                }
                } else{
                    print(error?.localizedDescription)
            }
            }
            
            task.resume()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

