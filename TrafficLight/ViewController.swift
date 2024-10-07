//
//  ViewController.swift
//  TrafficLight
//
//  Created by Тадевос Курдоглян on 27.09.2024.
//

import UIKit

final class ViewController: UIViewController {
    
    @IBOutlet var redView: UIView!
    @IBOutlet var yellowView: UIView!
    @IBOutlet var greenView: UIView!
    
    @IBOutlet var switchButton: UIButton!
    
    private let lightOn = 1.0
    private let lightOff = 0.3
    
    private enum LightState {
        case red
        case yellow
        case green
    }
    
    private var currentLightState: LightState = .red
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redView.alpha = lightOff
        yellowView.alpha = lightOff
        greenView.alpha = lightOff
    }
    
    override func viewDidLayoutSubviews() {
        switchButton.layer.cornerRadius = 20
        
        redView.layer.cornerRadius = redView.frame.width / 2
        yellowView.layer.cornerRadius = redView.frame.width / 2
        greenView.layer.cornerRadius = redView.frame.width / 2
    }
    
   
    
    @IBAction func switchButtonTapped(_ sender: UIButton) {
        if switchButton.titleLabel?.text == "Start" {
            switchButton.setTitle("Next", for: .normal)
        }
        
        switch currentLightState {
        case .red:
            redView.alpha = lightOn
            greenView.alpha = lightOff
            currentLightState = .yellow
        case .yellow:
            yellowView.alpha = lightOn
            redView.alpha = lightOff
            currentLightState = .green
        case .green:
            greenView.alpha = lightOn
            yellowView.alpha = lightOff
            currentLightState = .red
        }
    }
}


