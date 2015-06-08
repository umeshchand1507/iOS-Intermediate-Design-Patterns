//
//  TurnController.swift
//  DesignPatternsInSwift
//
//  Created by Christopher Pilcher on 8/06/15.
//  Copyright (c) 2015 RepublicOfApps, LLC. All rights reserved.
//

import Foundation

class TurnController {
  
  private let turnStrategy: TurnStrategy
  private let scorer: Scorer
  
  var currentTurn: Turn?
  var pastTurns: [Turn] = [Turn]()
  
  init(turnStrategy: TurnStrategy) {
    self.turnStrategy = turnStrategy
    self.scorer = MatchScorer()
    self.scorer.nextScorer = StreakScorer()
  }
  
  func beginNewTurn() -> (ShapeView, ShapeView) {
    let shapeViews = turnStrategy.makeShapeViewsForNextTurnGivenPastTurns(pastTurns)
    currentTurn = Turn(shapes: [shapeViews.0.shape, shapeViews.1.shape])
    return shapeViews
  }
  
  func endTurnWithTappedShape(tappedShape: Shape) -> Int {
    currentTurn!.turnCompletedWithTappedShape(tappedShape)
    pastTurns.append(currentTurn!)
    
    var scoreIncrement = scorer.computeScoreIncrement(pastTurns.reverse())
    
    return scoreIncrement
  }
}
