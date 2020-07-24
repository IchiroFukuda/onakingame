//
//  class.swift
//  20.7.6ゲーム性を持たせる
//
//  Created by 福田一朗 on 2020/07/07.
//  Copyright © 2020 福田一朗. All rights reserved.
//

import Foundation

class csvData{
    //プロパティのこと
    var sentenceValue : String
    
    //イニシャライザ。muramuraDataをインスタンス化して利用するとき、let a = muramuraData(sentenceData:b) と宣言すれば、sentenceValueにはbが入る。
    init(sentenceData:String) {
        sentenceValue = sentenceData
    }
}
class csvDataManager{
    
    static let sharedInstance = csvDataManager()
    //空の配列。型だけ指定する。
    var csvDataArray = [csvData]()
    // 取り出す文の番号を入れる変数
    var nowDataIndex: Int = 0
    
    private init() {
    }
    
    func loadData(){
        csvDataArray.removeAll()
        //muramuraLevelは0〜10.kakuは1〜12これが日数によるレベル分け。これに10をかけることで、レベルに応じて10個の文章が変わる。
        nowDataIndex = ViewController.textNo
        //csvファイルを閲覧するためのキーが手に入る。
        guard let csvFilePath = Bundle.main.path(forResource: "text",ofType: "csv") else {
            print("csvファイルが存在しません")
            return
            
        }
        //おそらくここでcsvファイルを順番に見ていく指示が書かれている。
        do {
            let csvStringData = try String(contentsOfFile: csvFilePath, encoding:String.Encoding.utf8)
           //文を読み込む。ここで数字ごとに区切られていく。
            csvStringData.enumerateLines(invoking: {(line,stop) in
            //文を変数に代入する
                let sentenceLine = line
                
                //objectData= sentenceLine つまり、objectDataに文が入る。さらにこれはmuramuraData型に変換される。ここで、muramuraDataクラスのsentenceValueには文が入る。
                let objectData  = csvData(sentenceData:sentenceLine)
        
                //配列にobjectDataが入る。つまり、読み込んだ文が配列に追加される。こうやってどんどん配列に文が入っていく。
        self.csvDataArray.append(objectData)
                
            })
        } catch let error {
            print("csvファイル読み込みエラーが発生しました:\(error)")
            return
        }
    }
    //nextDataの戻り値をmuramuraData型で返却。sentenceValueには文が入った状態。この文を取り出すには、muramuraData.sentenceValueでOK
    
    func nextData() -> csvData? {
       
        let nextData = csvDataArray[nowDataIndex]
        
        return nextData
    }
    
    
    
}

