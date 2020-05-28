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
    @IBOutlet weak var textPanel: UIVisualEffectView!
    @IBOutlet weak var nextDescription: UILabel!
    @IBOutlet weak var nextLabel: UILabel!
    @IBOutlet weak var rotateDescription: UILabel!
    @IBOutlet weak var rotateLabel: UILabel!
    @IBOutlet weak var rotateButton: UIButton!
    @IBOutlet weak var mainLogo: UIImageView!
    @IBOutlet weak var arrowIcon: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load the "Box" scene from the "Experience" Reality File
        let boxAnchor = try! Experience.loadMain()
        
        // Add the box anchor to the scene
        arView.scene.anchors.append(boxAnchor)
        
        //Custom Behaviour
        boxAnchor.actions.showPanel.onAction = handleShowPanel(_:)
        boxAnchor.actions.showNextLabel.onAction = handleShowNextLabel(_:)
    }
        
    //MARK - Custom Behaviours
    
    func handleShowPanel(_ entity:Entity?) {
        guard entity != nil else {
            return
        }
        
        print("Main Scene Started")
        
        textPanel.isHidden = false
        nextLabel.isHidden = true
        nextDescription.isHidden = true
        arrowIcon.isHidden = true
        rotateLabel.isHidden = false
        rotateDescription.isHidden = false
        rotateButton.isHidden = false
    }
    
    func handleShowNextLabel (_ entity:Entity?) {
           guard entity != nil else {
               return
           }
        
        print("Next Label Shown")
        
        textPanel.isHidden = false
        nextLabel.isHidden = false
        nextDescription.isHidden = false
        arrowIcon.isHidden = false
        rotateButton.isHidden = true
        rotateDescription.isHidden = true
        rotateLabel.isHidden = true
    }
    
    //MARK Custom Trigger
    @IBAction func onRotateTapped(_ sender: Any) {
        if let sceneAnchor = arView.scene.anchors[0] as? Experience.Main {
                  sceneAnchor.notifications.rotateLung.post()
              }
    }
}
