//
//  FirstViewController.swift
//  Catch Homer Simpson
//
//  Created by Maverick on 1/3/20.
//  Copyright © 2020 Maverick. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var newGameImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        newGameImageView.isUserInteractionEnabled = true
        let newGameReco = UITapGestureRecognizer(target: self , action: #selector (FirstViewController.newGame))
        newGameImageView.addGestureRecognizer(newGameReco)
        
    }
    
    @objc func newGame(){
        let alert = UIAlertController(title: "", message: "Choose The Difficulty", preferredStyle: UIAlertController.Style.alert)
        let Hard = UIAlertAction(title: "Hard", style: UIAlertAction.Style.default) { (UIAlertAction) in
            
            let xx : Double = 0.4
            UserDefaults.standard.set(xx, forKey: "xx")
            UserDefaults.standard.synchronize()
            
            self.performSegue(withIdentifier: "Go2TheNextPage", sender: nil)
        }
        alert.addAction(Hard)
        
        let Medium = UIAlertAction(title: "Medium", style: UIAlertAction.Style.default) { (UIAlertAction) in
            
            let xx : Double = 0.65
            UserDefaults.standard.set(xx, forKey: "xx")
            UserDefaults.standard.synchronize()
            
            self.performSegue(withIdentifier: "Go2TheNextPage", sender: nil)
        }
        alert.addAction(Medium)
        
        let Easy = UIAlertAction(title: "Easy", style: UIAlertAction.Style.default) { (UIAlertAction) in
            
            let xx : Double = 0.9
            UserDefaults.standard.set(xx, forKey: "xx")
            UserDefaults.standard.synchronize()
            
            self.performSegue(withIdentifier: "Go2TheNextPage", sender: nil)
        }
        alert.addAction(Easy)
        
        self.present(alert, animated: true, completion: nil)
        
        
        performSegue(withIdentifier: "Go2TheNextPage", sender: nil)
        
    }
    
}
