//
//  ViewController.swift
//  FaceRecognition
//
//  Created by suckerl on 2017/5/18.
//  Copyright © 2017年 suckerl. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resultImageView: UIImageView!
    @IBOutlet weak var recognitionButtom: UIButton!
    @IBOutlet weak var resuleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        recognitionButtom.layer.cornerRadius = 8
    }


    @IBAction func recognitionButtonClick(_ sender: UIButton) {

    
    }
}

