//
//  GameViewController.swift
//  ParticlesShape
//
//  Created by Sebastian Buys on 4/15/18.
//  Copyright © 2018 mobilelab. All rights reserved.
//

import UIKit
import QuartzCore
import SceneKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // create a new scene
        let scene = SCNScene(named: "art.scnassets/test.scn")!
      
        // retrieve the hero node
        let hero = scene.rootNode.childNode(withName: "hero", recursively: true)!
       
        // retrieve the SCNView
        let scnView = self.view as! SCNView
        
        // set the scene to the view
        scnView.scene = scene
        
        // allows the user to manipulate the camera
        scnView.allowsCameraControl = true
        
        // show statistics such as fps and timing information
        scnView.showsStatistics = true
        
        // configure the view
        scnView.backgroundColor = UIColor.black
        
        // MARK: Particle system
        let particleSystem = SCNParticleSystem()
        
        // We will use our 3D geometry as the emitter shape
        let shape = hero.geometry
        particleSystem.emitterShape = shape
        
        // Hide the node
        hero.isHidden = true
        
        // Particle system config
        particleSystem.acceleration = SCNVector3Make(0.0, 0.0, -1.0)
        particleSystem.birthRate = 100000
        // particleSystem.particleLifeSpan = 1.0
        
        // Not using an image for each particle, so just making them small so they look like specks
        particleSystem.particleSize = 0.001
        
        // Assign an image for each particle here
        // particleSystem.particleImage =
        
        scene.rootNode.addParticleSystem(particleSystem)
    }
   
    override var shouldAutorotate: Bool {
        return true
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

}
