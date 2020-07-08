//
//  ViewController.swift
//  timer
//
//  Created by 前田蓮太 on 2020/07/08.
//  Copyright © 2020 renta.Maeda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var timerLabel: UILabel!
   
    // タイマー
       var timer: Timer!

    var timer_sec: Float = 0  //タイマー用の変数
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    // selector: #selector(updatetimer(_:)) で指定された関数
    // timeInterval: 0.1, repeats: true で指定された通り、0.1秒毎に呼び出され続ける
    @objc func updateTimer(_ timer: Timer) {
        self.timer_sec += 0.1
        self.timerLabel.text = String(format: "%.1f", self.timer_sec)
    }
    
    
    @IBAction func startTimer(_ sender: Any) {
           self.timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)

       }
       @IBAction func pauseTimer(_ sender: Any) {
           if self.timer != nil {
               self.timer.invalidate()   // タイマーを停止する
               self.timer = nil          // startTimer() の self.timer == nil で判断するために、 self.timer = nil としておく
           }
       }
       
       @IBAction func resetTimer(_ sender: Any) {
         // リセットボタンを押すと、タイマーの時間を0に
           self.timer_sec = 0
           self.timerLabel.text = String(format: "%.1f", self.timer_sec)

           if self.timer != nil {
               self.timer.invalidate()   // タイマーを停止する
               self.timer = nil          // startTimer() の self.timer == nil で判断するために、 self.timer = nil としておく
           }
    }
}

