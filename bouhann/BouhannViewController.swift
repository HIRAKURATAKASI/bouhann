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
        self.onClickStartMailerBtn()
        
        
    }

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
    func onClickStartMailerBtn() {
        //メールを送信できるかチェック
//        if MFMailComposeViewController.canSendMail()==false {
//            print("メールが送られませんでした。再度メールを送ってください")
//            return
//        }
        
        var mailViewController = MFMailComposeViewController()
        var toRecipients = ["to@1gmail.com"]
        var CcRecipients = ["cc@1gmail.com","Cc2@1gmail.com"]
        var BccRecipients = ["Bcc@1gmail.com","Bcc2@1gmail.com"]
        
        
        mailViewController.mailComposeDelegate = self
        mailViewController.setSubject("メールの件名")
        mailViewController.setToRecipients(toRecipients) //Toアドレスの表示
        mailViewController.setCcRecipients(CcRecipients) //Ccアドレスの表示
        mailViewController.setBccRecipients(BccRecipients) //Bccアドレスの表示
        mailViewController.setMessageBody("メールの本文", isHTML: false)
        
        self.present(mailViewController, animated: true, completion: nil)
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
