//
//  ViewController.swift
//  Sunnystagram
//
//  Created by Abhijeet Chaudhary on 29/11/15.
//  Copyright © 2015 Abhijeet Chaudhary. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imgImage: UIImageView!
    @IBOutlet weak var segFilterChoice: UISegmentedControl!
    
    var imageSource = UIImage(named: "001.png")

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnSwitchFilterACTION(sender: UIButton) {
        
       segmentedControlChoice()
    }
    
    func segmentedControlChoice(){
        
        if segFilterChoice.selectedSegmentIndex == 0{
            setProcessFilter()
        }
        if segFilterChoice.selectedSegmentIndex == 1{
            setNoirFilter()
        }
        if segFilterChoice.selectedSegmentIndex == 2{
            setChromeFilter()
        }
        if segFilterChoice.selectedSegmentIndex == 3{
            setSepiaFilter()
        }
        if segFilterChoice.selectedSegmentIndex == 4{
            setVariance()
        }
    }

    func setProcessFilter(){
        
        var originalImage = CIImage(image: imageSource!)
        
        var filter = CIFilter(name: "CIPhotoEffectProcess")
        filter?.setDefaults()
        filter?.setValue(originalImage, forKey: kCIInputImageKey)
        
        var imageOutput = filter!.outputImage
        var newImage = UIImage(CIImage: imageOutput!)
        
        imgImage.image = newImage
        
        
    }
    
    func setNoirFilter(){
        
        var originalImage = CIImage(image: imageSource!)
        
        var filter = CIFilter(name: "CIPhotoEffectNoir")
        filter?.setDefaults()
        filter?.setValue(originalImage, forKey: kCIInputImageKey)
        
        var imageOutput = filter!.outputImage
        var newImage = UIImage(CIImage: imageOutput!)
        
        imgImage.image = newImage
        
    }
    
    func setChromeFilter(){
        
        var originalImage = CIImage(image: imageSource!)
        
        var filter = CIFilter(name: "CIPhotoEffectChrome")
        filter?.setDefaults()
        filter?.setValue(originalImage, forKey: kCIInputImageKey)
        
        var imageOutput = filter!.outputImage
        var newImage = UIImage(CIImage: imageOutput!)
        
        imgImage.image = newImage
        
    }
    
    func setSepiaFilter(){
        var originalImage = CIImage(image: imageSource!)
        
        var filter = CIFilter(name: "CISepiaTone")
        filter?.setDefaults()
        filter?.setValue(originalImage, forKey: kCIInputImageKey)
        filter?.setValue(0.8, forKey: "inputIntensity")
        
        var imageOutput = filter!.outputImage
        var newImage = UIImage(CIImage: imageOutput!)
        
        imgImage.image = newImage
        
    }
    
    func setVariance(){
        var originalImage = CIImage(image: imageSource!)
        var filter = CIFilter (name: "CIVibrance")
        filter?.setDefaults()
        filter?.setValue(originalImage, forKey: kCIInputImageKey)
        filter?.setValue(1, forKey: "inputAmount")
        
        var imageOutput = filter!.outputImage
        var newImage = UIImage(CIImage: imageOutput!)
        
        imgImage.image = newImage
    }
    
}

