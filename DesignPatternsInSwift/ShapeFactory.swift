//
//  ShapeFactory.swift
//  DesignPatternsInSwift
//
//  Created by Christopher Pilcher on 7/06/15.
//  Copyright (c) 2015 RepublicOfApps, LLC. All rights reserved.
//

import Foundation
import UIKit

protocol ShapeFactory {
  func createShapes() -> (Shape, Shape)
}

class SquareShapeFactory : ShapeFactory {
  
  var minProportion: CGFloat
  var maxProportion: CGFloat
  
  init(minProportion: CGFloat, maxProportion: CGFloat) {
    self.minProportion = minProportion
    self.maxProportion = maxProportion
  }
  
  func createShapes() -> (Shape, Shape) {
    let shape1 = SquareShape()
    shape1.sideLength = Utils.randomBetweenLower(minProportion, andUpper: maxProportion)
    
    let shape2 = SquareShape()
    shape2.sideLength = Utils.randomBetweenLower(minProportion, andUpper: maxProportion)
    
    return (shape1, shape2)
  }
}

