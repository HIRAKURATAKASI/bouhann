//
//  SettteiViewController.swift
//  bouhann
//
//  Created by Flatpine8 on 2017/01/19.
//  Copyright © 2017年 mycompany. All rights reserved.
//

import UIKit

class SetteiViewController: UIViewController{
    
    
    
    @IBOutlet var dennwaTextField: UITextField!
    @IBOutlet var mailTextField: UITextField!
    
    var saveData = UserDefaults.standard
    @IBAction func save() {
        saveData.set(dennwaTextField.text, forKey:"電話番号")
        saveData.set(mailTextField.text, forKey:"メールアドレス")
        saveData.synchronize()
        //アラートを出す
        let alert = UIAlertController(title:"保存",message:"保存が完了しました",preferredStyle: .alert)
        //OKボタン
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true, completion: nil)
        // Do any additional setup after loading the view.
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dennwaTextField.text = saveData.object(forKey: "電話番号")as? String
        mailTextField.text = saveData.object(forKey: "メールアドレス")as? String
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
