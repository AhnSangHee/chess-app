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
}
