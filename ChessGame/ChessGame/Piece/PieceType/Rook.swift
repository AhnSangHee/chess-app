//
//  Rook.swift
//  ChessGame
//
//  Created by 안상희 on 10/31/23.
//

import Foundation

struct Rook: PieceType {
  var color: PieceColor
  var score: Int = 5
  var symbol: String {
    switch color {
    case .black:
      return "♜"
    case .white:
      return "♖"
    }
  }
  
  func availableInitialPositions() -> [Position] {
    if color == .black {
      [
        Position(rank: .one, file: .A),
        Position(rank: .one, file: .H)
      ]
    } else {
      [
        Position(rank: .eight, file: .A),
        Position(rank: .eight, file: .H)
      ]
    }
  }
}
