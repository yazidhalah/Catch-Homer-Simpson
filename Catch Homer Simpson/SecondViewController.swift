//
//  SecondViewController.swift
//  Catch Homer Simpson
//
//  Created by Maverick on 1/3/20.
//  Copyright © 2020 Maverick. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var textImageView: UIImageView!
    @IBOutlet weak var StartButon: UIImageView!
    
    var textTimer = Timer()
    var count = 12
    
    override func viewDidLoad() {
        super.viewDidLoad()

        StartButon.isUserInteractionEnabled = true
        let StartButtonReco = UITapGestureRecognizer(target: self, action: #selector (SecondViewController.StartGame))
        
        StartButon.addGestureRecognizer(StartButtonReco)
            
        
        textTimer = Timer.scheduledTimer(timeInterval: 0.8, target: self, selector: #selector (SecondViewController.ChangeText), userInfo: nil, repeats: true)
        
    }
    
    @objc func ChangeText(){
        
        count -= 1
        
        if count == 0 {
            performSegue(withIdentifier: "StartGame", sender: nil)
            
        }else if count == 9 {
            textImageView.image = UIImage(named: "text2.png")
        }else if count == 6 {
            textImageView.image = UIImage(named: "text3.png")
        }else if count == 3{
            textImageView.image = UIImage(named: "text4.png")
        }
        
        
    }
    
    @objc func StartGame(){
        
        performSegue(withIdentifier: "StartGame", sender: nil)
    }
    

}
