//
//  ViewController.swift
//  StopWatch
//
//  Created by chenchao on 16/4/6.
//  Copyright © 2016年 iOS. All rights reserved.
//

import UIKit

//1.搭建UI界面
//2.定义相关交互事件（连线） 开始 暂停 重置
//3.初始化相关UI实例  frame 内容 


class ViewController: UIViewController {
    
    
    @IBOutlet weak var timeLabel: UIButton!

    @IBOutlet weak var resetBtn: UIButton!
    
    @IBOutlet weak var startBtn: UIButton!

    @IBOutlet weak var pauseBtn: UIButton!
    
    @IBOutlet weak var timeContent: UILabel!
    
    // 交互事件实现
    // 1. 重置时间
    @IBAction func resetAction(sender: AnyObject) {
        Timer.invalidate()  //解除强引用，将计时器从NSRunloop  Remove
        isPlaying = false
        Counter = 0
        timeContent.text = String(Counter)
        startBtn.enabled = true
        pauseBtn.enabled = true
    }
    
    // 2.倒计时开始
    @IBAction func startAction(sender: AnyObject) {
        if isPlaying {
            return
        }
        startBtn.enabled = false
        pauseBtn.enabled = true
        Timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector:#selector(ViewController.updateTime), userInfo: nil, repeats: true)
        isPlaying = true
    }
    
    @IBAction func pauseAction(sender: AnyObject) {
        startBtn.enabled = true
        pauseBtn.enabled = false
        Timer.invalidate()
        isPlaying = false
    }
    
    
    
    // 初始化相关变量
    var Counter = 0.0
    var Timer = NSTimer()
    var isPlaying = false
    
    
    // 页面设置
    // 1. 设置状态栏
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timeContent.text = String(Counter);
        
    }
    
    func updateTime(){
        Counter = Counter + 0.1
        timeContent.text = String(format: "%0.1f",Counter)
    }




}

