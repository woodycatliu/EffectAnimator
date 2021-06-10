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
        
        basicView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(stop)))
        let twoTap = UITapGestureRecognizer(target: self, action: #selector(reSet))
        twoTap.numberOfTapsRequired = 2
        basicView.addGestureRecognizer(twoTap)

        renderer.text = "Test addsadsad"
        renderer.direction = .left

        waveMarqeeRenderer.text = "https://translate.google.com.tw/?hl=zh-TW&sl=zh-CN&tl=en&text=X%20%E8%BB%B8&op=translate"
        
//        basicView.animatorRenderers = [waveRenderer, renderer, waveMarqeeRenderer]
        
        let cir = CircleRenderer(duration: 30)
        
        basicView.animatorRenderers = [cir]

        basicView.backgroundColor = .yellow
        
        view.addSubview(basicView)
        basicView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            basicView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            basicView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            basicView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            basicView.heightAnchor.constraint(equalToConstant: 100)
        ])
        basicView.setup()
        basicView.startAnimate()
        
        
//        let rview = RhombusView()
//
//        view.addSubview(rview)
//        rview.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            rview.topAnchor.constraint(equalTo: basicView.bottomAnchor),
//            rview.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            rview.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            rview.heightAnchor.constraint(equalToConstant: 300)
//        ])
        
    
    }
    
    @objc func stop() {
        basicView.stopAnimate()
    }

    @objc func reSet() {
//        basicView.lastUpdateTime = 0
        basicView.reset()
        basicView.startAnimate()
    }
    
}

extension BasicAnimator {
    func reset() {
        animatorRenderers.forEach {
            $0.launchedTimeInterval = 0
        }
        beginTime = nil
        setup()
    }
}



class CircleRenderer: BaseRendererProtocol {
    var isEnd: Bool = false
    
    weak var delegate: RendererDelegate?
    
    var identifier: String
    
    var duration: Double = 30.0
    
    var launchedTimeInterval: CFTimeInterval = 0.0
    
    var repeatCount: Double = .greatestFiniteMagnitude
    
    func _draw(in ctx: CGContext, _ rect: CGRect, percent: CGFloat) -> CGContext {
        
        let center: CGPoint = .init(x: rect.width / 2, y: rect.height / 2)
        
        let endAgnle: CGFloat = .pi + .pi / 2 + 2 * .pi * percent
        
        ctx.addArc(center: center, radius: rect.height / 2, startAngle: .pi + .pi / 2, endAngle: endAgnle, clockwise: false)
        UIColor.red.setStroke()
        ctx.addLine(to: center)
        
        ctx.fillPath()
        
        return ctx
    }
    
    init(duration: Double, identifier: String = "DrawCircle") {
        self.duration = duration
        self.identifier = identifier
    }
    
}
