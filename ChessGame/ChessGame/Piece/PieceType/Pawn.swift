//
//  Pawn.swift
//  ChessGame
//
//  Created by 안상희 on 10/28/23.
//

import Foundation

struct Pawn: PieceType {
  var color: PieceColor
  var score: Int = 1
  var symbol: String {
    switch color {
    case .black:
      return "♟"
    case .white:
      return "♙"
    }
  }
  
  func availableInitialPositions() -> [Position] {
    if color == .black {
      [
        Position(rank: .two, file: .A),
        Position(rank: .two, file: .B),
        Position(rank: .two, file: .C),
        Position(rank: .two, file: .D),
        Position(rank: .two, file: .E),
        Position(rank: .two, file: .F),
        Position(rank: .two, file: .G),
        Position(rank: .two, file: .H)
      ]
    } else {
      [
        Position(rank: .seven, file: .A),
        Position(rank: .seven, file: .B),
        Position(rank: .seven, file: .C),
        Position(rank: .seven, file: .D),
        Position(rank: .seven, file: .E),
        Position(rank: .seven, file: .F),
        Position(rank: .seven, file: .G),
        Position(rank: .seven, file: .H)
      ]
    }
  }
}
