//
//  Knight.swift
//  ChessGame
//
//  Created by 안상희 on 10/31/23.
//

import Foundation

struct Knight: PieceType {
  var color: PieceColor
  var score: Int = 3
  var symbol: String {
    switch color {
    case .black:
      return "♞"
    case .white:
      return "♘"
    }
  }
  
  func availableInitialPositions() -> [Position] {
    if color == .black {
      [
        Position(rank: .one, file: .B),
        Position(rank: .one, file: .G)
      ]
    } else {
      [
        Position(rank: .eight, file: .B),
        Position(rank: .eight, file: .G)
      ]
    }
  }
}
