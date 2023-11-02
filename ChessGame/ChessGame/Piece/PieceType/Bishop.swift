//
//  Bishop.swift
//  ChessGame
//
//  Created by 안상희 on 10/31/23.
//

import Foundation

struct Bishop: PieceType {
  var color: PieceColor
  var score: Int = 3
  var symbol: String {
    switch color {
    case .black:
      return "♝"
    case .white:
      return "♗"
    }
  }
  
  func availableInitialPositions()  -> [Position] {
    if color == .black {
      [
        Position(rank: .one, file: .C),
        Position(rank: .one, file: .F)
      ]
    } else {
      [
        Position(rank: .eight, file: .C),
        Position(rank: .eight, file: .F)
      ]
    }
  }
}
