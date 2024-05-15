//
//  ViewController.swift
//  ExConfetti
//
//  Created by 김종권 on 2024/05/15.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        showFirework()
        showSnowfall()
    }
    
    func showFirework() {
        let emitterCell = CAEmitterCell.item(with: Config.PresetType.firework.value)
        
        let emitterLayer = CAEmitterLayer()
        emitterLayer.emitterPosition = CGPoint(x: view.bounds.midX, y: UIScreen.main.bounds.height)
        emitterLayer.emitterShape = .line
        emitterLayer.emitterSize = CGSize(width: view.bounds.width, height: 1)
        emitterLayer.emitterCells = [emitterCell]
        
        view.layer.addSublayer(emitterLayer)
    }

    func showSnowfall() {
        let emitterCell = CAEmitterCell.item(with: Config.PresetType.snow.value)
        
        let emitterLayer = CAEmitterLayer()
        emitterLayer.emitterPosition = CGPoint(x: view.bounds.midX, y: 100)
        emitterLayer.emitterShape = .line
        emitterLayer.emitterSize = CGSize(width: view.bounds.width, height: 1)
        emitterLayer.emitterCells = [emitterCell]
        
        view.layer.addSublayer(emitterLayer)
    }
}
