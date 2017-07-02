//
//  ViewController.swift
//  Blurry Pop Up
//
//  Created by Minxin Guo on 7/2/17.
//  Copyright © 2017 Minxin Guo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var popUpView: UIView!
    @IBOutlet weak var blurEffectView: UIVisualEffectView!
    
    private var blurEffect: UIVisualEffect!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        // Store blur effect
        blurEffect = blurEffectView.effect
        blurEffectView.effect = nil
        
        // Setup popup view
        popUpView.layer.cornerRadius = 8
    }

    @IBAction func dismissPopUp(_ sender: Any) {
        animateOut()
    }
    
    @IBAction func addAnItem(_ sender: Any) {
        animateIn()
    }
    
    private func animateIn() {
        popUpView.transform = CGAffineTransform.init(scaleX: 1.5, y: 1.5)
        popUpView.alpha = 0
        popUpView.center = view.center
        view.addSubview(popUpView)
        
        UIView.animate(withDuration: 0.3) {
            self.popUpView.transform = CGAffineTransform.identity
            self.popUpView.alpha = 1.0
            self.blurEffectView.effect = self.blurEffect
        }
    }
    
    private func animateOut() {
        UIView.animate(withDuration: 0.3, animations: {
            self.popUpView.transform = CGAffineTransform.init(scaleX: 1.5, y: 1.5)
            self.popUpView.alpha = 0.0
            self.blurEffectView.effect = nil
        }) { _ in
            self.popUpView.removeFromSuperview()
        }
    }
}
