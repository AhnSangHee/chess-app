//
//  Queen.swift
//  ChessGame
//
//  Created by 안상희 on 10/31/23.
//

import Foundation

struct Queen: PieceType {
  var color: PieceColor
  var score: Int = 9
  var symbol: String {
    switch color {
    case .black:
      return "♛"
    case .white:
      return "♕"
    }
  }
  
  func availableInitialPositions() -> [Position] {
    return color == .black ? [Position(rank: .one, file: .E)] : [Position(rank: .eight, file: .E)]
  }
}
