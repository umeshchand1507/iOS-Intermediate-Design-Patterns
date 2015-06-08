//
//  ShapeViewBuilder.swift
//  DesignPatternsInSwift
//
//  Created by Christopher Pilcher on 8/06/15.
//  Copyright (c) 2015 RepublicOfApps, LLC. All rights reserved.
//

import Foundation
import UIKit

class ShapeViewBuilder {
  
  private var shapeViewFactory: ShapeViewFactory
  
  var showFill = true
  var fillColor = UIColor.orangeColor()
  
  var showOutline = true
  var outlineColor = UIColor.grayColor()
  
  init(shapeViewFactory: ShapeViewFactory) {
    self.shapeViewFactory = shapeViewFactory
  }
  
  func buildShapeViewsForShapes(shapes: (Shape, Shape)) -> (ShapeView, ShapeView) {
    
    let shapeViews = shapeViewFactory.makeShapeViewsForShapes(shapes)
    configureShapeView(shapeViews.0)
    configureShapeView(shapeViews.1)
    return shapeViews
  }
  
  func configureShapeView(shapeview: ShapeView) {
    shapeview.showFill = showFill
    shapeview.fillColor = fillColor
    shapeview.showOutline = showOutline
    shapeview.outlineColor = outlineColor
  }
}
