//
//  ViewController.swift
//  MagicGrids
//
//  Created by Minxin Guo on 6/29/17.
//  Copyright © 2017 Minxin Guo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private let numberPerRow = 15
    private var colorViewsDict = [String: UIView]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createGrids(numPerRow: numberPerRow)
        addPanGestureToView()
    }
    
    func createGrids(numPerRow: Int) {
        let screenWidth = view.frame.width
        let screenHeight = view.frame.height
        
        let width = screenWidth / CGFloat(numPerRow)
        let numOfRows = Int(screenHeight) / Int(width)
        
        for row in 0..<numOfRows {
            for col in 0...numPerRow {
                let colorView = UIView()
                colorView.backgroundColor = createRandomColor()
                colorView.frame = CGRect(x: CGFloat(col) * width, y: CGFloat(row) * width , width: width, height: width)
                colorView.layer.borderWidth = 0.5
                colorView.layer.borderColor = UIColor.black.cgColor
                view.addSubview(colorView)
                colorViewsDict["\(row)|\(col)"] = colorView
            }
        }
    }
    
    private func addPanGestureToView() {
        view.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(handlePan)))
    }
    
    func handlePan(gesture: UIPanGestureRecognizer) {
        let location = gesture.location(in: view)
        
        let screenWidth = view.frame.width
        let width = screenWidth / CGFloat(numberPerRow)
        
        let row = Int(location.y / width)
        let col = Int(location.x / width)
        
        let cell = colorViewsDict["\(row)|\(col)"]
        cell?.backgroundColor = .white
    }
    
    private func createRandomColor() -> UIColor {
        let r = CGFloat(drand48())
        let g = CGFloat(drand48())
        let b = CGFloat(drand48())
        return UIColor(red: r, green: g, blue: b, alpha: 1.0)
    }
}
