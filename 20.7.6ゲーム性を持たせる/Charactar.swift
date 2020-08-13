//
//  Charactar.swift
//  20.7.6ゲーム性を持たせる
//
//  Created by 福田一朗 on 2020/07/18.
//  Copyright © 2020 福田一朗. All rights reserved.
//

import Foundation


class Character {
    
    var name : String
    var level : Int
    var counter : Int
    
    init(name n : String,level l: Int , counter c : Int){
        self.name = n
        self.level = l
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
           
            var n = ""
            switch character.name {
            case  "ボス猿" : n = "Boss"
            case  "雌猿" : n = "Boss"
                case  "仙猿" : n = "Boss"
                case  "ライフ" : n = "Boss"
                default : n = "エラー"
            }
            
            //csvファイルを閲覧するためのキーが手に入る。
            guard let csvFilePath = Bundle.main.path(forResource: n,ofType: "csv") else {
                print("csvファイルが存在しません")
                return
                
            }
            //おそらくここでcsvファイルを順番に見ていく指示が書かれている。
            do {
                let csvStringData = try String(contentsOfFile: csvFilePath, encoding:String.Encoding.utf8)
               
                csvLines = csvStringData.components(separatedBy: .newlines)
                
                  //  let sentenceLine = line
                    
                    //objectData= sentenceLine つまり、objectDataに文が入る。さらにこれはmuramuraData型に変換される。ここで、muramuraDataクラスのsentenceValueには文が入る。
                    var point1 = 0
                    var point2 = 0
                    guard index + 9 >= 0 && index + 9 < csvLines.count else { return }
                    if let value1 : Int = Int(csvLines[index + 8]) {point1 = value1}
                    if let value2 : Int = Int(csvLines[index + 9]) {point2 = value2}
                
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

