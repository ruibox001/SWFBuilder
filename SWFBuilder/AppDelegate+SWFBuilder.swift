//
//  SFUtils.swift
//  TestSwift
//
//  Created by wsy on 2018/1/17.
//  Copyright © 2018年 wangshengyuan. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

extension AppDelegate {
    
    open static func initializes() {
        self.objSwizzlingOrReplaceMethod(originSelector: #selector(applicationDidEnterBackground(_:)), newSelector: #selector(cus_applicationDidEnterBackground(_:)))
        
        self.objSwizzlingOrReplaceMethod(originSelector: #selector(applicationWillEnterForeground(_:)), newSelector: #selector(cus_applicationWillEnterForeground(_:)))
    }
    
    @objc private func cus_applicationDidEnterBackground(_ application: UIApplication) {
        applicationStatusEnter(true)
        self.cus_applicationDidEnterBackground(application)
    }
    
    @objc private func cus_applicationWillEnterForeground(_ application: UIApplication) {
        applicationStatusEnter(false)
        self.cus_applicationWillEnterForeground(application)
    }
    
    private func applicationStatusEnter(_ enter: Bool) {
        if self.app == nil {
            return;
        }
        getAppOperaton().processBgMode(enter)
    }
    
    //启动后台模式：必须打开后台配置项：Capobilitice->BackgroupModes-> Audio 要在这里打钩才启动作用
    func appDelegateEnableBgMode() {
        getAppOperaton().enableBgMode()
    }
    
    func appDelegateStopBgMode() {
        if (self.app != nil) {
            getAppOperaton().stopBgMode()
        }
    }
    
    private var app: AppBgOperation? {
        get {
            return objc_getAssociatedObject(self, &AppBgOperation.Key) as? AppBgOperation
        }
        set {
            if let newValue = newValue  {
                objc_setAssociatedObject(self, &AppBgOperation.Key, newValue as AppBgOperation?, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            }
        }
    }
    
    private func getAppOperaton() -> AppBgOperation {
        if self.app == nil {
            self.app = AppBgOperation();
        }
        return self.app!;
    }
    
}

public class AppBgOperation {
    
    public static var Key = "AppBgOperationKey";
    
    var bgTask: UIBackgroundTaskIdentifier?
    var timer: Timer?
    var audioPlayer: AVAudioPlayer?
    
    func enableBgMode() {
        Dlog("该App启动后台运行模式")
    }
    
    func stopBgMode() {
        endBackgroup()
    }
    
    func processBgMode(_ enter: Bool) {
        if enter {
            beginBackgroup()
            timer = Timer.scheduledTimer(timeInterval: 10, target: self, selector: #selector(applyForMoreTime), userInfo: nil, repeats: true)
        }
        else {
            endBackgroup()
        }
    }
    
    func beginBackgroup() {
        
        if bgTask != nil {
            UIApplication.shared.endBackgroundTask(bgTask!)
        }
        
        bgTask = UIApplication.shared.beginBackgroundTask(expirationHandler: {
            self.endBackgroup()
        })
        
    }
    
    func endBackgroup() {
        if bgTask != nil {
            UIApplication.shared.endBackgroundTask(bgTask!)
            bgTask = UIBackgroundTaskInvalid
            bgTask = nil
        }
        
        if timer != nil {
            timer?.invalidate()
            timer = nil
        }
    }
    
    @objc private func applyForMoreTime() {
        let sec = UIApplication.shared.backgroundTimeRemaining
//        Dlog("后台操作还剩："+String(sec)+"秒")
        if sec < 30 {
//            Dlog("通过播放音乐再次申请时间")
            playVidio()
            beginBackgroup()
        }
    }
    
    func playVidio() {
        if audioPlayer != nil {
            audioPlayer?.stop()
            audioPlayer = nil
        }
        
        let u = URL.init(fileURLWithPath: Bundle.main.path(forResource: DF_ApplicatonBackgroundModePlayFileName, ofType: nil)!)
        
        do {
           try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback, with: AVAudioSessionCategoryOptions.mixWithOthers)
            try audioPlayer = AVAudioPlayer.init(contentsOf: u)
            audioPlayer?.play()
        } catch _ {
            Dlog("后台模式播放异常了")
        }
        
    }
    
}

