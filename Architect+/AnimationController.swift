//
//  AnimationController.swift
//  Architect+
//
//  Created by Ivan Herashchenko on 02.05.2020.
//  Copyright © 2020 Ivan Herashchenko. All rights reserved.
//

import UIKit
import Lottie

class AnimationController: UIViewController {
    
    let animationView = AnimationView()
    let df = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        startAnimation()
    }
    
    func startAnimation() {
        animationView.animation = Animation.named("home")
        animationView.frame = view.bounds
        animationView.frame.size.height = 400
        animationView.frame.size.width = 400
        animationView.center = view.center
        animationView.contentMode = .scaleAspectFit
        animationView.play()
        view.addSubview(animationView)
    }

}
