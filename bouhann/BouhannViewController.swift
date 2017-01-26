//
//  BouhannViewController.swift
//  bouhann
//
//  Created by Flatpine8 on 2016/12/29.
//  Copyright © 2016年 mycompany. All rights reserved.
//

import UIKit
import AVFoundation

class BouhannViewController: UIViewController {

    var soundId:SystemSoundID = 1304

    @IBAction func dennwa() {
        UIApplication.shared.openURL(NSURL(string: "tel://08021845672")! as URL)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        super.viewDidLoad()
        
        //再生する音源のURLを生成
        let fileURL = URL(fileURLWithPath: "/System/Library/Audio/UISounds/alarm.caf")
        
        //AVAudioPlayerのインスタンス化

            AudioServicesCreateSystemSoundID(fileURL as CFURL, &soundId)

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buza(){
        AudioServicesPlaySystemSound(soundId)
        }

    var audioPlayer : AVAudioPlayer!
    

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
