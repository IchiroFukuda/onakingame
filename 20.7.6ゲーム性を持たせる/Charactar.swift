//
//  Charactar.swift
//  20.7.6ゲーム性を持たせる
//
//  Created by 福田一朗 on 2020/07/18.
//  Copyright © 2020 福田一朗. All rights reserved.
//

import Foundation


class Character {
    
    
    var counter : Int
    
    init(counter c : Int){
      
        self.counter = c
    }
}
 
class characterCsvData{
        //プロパティのこと
        //var sentenceValue : String
    var image0 : String
    var comment0 : String
    var button1 : String
    var button2 : String
    
   
    
        //イニシャライザ。muramuraDataをインスタンス化して利用するとき、let a = muramuraData(sentenceData:b) と宣言すれば、sentenceValueにはbが入る。
    init(image0 i0:String,comment0 c0:String,button1 b1:String,button2 b2:String) {
            image0 = i0
            comment0 = c0
            button1 = b1
            button2 = b2
           
        }
    }
class characterCsvDM{
        
        static let sharedInstance = characterCsvDM()
        //空の配列。型だけ指定する。
    var objectData = characterCsvData(image0: "", comment0: "", button1: "", button2: "")
        // 取り出す文の番号を入れる変数
        var index: Int = 0
        
        var csvLines = [String]()
    
        private init() {
        }
        
        func loadData(){
            csvLines.removeAll()
            //muramuraLevelは0〜10.kakuは1〜12これが日数によるレベル分け。これに10をかけることで、レベルに応じて10個の文章が変わる。
            let character = BossViewController.character
            index = BossViewController.stage * 100 + character.counter * 10
           
            //csvファイルを閲覧するためのキーが手に入る。
            guard let csvFilePath = Bundle.main.path(forResource: "Boss",ofType: "csv") else {
                print("csvファイルが存在しません")
                return
                
            }
            //おそらくここでcsvファイルを順番に見ていく指示が書かれている。
            do {
                let csvStringData = try String(contentsOfFile: csvFilePath, encoding:String.Encoding.utf8)
               
                csvLines = csvStringData.components(separatedBy: .newlines)
                
                  //  let sentenceLine = line
                    
                    //objectData= sentenceLine つまり、objectDataに文が入る。さらにこれはmuramuraData型に変換される。ここで、muramuraDataクラスのsentenceValueには文が入る。
                   
                
                    objectData  = characterCsvData(image0: csvLines[index], comment0: csvLines[index + 1], button1: csvLines[index + 2], button2: csvLines[index + 3])
            
                    //配列にobjectDataが入る。つまり、読み込んだ文が配列に追加される。こうやってどんどん配列に文が入っていく。
            //self.csvDataArray.append(objectData)
                    
                
            } catch let error {
                print("csvファイル読み込みエラーが発生しました:\(error)")
                return
            }
        }
        //nextDataの戻り値をmuramuraData型で返却。sentenceValueには文が入った状態。この文を取り出すには、muramuraData.sentenceValueでOK
        
        func nextData() -> characterCsvData? {
           
            let nextData = objectData
            
            return nextData
        }
        
        
        
    }

