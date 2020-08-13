//
//  ViewController.swift
//  20.7.6ゲーム性を持たせる
//
//  Created by 福田一朗 on 2020/07/06.
//  Copyright © 2020 福田一朗. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let ud = UserDefaults.standard
 
   
    
    private lazy var timerDay: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    weak var timer : Timer!
    

    
    private var mainButton:UIButton = {
    let button = UIButton()
          button.addTarget(self, action: #selector(mainButton(_:)), for: UIControl.Event.touchUpInside)
          return button
    }()
    @objc func mainButton(_ sender:UIButton) {
        let userDefaults = UserDefaults.standard
        
        let onakinSwitch = userDefaults.bool(forKey: "onakinSwitch")
        
        if onakinSwitch == false {
            startAction()
        }
        let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "toBoss") as! BossViewController
        self.present(secondViewController, animated: true, completion: nil)
    }
    
    private var restartButton:UIButton = {
    let button = UIButton()
          button.addTarget(self, action: #selector(restartButton(_:)), for: UIControl.Event.touchUpInside)
          return button
    }()
    
    @objc func restartButton(_ sender:UIButton) {
        
        resetAction()
        
        startAction()
        
        let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "toBoss") as! BossViewController
        self.present(secondViewController, animated: true, completion: nil)
    }
    
    func startAction(){
             let userDefaults = UserDefaults.standard
     
             
             let dateFormater = DateFormatter()
             dateFormater.locale = Locale(identifier: "ja_JP")
             dateFormater.dateFormat = "yyyy/MM/dd HH:mm:ss"
             let date = dateFormater.string(from: Date())
    
             userDefaults.set(date,forKey: "start")
         
             timerStart()
        
            self.ud.set(true,forKey: "onakinSwitch")
          
         }
    
    
    func resetAction(){
        if self.timer != nil{
         self.timer.invalidate()
        }
        
        
            ud.removeObject(forKey: "start")
            ud.removeObject(forKey: "counter.b")
        ud.removeObject(forKey: "stage")
            ud.set(false,forKey: "onakinSwitch")
            
            self.timerDayText = "0"
        
        self.loadView()
        self.viewDidLoad()
    }

    
/*
    private lazy var onakinTime: UILabel = {
        let label = UILabel()
        
        
        //label.setLabel(title: R.string.localizable.mailAddress())
        
        return label
    }()
*/
    static var level = 0
    static var textNo = 0
    
    /*
    let imageView = UIImageView()
    func monkeyImage(){
        // ⦿ UIViewの上にUIImageViewを貼り付けます。
         let width = view.bounds.size.width
         let height = view.bounds.size.height
         //let imageArray = ["枠付きゴミ猿","枠付きゲス猿","枠付きアホ猿","枠付きザコ猿","枠付き若猿","勇猿","暴猿","枠付き強猿","猛猿","枠付きボス猿","枠付き僧猿","神猿"]
        
         //let monkeyName = imageArray[ViewController4.myLevel]
        
         let image = UIImage(named: "子供")
        
         
        
         imageView.frame = CGRect(x:(width-(height/2))/2+25,y:50,width: (height/2)-50,height:(height/2)-50)
         /*
         let reSize = CGSize(width: width, height: width)
        
         let resizedCellImage = image?.reSizeImage(reSize: reSize)
        */
         imageView.image = image
        
         self.view.addSubview(imageView)
    }
    */
    var point = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("super.viewDidLoad()")
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
        print("viewWillAppear")
        //monkeyImage()
        
        let onakinSwitch = ud.bool(forKey: "onakinSwitch")
        
        if self.timer != nil{
                self.timer.invalidate()
        
            }
        if onakinSwitch == true{
               
            timerStart()
            }
            
        
         setUpLayout()
          
          
    }
    var startTime = Date()
    
    var date = "2016/10/3 12:12:12"
    
    func timerStart(){
        if let startValue : String = ud.string(forKey: "start"){
        let dateFormater = DateFormatter()
        dateFormater.locale = Locale(identifier: "ja_JP")
        dateFormater.dateFormat = "yyyy/MM/dd HH:mm:ss"
        let dateString = dateFormater.date(from: startValue)
        startTime = dateString!
        timer = Timer.scheduledTimer(
            
            timeInterval : 1,
            target: self,
            selector: #selector(self.timerCounter),
            userInfo:nil,
            repeats:true
        )
        }
    }
    

     var timerDayText = "0"
    
     static var day = 0
     
     @objc func timerCounter(){
                 
                 let f = DateFormatter()
                 f.dateStyle = .short
                 f.timeStyle = .none
                 f.locale = Locale(identifier: "ja_JP")
                 let strStartTime = f.string(from: startTime)
                 f.dateFormat = "yyyy/MM/dd"
                 var mutCurrentTime : TimeInterval = 0
                 if let mutStartTime = f.date(from: strStartTime) {
                   mutCurrentTime = Date().timeIntervalSince(mutStartTime)
                    // print("strStartTime:\(strStartTime)")
     //print("mutStartTime:\(mutStartTime)")
                     
                 }
                 let mutatedDay = (Int)(fmod((mutCurrentTime/86400),365))
                 print("mutCurrentTime:\(mutCurrentTime)")
                 ViewController.day = mutatedDay
                 /*
                 let currentTime = Date().timeIntervalSince(startTime)
                 
                 let day = (Int)(fmod((currentTime/86400),365))
                 let hour = (Int)(fmod((currentTime/3600),24))
                 let minute = (Int)(fmod((currentTime/60),60))
                 //let second = (Int)(fmod(currentTime,60))
                 
                 let sHour = String(format:"%02d",hour)
                 let sMinute = String(format:"%02d",minute)
                 //let sSecond = String(format:"%02d",second)
                 */
        
                 timerDayText = "\(1 + mutatedDay)"
                 
                 
                 setUpLayout()
                 /*
                      
                 timerHour.text = sHour
                 timerMinute.text = sMinute
                 timerSecond.text = sSecond
                 */
             }
    
    
    func setUpLayout(){
        
        //view.addSubview(csvLabel)
        //view.addSubview(pointLabel)
        view.addSubview(mainButton)
        view.addSubview(restartButton)
        
        view.addSubview(timerDay)
        let width = view.bounds.size.width
        
        timerDay.frame = CGRect(x:0, y:100, width:width, height:width)
        timerDay.font = UIFont.systemFont(ofSize: width/2)
        timerDay.numberOfLines = 0
        timerDay.textAlignment = NSTextAlignment.center
        timerDay.text =  timerDayText

        
        let height = view.bounds.size.height
        /*
        csvLabel.frame = CGRect(x:0, y:height*0.4, width:width, height:height/4)
              
        csvLabel.font = UIFont.systemFont(ofSize: height/40)
        csvLabel.textAlignment = .center
        csvLabel.numberOfLines = 0
 */
        /*
        pointLabel.frame = CGRect(x:width*9/14, y:height*8/9, width:width*2/7, height:height/20)
        pointLabel.font = UIFont.systemFont(ofSize: height/40)
        pointLabel.textAlignment = .center
        pointLabel.numberOfLines = 0
        pointLabel.text = "力：\(point)"
        */
        let onakinSwitch = ud.bool(forKey: "onakinSwitch")
        if onakinSwitch == false{
        mainButton.setTitle("始める", for: .normal)
            restartButton.isHidden = true
            timerDay.text = ""
        }else{
             mainButton.setTitle("再開する", for: .normal)
            
            restartButton.setTitle("最初から始める", for:.normal)
            restartButton.setTitleColor(.black, for: .normal)
            restartButton.layer.borderWidth = 2
              restartButton.layer.borderColor = UIColor.gray.cgColor
             restartButton.layer.cornerRadius = 10
             restartButton.titleLabel?.font = UIFont.systemFont(ofSize: view.bounds.size.height/40)
              restartButton.setTitleColor(UIColor.gray, for: .normal)
            restartButton.frame = CGRect(x: width/2-width/7, y: height*0.8, width: width/2, height: height / 20)
        }
        mainButton.setTitleColor(.black, for: .normal)
       mainButton.layer.borderWidth = 2
         mainButton.layer.borderColor = UIColor.gray.cgColor
        mainButton.layer.cornerRadius = 10
        mainButton.titleLabel?.font = UIFont.systemFont(ofSize: view.bounds.size.height/40)
         mainButton.setTitleColor(UIColor.gray, for: .normal)
         mainButton.frame = CGRect(x: width/2-width/7, y: height*2/3, width: width/2, height: height / 20)
        
    }
    
    
        
}

