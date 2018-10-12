//
//  ViewController.swift
//  PressableView
//
//  Created by Linus Geffarth on 10/05/2018.
//  Copyright (c) 2018 Linus Geffarth. All rights reserved.
//

import UIKit
import PressableView

class ViewController: UIViewController {

    @IBOutlet weak var button: PressableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        button.layer.cornerRadius = button.frame.height/2
    }
    
    @IBAction func buttonPressed() {
        
    }
}
