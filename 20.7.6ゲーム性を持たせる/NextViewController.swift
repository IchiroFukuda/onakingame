//
//  NextViewController.swift
//  20.7.6ゲーム性を持たせる
//
//  Created by 福田一朗 on 2020/08/27.
//  Copyright © 2020 福田一朗. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {
    private lazy var stepLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    var commentArray = ["彼は何とか一人でジャングルを歩き抜き、ようやく、同族の気配がする場所にたどり着いた。彼はそこで仲間と出会うことができるのだろうか。","彼がたどり着いた場所は、ゴリラの住処であった。しかし、向こうが敵と見れば即刻殺されるだろう。彼は生き残ることができるのだろうか。","群れのボスにここにたどり着いた事情を話すと、自分を敵では無いと認めてくれた。怪我が治るまでは、この群れにお世話になることにした。","群れの中に友達ができた。最初は殺されるかと思っていたが、どうやら上手くやっていけそうだ。","群れの最年長の仙猿にオナ禁を教わった。長い放浪生活から自然とオナ禁できていたが、まさかそれが強くなる方法とは思っていなかった。これからは意識してオナ禁して、強くなりたい。そう強く思った。","突如隣の群れにに襲われ、領土を奪われた。群れのメスは敵に犯され、子どもは殺された。群れのオス達は、憎悪の念で燃えていた。","長いオナ禁生活によって、特殊能力が開発された。自分の涙が治癒能力を持つようになり、友人の怪我を治す事ができた。","オナ禁によって人格が磨かれ、指導力が増した。この指導力で群れを動かし、群れを再建する事ができた。","復讐に燃える群れの期待に応える形で、隣の群れに乗り込み、見事ボス猿を倒すことに成功した。","9","10"]
    private lazy var commentLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    private var nextButton:UIButton = {
    let button = UIButton()
          button.addTarget(self, action: #selector(nextButton(_:)), for: UIControl.Event.touchUpInside)
          return button
    }()
    @objc func nextButton(_ sender:UIButton) {

        print("next pushed")
        
        let ud = UserDefaults.standard
        BossViewController.stage += 1
        ud.set(BossViewController.stage, forKey: "stage")
        ud.set(0, forKey: "counter.b")
       let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "toBoss") as! BossViewController
        self.present(secondViewController, animated: true, completion: nil)
    }
    
    private var mainButton:UIButton = {
    let button = UIButton()
          button.addTarget(self, action: #selector(mainButton(_:)), for: UIControl.Event.touchUpInside)
          return button
    }()
    @objc func mainButton(_ sender:UIButton) {
       
        let ud = UserDefaults.standard
               BossViewController.stage += 1
               ud.set(BossViewController.stage, forKey: "stage")
              ud.set(0, forKey: "counter.b")
       print("main pushed")
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
    view.addSubview(stepLabel)
    view.addSubview(commentLabel)
    view.addSubview(mainButton)
    view.addSubview(nextButton)
    
    let width = view.bounds.size.width
    let height = view.bounds.size.height
    let stage = ud.integer(forKey: "stage")
    
    

    stepLabel.frame = CGRect(x:0, y:height/20, width:width, height:height/3)
    
    stepLabel.numberOfLines = 2
    stepLabel.textAlignment = NSTextAlignment.center
    stepLabel.text =  "Step \(stage+1)\nfinished"
    stepLabel.textColor = UIColor.white
    stepLabel.font = UIFont(name: "BradleyHandITCTT-Bold", size: height / 7.5)
    
    commentLabel.frame = CGRect(x:0, y:height/3, width:width, height:height/3)
           commentLabel.font = UIFont.systemFont(ofSize: width/20)
           commentLabel.numberOfLines = 0
           commentLabel.textColor = UIColor.white
           commentLabel.textAlignment = NSTextAlignment.left
           commentLabel.text =  commentArray[stage]

    
    mainButton.setTitle("最初の画面へ", for: .normal)
    
        
        mainButton.setTitleColor(.white, for: .normal)
       mainButton.layer.borderWidth = 2
         mainButton.layer.borderColor = UIColor.white.cgColor
        mainButton.layer.cornerRadius = 10
        mainButton.titleLabel?.font = UIFont.systemFont(ofSize: view.bounds.size.height/40)
         mainButton.frame = CGRect(x: width/2-width/4, y: height*0.8, width: width/2, height: height / 20)
        
    nextButton.setTitle("次のステップへ", for:.normal)
        nextButton.setTitleColor(.white, for: .normal)
        nextButton.layer.borderWidth = 2
          nextButton.layer.borderColor = UIColor.white.cgColor
         nextButton.layer.cornerRadius = 10
         nextButton.titleLabel?.font = UIFont.systemFont(ofSize: view.bounds.size.height/40)
        nextButton.frame = CGRect(x: width/2-width/4, y: height*2/3, width: width/2, height: height / 20)
    
    
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
