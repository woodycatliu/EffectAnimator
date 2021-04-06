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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        renderer.text = "Test addsadsad"
        
        basicView.animatorRenderers = [renderer]
        basicView.backgroundColor = .yellow
        
        view.addSubview(basicView)
        basicView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            basicView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            basicView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            basicView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            basicView.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        basicView.setup()
        basicView.startAnimate()
    
    }
    

}

