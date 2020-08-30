//
//  GameOverViewController.swift
//  20.7.6ゲーム性を持たせる
//
//  Created by 福田一朗 on 2020/08/29.
//  Copyright © 2020 福田一朗. All rights reserved.
//

import UIKit

class GameOverViewController: UIViewController {
    private lazy var gameOverLabel: UILabel = {
           let label = UILabel()
           
           return label
       }()
       
       var commentArray = ["休みすぎて後ろからチーターに襲われた。","一人で孤独に死んでいった。","無様に死んだ。","男にはやれねばならない時がある。","4","自分を鍛えていなかったために、敵に殴られ死んだ。","","オナ禁によって人間力を磨いていなかったために、群れの者達がボイコットを起こし、群れの再建が頓挫した。","オナ禁パワーが足りなかった。無様に死んでいった。","",""]
       private lazy var commentLabel: UILabel = {
           let label = UILabel()
           
           return label
       }()
       
       private var backButton:UIButton = {
       let button = UIButton()
             button.addTarget(self, action: #selector(backButton(_:)), for: UIControl.Event.touchUpInside)
             return button
       }()
       @objc func backButton(_ sender:UIButton) {
        let ud = UserDefaults.standard
        ud.set(0, forKey: "counter.b")
        let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "main") as! ViewController
                  self.present(secondViewController, animated: true, completion: nil)
       }
       
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpLayout()
        self.view.addBackground(name: "背景1-1")
        // Do any additional setup after loading the view.
    }
    func setUpLayout(){
    let ud = UserDefaults.standard
    view.addSubview(gameOverLabel)
    view.addSubview(commentLabel)
    view.addSubview(backButton)

    
    let width = view.bounds.size.width
    let height = view.bounds.size.height
    let stage = ud.integer(forKey: "stage")
    
    

    gameOverLabel.frame = CGRect(x:0, y:height/10, width:width, height:height/3)
    
    gameOverLabel.numberOfLines = 2
    gameOverLabel.textAlignment = NSTextAlignment.center
    gameOverLabel.text =  "Game Over"
    gameOverLabel.textColor = UIColor.red
    gameOverLabel.font = UIFont(name: "BradleyHandITCTT-Bold", size: height / 7.5)
    
    commentLabel.frame = CGRect(x:0, y:height/3, width:width, height:height/3)
           commentLabel.font = UIFont.systemFont(ofSize: width/20)
           commentLabel.numberOfLines = 0
           commentLabel.textColor = UIColor.white
           commentLabel.textAlignment = NSTextAlignment.left
           commentLabel.text =  commentArray[stage]

    
       
        
    backButton.setTitle("戻る", for: .normal)
    
        
        backButton.setTitleColor(.white, for: .normal)
       backButton.layer.borderWidth = 2
         backButton.layer.borderColor = UIColor.white.cgColor
        backButton.layer.cornerRadius = 10
        backButton.titleLabel?.font = UIFont.systemFont(ofSize: view.bounds.size.height/40)
         backButton.frame = CGRect(x: width/2-width/4, y: height*0.8, width: width/2, height: height / 20)

    
    
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
