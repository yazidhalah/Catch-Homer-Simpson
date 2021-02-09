//
//  ViewController.swift
//  Catch Homer Simpson
//
//  Created by Maverick on 1/3/20.
//  Copyright © 2020 Maverick. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var HomerImage1: UIImageView!
    @IBOutlet weak var HomerImage2: UIImageView!
    @IBOutlet weak var HomerImage3: UIImageView!
    @IBOutlet weak var HomerImage4: UIImageView!
    @IBOutlet weak var HomerImage5: UIImageView!
    @IBOutlet weak var HomerImage6: UIImageView!
    @IBOutlet weak var HomerImage7: UIImageView!
    @IBOutlet weak var HomerImage8: UIImageView!
    @IBOutlet weak var HomerImage9: UIImageView!
    @IBOutlet weak var CountDown: UIImageView!
    @IBOutlet weak var ReplayImageView: UIImageView!
    @IBOutlet weak var HomeImageView: UIImageView!
    
    @IBOutlet weak var timerLbl: UILabel!
    @IBOutlet weak var yourScoreLbl: UILabel!
    @IBOutlet weak var highScoreLbl: UILabel!
    
    var score = 0
    var counter = 40
    var count2 = 3
    var integer : Double = 1
    
    var scoreTimer = Timer()
    var hideTimer = Timer()
    var BombTimer = Timer()
    var HomerArray = [UIImageView]()
    var CountDownArray = [UIImageView]()
    var CountDownTimer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        countDown()
        
        
        let xx = UserDefaults.standard.object(forKey: "xx")
        
        if let Newxx = xx as? Double {
            
            integer = Newxx
        }
        
        let highscore = UserDefaults.standard.object(forKey: "highscore")
        
        if highscore == nil {
            highScoreLbl.text = "0"
        }
        
        if let newScore = highscore as? Int {
            highScoreLbl.text = String(newScore)
        }
        
        

        let HomerImageReco1 = UITapGestureRecognizer (target: self, action: #selector (ViewController.IncreseScore))
        let HomerImageReco2 = UITapGestureRecognizer (target: self, action: #selector (ViewController.IncreseScore))
        let HomerImageReco3 = UITapGestureRecognizer (target: self, action: #selector (ViewController.IncreseScore))
        let HomerImageReco4 = UITapGestureRecognizer (target: self, action: #selector (ViewController.IncreseScore))
        let HomerImageReco5 = UITapGestureRecognizer (target: self, action: #selector (ViewController.IncreseScore))
        let HomerImageReco6 = UITapGestureRecognizer (target: self, action: #selector (ViewController.IncreseScore))
        let HomerImageReco7 = UITapGestureRecognizer (target: self, action: #selector (ViewController.IncreseScore))
        let HomerImageReco8 = UITapGestureRecognizer (target: self, action: #selector (ViewController.IncreseScore))
        let HomerImageReco9 = UITapGestureRecognizer (target: self, action: #selector (ViewController.IncreseScore))
        let HomeImageViewReco = UITapGestureRecognizer (target: self, action: #selector (ViewController.GoHome))
        let ReplayImageViewReco = UITapGestureRecognizer (target: self, action: #selector (ViewController.countDown))
        
        HomerImage1.addGestureRecognizer(HomerImageReco1)
        HomerImage2.addGestureRecognizer(HomerImageReco2)
        HomerImage3.addGestureRecognizer(HomerImageReco3)
        HomerImage4.addGestureRecognizer(HomerImageReco4)
        HomerImage5.addGestureRecognizer(HomerImageReco5)
        HomerImage6.addGestureRecognizer(HomerImageReco6)
        HomerImage7.addGestureRecognizer(HomerImageReco7)
        HomerImage8.addGestureRecognizer(HomerImageReco8)
        HomerImage9.addGestureRecognizer(HomerImageReco9)
        HomeImageView.addGestureRecognizer(HomeImageViewReco)
        ReplayImageView.addGestureRecognizer(ReplayImageViewReco)
        
        
        HomerImage1.isUserInteractionEnabled = true
        HomerImage2.isUserInteractionEnabled = true
        HomerImage3.isUserInteractionEnabled = true
        HomerImage4.isUserInteractionEnabled = true
        HomerImage5.isUserInteractionEnabled = true
        HomerImage6.isUserInteractionEnabled = true
        HomerImage7.isUserInteractionEnabled = true
        HomerImage8.isUserInteractionEnabled = true
        HomerImage9.isUserInteractionEnabled = true
        HomeImageView.isUserInteractionEnabled = true
        ReplayImageView.isUserInteractionEnabled = true
        
        //scoreTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector (ViewController.TimerDown), userInfo: nil, repeats: true)
        
        // adding Pictures in the Array
        
        HomerArray.append(HomerImage1)
        HomerArray.append(HomerImage2)
        HomerArray.append(HomerImage3)
        HomerArray.append(HomerImage4)
        HomerArray.append(HomerImage5)
        HomerArray.append(HomerImage6)
        HomerArray.append(HomerImage7)
        HomerArray.append(HomerImage8)
        HomerArray.append(HomerImage9)
        
        //HideHomer()
        
        for q in HomerArray {
            
            q.isHidden = true
        }
        
        HomerArray[4].isHidden = false
    
        //hideTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(ViewController.HideHomer), userInfo: nil, repeats: true)
        //barneyTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.HomerChange), userInfo: nil, repeats: true)
        
    }

    @objc func TimerDown(){
        
        counter -= 1
        timerLbl.text = "\(String(counter))s"
        
        if counter == 0 {
            
            yourScoreLbl.text = "Your Score: \(String(score))"
            scoreTimer.invalidate()
            hideTimer.invalidate()
            
            let alert = UIAlertController(title: "", message: "Your Time Is Up!", preferredStyle: UIAlertController.Style.alert)
            let dismiss = UIAlertAction(title: "Dismiss", style: UIAlertAction.Style.cancel, handler: nil)
            alert.addAction(dismiss)
            let replay = UIAlertAction(title: "Replay", style: UIAlertAction.Style.default) { (UIAlertAction) in
                
                //self.Replay()
                //self.scoreTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector (ViewController.TimerDown), userInfo: nil, repeats: true)
                //self.hideTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.HideHomer), userInfo: nil, repeats: true)
                //self.BombTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.HomerChange), userInfo: nil, repeats: true)
                
                self.countDown()
            }
            alert.addAction(replay)
            self.present(alert, animated: true, completion: nil)
            
            for homer in HomerArray {
                homer.isHidden = true
            }
            
            HomerArray[4].isHidden = false
            
            if score > Int(highScoreLbl.text!)! {
                
                UserDefaults.standard.set(score, forKey: "highscore")
                UserDefaults.standard.synchronize()
                
                highScoreLbl.text = String(score)
                
            }
            
        }
    }
    
    @objc func HideHomer(){
        
        for Homer in HomerArray{
            Homer.isHidden = true
        }
        let RandomNumber = Int(arc4random_uniform(UInt32(HomerArray.count - 1)))
        HomerArray[RandomNumber].isHidden = false
        
        

    }
    
    @objc func HomerChange(){
        
       
        
        
        //@objc func bomb(){
            
            let randomnumber2 = Int(arc4random_uniform(UInt32(HomerArray.count - 1)))
            HomerArray[randomnumber2].image = UIImage(named: "bomb.png")
            let HomerImageReco11 = UITapGestureRecognizer (target: self, action: #selector (ViewController.IncreseScoreSpecial))
            HomerArray[randomnumber2].addGestureRecognizer(HomerImageReco11)
       
        //@objc func homer(){
            
            let randomnumber3 = Int(arc4random_uniform(UInt32(HomerArray.count - 1)))
            HomerArray[randomnumber3].image = UIImage(named: "homerhead.png")
            let HomerImageReco1 = UITapGestureRecognizer (target: self, action: #selector (ViewController.DecreseScore))
            HomerArray[randomnumber3].addGestureRecognizer(HomerImageReco1)
        
        //@objc func donut(){
        
            let randomnumber4 = Int(arc4random_uniform(UInt32(HomerArray.count - 1)))
            HomerArray[randomnumber4].image = UIImage(named: "donut.png")
            let HomerImageReco111 = UITapGestureRecognizer (target: self, action: #selector (ViewController.IncreseScore))
            HomerArray[randomnumber4].addGestureRecognizer(HomerImageReco111)
        
            let randomnumber5 = Int(arc4random_uniform(UInt32(HomerArray.count - 1)))
            HomerArray[randomnumber5].image = UIImage(named: "donut.png")
            let HomerImageReco1111 = UITapGestureRecognizer (target: self, action: #selector (ViewController.IncreseScore))
            HomerArray[randomnumber5].addGestureRecognizer(HomerImageReco1111)
        
        }
    @objc func IncreseScore(){
        
        score += 5
        yourScoreLbl.text = "Your Score: \(String(score))"
        
    }
    
    @objc func DecreseScore(){
        
        score -= 2
        yourScoreLbl.text = "Your Score: \(String(score))"
    }
    
    
    @objc func IncreseScoreSpecial(){
        
        CountDown.image = UIImage(named: "boom.png")
        CountDown.isHidden = false
        
        CountDownTimer.invalidate()
        scoreTimer.invalidate()
        hideTimer.invalidate()
        BombTimer.invalidate()
        
        for x in HomerArray{
            x.isHidden = true
        }
        
        let alert1 = UIAlertController(title: "", message: "YOU HIT A BOMB!", preferredStyle: UIAlertController.Style.alert)
        let dismiss = UIAlertAction(title: "Dismiss", style: UIAlertAction.Style.cancel, handler: nil)
        alert1.addAction(dismiss)
        let replay = UIAlertAction(title: "Replay", style: UIAlertAction.Style.default) { (UIAlertAction) in
            
            //self.Replay()
            //self.scoreTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector (ViewController.TimerDown), userInfo: nil, repeats: true)
            //self.hideTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.HideHomer), userInfo: nil, repeats: true)
            //self.BombTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.HomerChange), userInfo: nil, repeats: true)
            
            self.countDown()
            
        }
        alert1.addAction(replay)
        self.present(alert1, animated: true, completion: nil)
        
    }
    
    @objc func Replay(){
        
        counter = 40
        score = 0
        yourScoreLbl.text = "Your Score: \(String(score))"
        timerLbl.text = "\(String(self.counter))s"
        
        
    }
   
        
    
    @objc func countDown(){
        
        CountDownTimer.invalidate()
        scoreTimer.invalidate()
        hideTimer.invalidate()
        BombTimer.invalidate()
        
        for w in HomerArray {
            w.isHidden = true
        }
        
        
        
        CountDownTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.countdowndecrese), userInfo: nil, repeats: true)
        count2 = 4
        
        
        
    }
    @objc func countdowndecrese(){
        
        count2 -= 1
        
        
        
        if count2 == 3 {
            CountDown.isHidden = false
            CountDown.image = UIImage(named: "333.png")
        }
        if count2 == 2 {
           CountDown.image = UIImage(named: "222.png")
        }
        if count2 == 1  {
        CountDown.image = UIImage(named: "111.png")
        }
        if count2 == 0 {
        CountDown.isHidden = true
            CountDownTimer.invalidate()
            
            Replay()
            
            scoreTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector (ViewController.TimerDown), userInfo: nil, repeats: true)
            hideTimer = Timer.scheduledTimer(timeInterval: integer, target: self, selector: #selector(ViewController.HideHomer), userInfo: nil, repeats: true)
            BombTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.HomerChange), userInfo: nil, repeats: true)
        }
    }
    @objc func GoHome(){
        performSegue(withIdentifier: "GoHome", sender: nil)
    }
}
