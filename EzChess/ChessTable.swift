//
//  DrawChessTable.swift
//  EzChess
//
//  Created by techmaster on 3/15/17.
//  Copyright © 2017 techmaster. All rights reserved.
//

import UIKit

class ChessTable {
    var tag = 100
    func draw(n: Int, view: UIView){
        let cellWidth = view.bounds.width / CGFloat(n)
        for subview in view.subviews  {
            if subview.tag >= 100 {
                subview.removeFromSuperview()
            }
        }
        tag = 100
        for iRow in 0..<n {
            for iColl in 0..<n {
                
                let cell = UIView(frame: CGRect(x: CGFloat(iRow)*cellWidth, y: 100+CGFloat(iColl)*cellWidth, width: cellWidth, height: cellWidth))
                let maskLayer = CAShapeLayer()
                maskLayer.frame = cell.bounds
                maskLayer.path = UIBezierPath(rect: cell.bounds).cgPath
                maskLayer.opacity = 0.7
                cell.layer.mask = maskLayer
                cell.tag = tag
                tag += 1
                let borderLayer = CAShapeLayer()
                borderLayer.path = maskLayer.path
                if iRow % 2 == 0 && iColl % 2 == 0 {
                    borderLayer.fillColor = UIColor.blue.cgColor
                }
                else if iRow % 2 != 0 && iColl % 2 != 0 {
                    borderLayer.fillColor = UIColor.blue.cgColor
                }else {
                    borderLayer.fillColor = UIColor.red.cgColor
                }
                borderLayer.strokeColor = UIColor.black.cgColor
                borderLayer.lineWidth = 2
                borderLayer.frame = cell.bounds
                cell.layer.addSublayer(borderLayer)
                view.addSubview(cell)
            }
        }
    }
}
