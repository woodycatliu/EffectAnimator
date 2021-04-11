//
//  ViewController.swift
//  EffectAnimatorDemo
//
//  Created by Woody on 2021/4/6.
//

import UIKit
import EffectAnimator


class ViewController: UIViewController {

    let basicView: EABasicView = EABasicView()
    
    let renderer: MqrqueeRenderer = MqrqueeRenderer(duration: 5)
    
    let waveMarqeeRenderer: WaveMqrqueeRenderer = WaveMqrqueeRenderer(duration: 5)
    
    let waveRenderer: OceanWaveRenderer = OceanWaveRenderer(duration: 3)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        renderer.text = "Test addsadsad"
        renderer.direction = .left

        waveMarqeeRenderer.text = "https://translate.google.com.tw/?hl=zh-TW&sl=zh-CN&tl=en&text=X%20%E8%BB%B8&op=translate"
        
//        basicView.animatorRenderers = [waveRenderer, renderer, waveMarqeeRenderer]
        
        basicView.animatorRenderers = [renderer]

        basicView.backgroundColor = .yellow
        
        view.addSubview(basicView)
        basicView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            basicView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            basicView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            basicView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            basicView.heightAnchor.constraint(equalToConstant: 50)
        ])
        basicView.setup()
        basicView.startAnimate()
    
    }
    

}

