//
//  BouhannViewController.swift
//  bouhann
//
//  Created by Flatpine8 on 2016/12/29.
//  Copyright © 2016年 mycompany. All rights reserved.
//

import UIKit
import AVFoundation
import MessageUI

class BouhannViewController: UIViewController,MFMailComposeViewControllerDelegate {
    
    var soundId:SystemSoundID = 1304
    @IBAction func iti(){
        let mail = saveData.string(forKey: "mailadress")
        print(mail)
        self.onClickStartMailerBtn()
        let adress = saveData
        
    }
    var saveData =  UserDefaults.standard
    @IBAction func dennwa() {
        let result = saveData.string(forKey: "電話番号")
        print(result)
        UIApplication.shared.openURL(NSURL(string: "tel://" + result!)! as URL)
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
    func onClickStartMailerBtn() {
        //メールを送信できるかチェック
        //        if MFMailComposeViewController.canSendMail()==false {
        //            print("メールが送られませんでした。再度メールを送ってください")
        //            return
        //        }
        
        let mailViewController = MFMailComposeViewController()
        var toRecipients = ["mailadress"]
        
        mailViewController.mailComposeDelegate = self
        mailViewController.setSubject("メールの件名")
        mailViewController.setToRecipients(toRecipients) //Toアドレスの表示
        mailViewController.setMessageBody("メールの本文", isHTML: false)
        
        self.present(mailViewController, animated: true, completion: nil)
    }
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        
        switch result.rawValue {
        case MFMailComposeResult.cancelled.rawValue:
            print("Email Send Cancelled")
            break
        case MFMailComposeResult.saved.rawValue:
            print("Email Saved as a Draft")
            break
        case MFMailComposeResult.sent.rawValue:
            print("Email Sent Successfully")
            break
        case MFMailComposeResult.failed.rawValue:
            print("Email Send Failed")
            break
        default:
            break
        }
        
        self.self.dismiss(animated: true)
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
