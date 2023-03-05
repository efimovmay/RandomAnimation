//
//  ViewController.swift
//  RandomAnimation
//
//  Created by Aleksey Efimov on 03.03.2023.
//

import UIKit
import SpringAnimation

class ViewController: UIViewController {

    @IBOutlet weak var randomAnimationView: SpringView!
    @IBOutlet weak var startButton: UIButton!
    
    @IBOutlet var persetLabel: UILabel!
    @IBOutlet var curveLabel: UILabel!
    @IBOutlet var forceLebel: UILabel!
    @IBOutlet var duratonLabel: UILabel!
    @IBOutlet var delayLabel: UILabel!
    
    var animation = ""
    var curve = ""
    var force: CGFloat = 0
    var duration: CGFloat = 0
    var delay: CGFloat = 0
     
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getNextAnimation()
        updateUI()
    }

    @IBAction func startAnimationButton(_ sender: Any) {
        
        randomAnimationView.animation = animation
        randomAnimationView.curve = curve
        randomAnimationView.force = force
        randomAnimationView.duration = duration
        randomAnimationView.delay = delay
        
        randomAnimationView.animate()
        
        updateUI()
        getNextAnimation()
    }
    
    func getNextAnimation(){
        
        guard let currentAnimation = AnimationPreset.allCases.randomElement()?.rawValue else { return }
        guard let currentCurve = AnimationCurve.allCases.randomElement()?.rawValue else { return }
        
        animation = currentAnimation
        curve = currentCurve
        
        force = CGFloat.random(in: 0.1...2.0)
        duration = CGFloat.random(in: 0.1...2.0)
        delay = CGFloat.random(in: 0.1...1.0)
        
        startButton.setTitle("Run " + (animation), for: .normal)
    }
    
    func updateUI(){
        
        persetLabel.text = "Perset: \(animation)"
        curveLabel.text = "Curve: \(curve)"
        forceLebel.text = "Force: \(String(format: "%0.2f",force))"
        duratonLabel.text = "Duration: \(String(format: "%0.2f",duration))"
        delayLabel.text = "Delay: \(String(format: "%0.2f",delay))"

    }
}

