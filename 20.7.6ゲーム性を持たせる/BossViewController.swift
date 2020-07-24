//
//  BossViewController.swift
//  20.7.6ゲーム性を持たせる
//
//  Created by 福田一朗 on 2020/07/09.
//  Copyright © 2020 福田一朗. All rights reserved.
//

import UIKit

class BossViewController: UIViewController {
    
    
    static var character = Character(name: "", level: 0, actionNo: 0, counter: 0)
    static var actionNo = 0
    var counter = 0
    
    let ud = UserDefaults.standard
    
    var Data = characterCsvData(image0: "", comment0: "", button1: "", button2: "", image1: "", image2: "", comment1: "", comment2: "", point1: 0, point2: 0)

    override func viewDidLoad() {
        super.viewDidLoad()
        
         counter = ud.integer(forKey: "counter.b")
       
        BossViewController.character = Character(name: "ボス猿", level:ViewController.level, actionNo:BossViewController.actionNo,counter:counter)
        characterCsvDM.sharedInstance.loadData()
        
        if let d = characterCsvDM.sharedInstance.nextData() {
            Data = d
        }
       
        setUpLayout()
        
        // Do any additional setup after loading the view.
    }
    let imageView = UIImageView()
    func monkeyImage(){
        // ⦿ UIViewの上にUIImageViewを貼り付けます。
         let width = view.bounds.size.width
         let height = view.bounds.size.height
         
        var d = ""
        switch BossViewController.actionNo {
        case 0 : d = Data.image0
        case 1 : d = Data.image1
        case 2 : d = Data.image2
        default : d = "エラー"
        }
        let image = UIImage(named: d)
        
         imageView.frame = CGRect(x:(width-(height/2))/2+25,y:50,width: (height/2)-50,height:(height/2)-50)
         
         imageView.image = image
        
         self.view.addSubview(imageView)
    }

    private var textLabel: UILabel = {
        let label = UILabel()
        //label.setLabel(title: R.string.localizable.mailAddress())
        return label
    }()

    private var button1:UIButton = {
    let button = UIButton()
          button.addTarget(self, action: #selector(button1(_:)), for: UIControl.Event.touchUpInside)
          return button
    }()

    private var button2:UIButton = {
    let button = UIButton()
          button.addTarget(self, action: #selector(button2(_:)), for: UIControl.Event.touchUpInside)
          return button
    }()
  
    private var backButton:UIButton = {
    let button = UIButton()
          button.addTarget(self, action: #selector(back(_:)), for: UIControl.Event.touchUpInside)
          return button
    }()
    
    var point = 0
    
    @objc func button1(_ sender:UIButton) {
        BossViewController.actionNo += 1
        if counter < 5 { counter += 1}
        ud.set(counter, forKey: "counter.b")
        point = ud.integer(forKey: "point")
        point += Data.point1
        ud.set(point, forKey: "point")
        print(point)
        self.loadView()
        self.viewDidLoad()
    }

    @objc func button2(_ sender:UIButton) {
        BossViewController.actionNo += 2
        if counter < 5 { counter += 1}
        ud.set(counter, forKey: "counter.b")
        point = ud.integer(forKey: "point")
        point += Data.point2
        ud.set(point, forKey: "point")
        print(point)
        self.loadView()
        self.viewDidLoad()
    }
    @objc func back(_ sender:UIButton) {
        BossViewController.actionNo = 0
        
        self.dismiss(animated: true, completion:nil)
    }
   
   func setUpLayout(){
                monkeyImage()
                view.addSubview(textLabel)
            if Data.button1 != "" && BossViewController.actionNo == 0 {
               view.addSubview(button1)
            }
            if Data.button2 != "" && BossViewController.actionNo == 0{
               view.addSubview(button2)
            }
            view.addSubview(backButton)
               let width = view.bounds.size.width
               let height = view.bounds.size.height
               
    
                var d = ""
                switch BossViewController.actionNo {
                case 0 : d = Data.comment0
                case 1 : d = Data.comment1
                case 2 : d = Data.comment2
                default : d = "エラー"
                }
                textLabel.text  = d
               textLabel.frame = CGRect(x:0, y:height*0.4, width:width, height:height/4)
                     
               textLabel.font = UIFont.systemFont(ofSize: height/40)
               textLabel.textAlignment = .center
               textLabel.numberOfLines = 0
               
                button1.setTitle(Data.button1, for: .normal)
               button1.setTitleColor(.black, for: .normal)
              button1.layer.borderWidth = 2
                button1.layer.borderColor = UIColor.gray.cgColor
               button1.layer.cornerRadius = 10
               button1.titleLabel?.font = UIFont.systemFont(ofSize: view.bounds.size.height/40)
                button1.setTitleColor(UIColor.gray, for: .normal)
    button1.frame = CGRect(x: width/2-width/7, y: height*6.2/9, width: width*2/7, height: height / 20)
               
    button2.setTitle(Data.button2, for: .normal)
                button2.setTitleColor(.black, for: .normal)
              button2.layer.borderWidth = 2
                button2.layer.borderColor = UIColor.gray.cgColor
                button2.layer.cornerRadius = 10
                button2.titleLabel?.font = UIFont.systemFont(ofSize: view.bounds.size.height/40)
                button2.setTitleColor(UIColor.gray, for: .normal)
    button2.frame = CGRect(x: width/2-width/7, y: height*7/9, width: width*2/7, height: self.view.frame.height / 20)
    
                backButton.setTitle("戻る", for: .normal)
                backButton.setTitleColor(.black, for: .normal)
                backButton.layer.borderWidth = 2
                backButton.layer.borderColor = UIColor.gray.cgColor
                backButton.layer.cornerRadius = 10
                backButton.titleLabel?.font = UIFont.systemFont(ofSize: view.bounds.size.height/40)
                backButton.setTitleColor(UIColor.gray, for: .normal)
    backButton.frame = CGRect(x: width/2-width/7, y: height*8.2/9, width: width*2/7, height: self.view.frame.height / 20)
    
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
