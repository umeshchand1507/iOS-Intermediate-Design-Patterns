//
//  Turn.swift
//  DesignPatternsInSwift
//
//  Created by Christopher Pilcher on 8/06/15.
//  Copyright (c) 2015 RepublicOfApps, LLC. All rights reserved.
//

import Foundation

class Turn {
  let shapes: [Shape]
  var matched: Bool?
  
  init(shapes: [Shape]) {
    self.shapes = shapes
  }
  
  func turnCompletedWithTappedShape(tappedShape: Shape) {
    var maxArea = shapes.reduce(0) { $0 > $1.area ? $0 : $1.area }
    matched = tappedShape.area >= maxArea
  }
}
