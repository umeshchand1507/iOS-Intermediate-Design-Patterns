//
//  TurnController.swift
//  DesignPatternsInSwift
//
//  Created by Christopher Pilcher on 8/06/15.
//  Copyright (c) 2015 RepublicOfApps, LLC. All rights reserved.
//

import Foundation

class TurnController {
  
  private let shapeFactory: ShapeFactory
  private var shapeViewBuilder: ShapeViewBuilder
  
  var currentTurn: Turn?
  var pastTurns: [Turn] = [Turn]()
  
  init(shapeFactory: ShapeFactory, shapeViewBuilder: ShapeViewBuilder) {
    self.shapeFactory = shapeFactory
    self.shapeViewBuilder = shapeViewBuilder
  }
  
  func beginNewTurn() -> (ShapeView, ShapeView) {
    let shapes = shapeFactory.createShapes()
    let shapeViews = shapeViewBuilder.buildShapeViewsForShapes(shapes)
    currentTurn = Turn(shapes: [shapeViews.0.shape, shapeViews.1.shape])
    return shapeViews
  }
  
  func endTurnWithTappedShape(tappedShape: Shape) -> Int {
    currentTurn!.turnCompletedWithTappedShape(tappedShape)
    pastTurns.append(currentTurn!)
    
    var scoreIncrement = currentTurn!.matched! ? 1 : -1
    
    return scoreIncrement
  }
}
