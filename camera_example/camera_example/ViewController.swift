//
//  ViewController.swift
//  camera_example
//
//  Created by 蔡磊 on 16/6/25.
//  Copyright © 2016年 cailei. All rights reserved.
//

import UIKit
import FastttCamera
import YYKit

class ViewController: UIViewController,FastttCameraDelegate {
    
    
    //设置滤镜
    var cameraManager:FastttFilterCamera?
    lazy var flashLightButton = UIButton()
    lazy var toggleButton = UIButton()
    lazy var torchButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.cameraManager = FastttFilterCamera()

        cameraManager!.delegate = self
        cameraManager!.view.frame = self.view.frame
        
        self.fastttAddChildViewController(self.cameraManager)
        
        
        view.addSubview(flashLightButton)
        view.addSubview(toggleButton)
        view.addSubview(torchButton)
        
        flashLightButton.frame = CGRect(x: 0, y: 300, width: 20, height: 20)
        toggleButton.frame = CGRect(x: 100, y: 300, width: 20, height: 20)
        torchButton.frame = CGRect(x: 200, y: 300, width: 20, height: 20)
        
        flashLightButton.backgroundColor = UIColor.redColor()
        toggleButton.backgroundColor = UIColor.redColor()
        torchButton.backgroundColor = UIColor.redColor()
        
        //闪光灯
        flashLightButton.addBlockForControlEvents(.TouchUpInside) { (button) in
            if FastttCamera.isFlashAvailableForCameraDevice(self.cameraManager!.cameraDevice){
                self.cameraManager!.cameraFlashMode = .Auto
            }
            

        }
        
        //前后镜头切换
        toggleButton.addBlockForControlEvents(.TouchUpInside) { (button) in
            if FastttCamera.isCameraDeviceAvailable(self.cameraManager!.cameraDevice) {
                self.cameraManager!.cameraDevice = .Front
            }
        }
        
        //手电模式
        torchButton.addBlockForControlEvents(.TouchUpInside) { (button) in
            if FastttCamera.isTorchAvailableForCameraDevice(self.cameraManager!.cameraDevice){
                self.cameraManager!.cameraTorchMode = .On
            }
        }

    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.cameraManager?.filterImage = UIImage(named: "lookup_sepia")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.cameraManager?.filterImage = UIImage(named: "lookup_sepia")
    }

}

