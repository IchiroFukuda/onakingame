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
    
private var csvLabel: UILabel = {
    let label = UILabel()
    //label.setLabel(title: R.string.localizable.mailAddress())
    return label
}()

    private var pointLabel: UILabel = {
        let label = UILabel()
        //label.setLabel(title: R.string.localizable.mailAddress())
        return label
    }()
    
private var topButton:UIButton = {
let button = UIButton()
      button.addTarget(self, action: #selector(topButton(_:)), for: UIControl.Event.touchUpInside)
      return button
}()

private var underButton:UIButton = {
let button = UIButton()
      button.addTarget(self, action: #selector(underButton(_:)), for: UIControl.Event.touchUpInside)
      return button
}()

private var rightButton:UIButton = {
let button = UIButton()
      button.addTarget(self, action: #selector(rightButton(_:)), for: UIControl.Event.touchUpInside)
      return button
}()

private var leftButton:UIButton = {
let button = UIButton()
      button.addTarget(self, action: #selector(leftButton(_:)), for: UIControl.Event.touchUpInside)
      return button
}()

    @objc func topButton(_ sender:UIButton) {
        
        let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "toBoss") as! BossViewController
        self.present(secondViewController, animated: true, completion: nil)
    }

    @objc func underButton(_ sender:UIButton) {
        let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "toFemale") as! FemaleViewController
        self.present(secondViewController, animated: true, completion: nil)
    }

    @objc func rightButton(_ sender:UIButton) {
    let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "toAscetic") as! AsceticViewController
    self.present(secondViewController, animated: true, completion: nil)
    
    }

    @objc func leftButton(_ sender:UIButton) {
        let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "toLife") as! LifeViewController
        self.present(secondViewController, animated: true, completion: nil)
    }


    static var level = 0
    static var textNo = 0
    
    
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
    
    var point = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
        
        monkeyImage()
        
         csvDataManager.sharedInstance.loadData()
          
          guard let Data = csvDataManager.sharedInstance.nextData()
              else {
                  return
          }
          
         point = ud.integer(forKey: "point")
         
         setUpLayout()
          
          csvLabel.text = "\(Data.sentenceValue)"
    }
    func setUpLayout(){
        view.addSubview(csvLabel)
        view.addSubview(pointLabel)
        view.addSubview(topButton)
        view.addSubview(underButton)
        view.addSubview(rightButton)
        view.addSubview(leftButton)
        
        let width = view.bounds.size.width
        let height = view.bounds.size.height
        
        csvLabel.frame = CGRect(x:0, y:height*0.4, width:width, height:height/4)
              
        csvLabel.font = UIFont.systemFont(ofSize: height/40)
        csvLabel.textAlignment = .center
        csvLabel.numberOfLines = 0
        
        pointLabel.frame = CGRect(x:width*9/14, y:height*8/9, width:width*2/7, height:height/20)
        pointLabel.font = UIFont.systemFont(ofSize: height/40)
        pointLabel.textAlignment = .center
        pointLabel.numberOfLines = 0
        pointLabel.text = "力：\(point)"
        
        topButton.setTitle("ボス猿の元へ", for: .normal)
        topButton.setTitleColor(.black, for: .normal)
       topButton.layer.borderWidth = 2
         topButton.layer.borderColor = UIColor.gray.cgColor
        topButton.layer.cornerRadius = 10
        topButton.titleLabel?.font = UIFont.systemFont(ofSize: view.bounds.size.height/40)
         topButton.setTitleColor(UIColor.gray, for: .normal)
         topButton.frame = CGRect(x: width/2-width/7, y: height*2/3, width: width*2/7, height: height / 20)
        
        underButton.setTitle("生活", for: .normal)
         underButton.setTitleColor(.black, for: .normal)
        underButton.layer.borderWidth = 2
          underButton.layer.borderColor = UIColor.gray.cgColor
         underButton.layer.cornerRadius = 10
         underButton.titleLabel?.font = UIFont.systemFont(ofSize: view.bounds.size.height/40)
          underButton.setTitleColor(UIColor.gray, for: .normal)
         underButton.frame = CGRect(x: width/2-width/7, y: height*8/9, width: width*2/7, height: self.view.frame.height / 20)
        
        
    rightButton.setTitle("雌猿の元へ", for: .normal)
     rightButton.setTitleColor(.black, for: .normal)
   rightButton.layer.borderWidth = 2
     rightButton.layer.borderColor = UIColor.gray.cgColor
     rightButton.layer.cornerRadius = 10
    rightButton.titleLabel?.font = UIFont.systemFont(ofSize: view.bounds.size.height/40)
     rightButton.setTitleColor(UIColor.gray, for: .normal)
     rightButton.frame = CGRect(x: width*9/14, y: view.bounds.size.height*7/9, width: width*2/7, height: self.view.frame.height / 20)
        
        leftButton.setTitle("仙猿の元へ", for: .normal)
        leftButton.setTitleColor(.black, for: .normal)
         leftButton.layer.borderWidth = 2
           leftButton.layer.borderColor = UIColor.gray.cgColor
          leftButton.layer.cornerRadius = 10
          leftButton.titleLabel?.font = UIFont.systemFont(ofSize: view.bounds.size.height/40)
           leftButton.setTitleColor(UIColor.gray, for: .normal)
           leftButton.frame = CGRect(x: width/14, y: view.bounds.size.height*7/9, width: width*2/7, height: self.view.frame.height / 20)
        
    }

}

