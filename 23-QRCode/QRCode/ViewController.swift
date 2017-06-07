//
//  ViewController.swift
//  QRCode
//
//  Created by suckerl on 2017/6/6.
//  Copyright © 2017年 suckerl. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var qrcodeImageView: UIImageView!
    @IBOutlet weak var textfied: UITextField!
    @IBOutlet weak var finishButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        textfied.delegate = self
    }
    
    @IBAction func finishButtonClick(_ sender: Any) {
       qrcodeImageView.image =  self.createQRCodeImage(textFieldStr: textfied.text)
    }
}

extension ViewController {
    func setupUI() {
        finishButton.layer.cornerRadius = 5
        textfied.layer.cornerRadius = 5
        view.backgroundColor = UIColor.lightGray
        view.alpha = 0.5
    }
}

extension ViewController : UITextFieldDelegate {
    //监听return的点击
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textfied.resignFirstResponder()
        return true
    }
    
    
    func createQRCodeImage(textFieldStr : String?) -> UIImage?  {
        
        guard let textStr = textFieldStr else {
           return nil
        }
        
        let textStrData = textStr.data(using:String.Encoding.utf8, allowLossyConversion: false)
        
        let QRFilter = CIFilter(name: "CIQRCodeGenerator")!
        QRFilter.setValue(textStrData, forKey: "inputMessage")
        QRFilter.setValue("H", forKey: "inputCorrectionLevel")
        
        let QRCIImage = QRFilter.outputImage
        
        let colorFilter = CIFilter(name: "CIFalseColor")!
        colorFilter.setDefaults()
        colorFilter.setValue(QRCIImage, forKey: "inputImage")
        colorFilter.setValue(CIColor(red: 0, green: 0, blue: 0), forKey: "inputColor0")
        colorFilter.setValue(CIColor(red: 1, green: 1, blue: 1), forKey: "inputColor1")
        
        let transform = CGAffineTransform(scaleX: 5, y: 5)
        let transformImage = colorFilter.outputImage!.applying(transform)
        let codeImage = UIImage(ciImage: transformImage)
        
        return codeImage
    }
    
    
    
}



