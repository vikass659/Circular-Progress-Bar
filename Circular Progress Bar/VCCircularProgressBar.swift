//  Circular Progress Bar - ViewController.swift
//  Created by Vikas Ninawe on 12/9/17.
//  Copyright © 2017 VSN. All rights reserved.
//  Purpose: This controller is used to display the circular progress bar.
//

import UIKit

class VCCircularProgressBar: UIViewController{
    
    @IBOutlet weak var circularProgressBar: CircularProgressBar!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.circularProgressBar.backgroundColor = UIColor.clear
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onProgressChanged(_ sender: UIButton) {
        let randomValue = CGFloat (Float(arc4random())/Float(UINT32_MAX)) // get values between 0 to 1
        let setProgressValue = (randomValue*100) //  convert to values between 0 to 100
        self.circularProgressBar.setProgress(withProgress:setProgressValue)
        let getProgressValue = self.circularProgressBar.getProgress()
        print("Get progress - ", getProgressValue)
    }


}

