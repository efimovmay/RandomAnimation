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
    
    var animation = AnimationPreset.allCases.randomElement()
    var curve = AnimationCurve.allCases.randomElement()
    var force: CGFloat = 1.0
    var duration: CGFloat = 1.0
    var delay: CGFloat = 1.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }

    @IBAction func startAnimationButton(_ sender: Any) {
       
        randomAnimationView.animation = animation?.rawValue ?? ""
        randomAnimationView.curve = curve?.rawValue ?? ""
        
        randomAnimationView.animate()
        
        updateUI()
        getNextAnimation()
    }
    
    func getNextAnimation(){
        
        animation = AnimationPreset.allCases.randomElement()
        curve = AnimationCurve.allCases.randomElement()
        
        force = CGFloat.random(in: 0.1...2.0)
        duration = CGFloat.random(in: 0.1...2.0)
        delay = CGFloat.random(in: 0.1...2.0)
        
        startButton.setTitle("Run " + (animation?.rawValue ?? ""), for: .normal)
    }
    
    func updateUI(){
        
        persetLabel.text = "Perset: \(animation?.rawValue ?? "")"
        curveLabel.text = "Curve: \(curve?.rawValue ?? "")"
        forceLebel.text = "Force: \(String(format: "%0.2f",force))"
        duratonLabel.text = "Duration: \(String(format: "%0.2f",duration))"
        delayLabel.text = "Delay: \(String(format: "%0.2f",delay))"

    }
}

