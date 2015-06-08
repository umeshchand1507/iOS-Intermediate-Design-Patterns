//
//  GameViewController.swift
//  DesignPatternsInSwift
//
//  Created by Joel Shapiro on 9/23/14.
//  Copyright (c) 2014 RepublicOfApps, LLC. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {

  private var shapeViewFactory: ShapeViewFactory!
  private var shapeFactory: ShapeFactory!
  private var shapeViewBuilder: ShapeViewBuilder!
  private var turnController: TurnController!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    shapeViewFactory = SquareShapeViewFactory(size: gameView.sizeAvailableForShapes())
    shapeFactory = SquareShapeFactory(minProportion: 0.3, maxProportion: 0.8)
//    shapeViewFactory = CircleShapeViewFactory(size: gameView.sizeAvailableForShapes())
//    shapeFactory = CircleShapeFactory(minProportion: 0.3, maxProportion: 0.8)
    
    shapeViewBuilder = ShapeViewBuilder(shapeViewFactory: shapeViewFactory)
    shapeViewBuilder.fillColor = UIColor.brownColor()
    shapeViewBuilder.outlineColor = UIColor.orangeColor()
    
    turnController = TurnController(shapeFactory: shapeFactory, shapeViewBuilder: shapeViewBuilder)
    
    beginNextTurn()
  }

  override func prefersStatusBarHidden() -> Bool {
    return true
  }

  private func beginNextTurn() {
    
    let shapeViews = turnController.beginNewTurn()
    
    shapeViews.0.tapHandler = {
      tappedView in
      
      self.gameView.score += self.turnController.endTurnWithTappedShape(tappedView.shape)
      self.beginNextTurn()
    }
    shapeViews.1.tapHandler = shapeViews.0.tapHandler

    gameView.addShapeViews(shapeViews)
  }

  private var gameView: GameView { return view as! GameView }
}
