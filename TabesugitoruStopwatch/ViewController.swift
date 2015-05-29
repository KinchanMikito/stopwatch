//
//  ViewController.swift
//  TabesugitoruStopwatch
//
//  Created by 金森幹斗 on 2015/05/29.
//  Copyright (c) 2015年 Mikito Kanamori. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var label:UILabel! //ラベルの宣言
    
    var time:Float = 0.00 //時間の変数(秒)
    
    var timer:NSTimer = NSTimer() //タイマーの宣言
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = String(format: "%.2f",time) //labelにtimeの小数第2位まで表示する
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func tapStart(){ //STARTを押した時の処理
        
        if !timer.valid{ //もしtimerが動いていなかったら(if文でエクスクラメーションマークは否定の意味)
            
            timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: "countUp", userInfo: nil, repeats: true)
            //timerを作動(0.01秒毎に"countUp"というメソッドを実行)
            
        }
        
    }
    
    @IBAction func tapStop(){ //STOPを押した時の処理
        
        if timer.valid{ //もしtimerが動いていたら
            
            timer.invalidate() //タイマーを止める
            
        }
        
    }
    
    func countUp(){ //timerが動いている時0.01秒毎に呼び出されるメソッド
        
        time += 0.01 //timeを0.01カウントアップする
        
        label.text = String(format: "%.2f",time) //labelにtimeの小数第2位まで表示する
        
    }


}

