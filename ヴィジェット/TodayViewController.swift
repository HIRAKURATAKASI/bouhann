//
//  TodayViewController.swift
//  ヴィジェット
//
//  Created by Flatpine8 on 2017/03/02.
//  Copyright © 2017年 mycompany. All rights reserved.
//

import UIKit
import NotificationCenter

class TodayViewController: UIViewController, NCWidgetProviding {
    
    @IBOutlet var label: UILabel!
    @IBAction func dennwawidget(sender: AnyObject){
       
        
    self.updateLabel()
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view from its nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func widgetPerformUpdateWithCompletionHandler(completionHandler: ((NCUpdateResult) -> Void)!)
    {
        self.updateLabel()
        completionHandler(NCUpdateResult.newData)
    }
    
    func updateLabel()
    {
        var dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd hh:mm:ss"
        self.label.text = dateFormatter.string(from: NSDate() as Date)
    }
}
