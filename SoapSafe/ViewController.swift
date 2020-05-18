//
//  ViewController.swift
//  SoapSafe
//
//  Created by Carmen-Computer on 5/14/20.
//  Copyright © 2020 Carmen-Computer. All rights reserved.
//

import UIKit
import RealityKit

class ViewController: UIViewController {
    
    @IBOutlet var arView: ARView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load the "Box" scene from the "Experience" Reality File
        let boxAnchor = try! Experience.loadStartUp()
        
        // Add the box anchor to the scene
        arView.scene.anchors.append(boxAnchor)
    }
}
