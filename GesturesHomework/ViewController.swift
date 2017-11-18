//
//  ViewController.swift
//  GesturesHomework
//
//  Created by Vadim Shoshin on 18.11.2017.
//  Copyright © 2017 Vadim Shoshin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet private weak var actionView: UIView!
    @IBOutlet private var mainView: UIView!
    private var yScale: CGFloat = 1
    override func viewDidLoad() {
        super.viewDidLoad()
        actionView.backgroundColor = .purple
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapGestureRecognized(_ :)))
        actionView.addGestureRecognizer(tapGesture)
        
        let rightSwipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(swipeGestureRecogized(_ :)))
        rightSwipeGesture.direction = .right
        mainView.addGestureRecognizer(rightSwipeGesture)
        
        let leftSwipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(swipeGestureRecogized(_ :)))
        leftSwipeGesture.direction = .left
        mainView.addGestureRecognizer(leftSwipeGesture)
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panGestureRecognized(_ :)))
        actionView.addGestureRecognizer(panGesture)
        
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(pinchGestureRecognized(_ :)))
        actionView.addGestureRecognizer(pinchGesture)
    }
    
    @objc func tapGestureRecognized(_ sender: UITapGestureRecognizer) {
        actionView.backgroundColor = UIColor.random
    }
    
    @objc func swipeGestureRecogized(_ sender: UISwipeGestureRecognizer) {
        //var yScale: CGFloat = 1
        yScale = yScale * (-1)
        UIView.animate(withDuration: 1) {
            self.actionView.transform = CGAffineTransform(scaleX: 1, y: self.yScale)
        }
    }
    
    @objc func panGestureRecognized(_ sender: UIPanGestureRecognizer) {
        let point = sender.location(in: view)
        self.actionView.center = point
    }
    
    @objc func pinchGestureRecognized(_ sender: UIPinchGestureRecognizer) {
        guard let viewToZoom = sender.view else { return }
        sender.view?.transform = viewToZoom.transform.scaledBy(x: sender.scale, y: sender.scale)
        sender.scale = 1
    }
}

