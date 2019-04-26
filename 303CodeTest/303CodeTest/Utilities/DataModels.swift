//
//  DataModels.swift
//  303CodeTest
//
//  Created by ryan kowalski on 4/25/19.
//  Copyright © 2019 ryan kowalski. All rights reserved.
//

import UIKit

class PersonObject: NSObject {
    var firstNameString, lasntNameString, cityString : String?
    init(dictionary: NSDictionary) {
        firstNameString = dictionary["fname"] as? String
        lasntNameString = dictionary["lname"] as? String
        cityString = dictionary["city"] as? String
    }
}

struct Constants {
    static var personArray = [PersonObject]()
}


class RoundShadowView: UIView {
    private var shadowLayer: CAShapeLayer!
    private var cornerRadius: CGFloat = 15.0
    private var fillColor: UIColor = .white
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if shadowLayer == nil {
            shadowLayer = CAShapeLayer()
            
            shadowLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).cgPath
            shadowLayer.fillColor = fillColor.cgColor
            
            shadowLayer.shadowColor = UIColor.black.cgColor
            shadowLayer.shadowPath = shadowLayer.path
            shadowLayer.shadowOffset = CGSize(width: 0.0, height: 1.0)
            shadowLayer.shadowOpacity = 0.2
            shadowLayer.shadowRadius = 3
            
            layer.insertSublayer(shadowLayer, at: 0)
        }
    }
}
