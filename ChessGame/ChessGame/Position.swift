//
//  Position.swift
//  ChessGame
//
//  Created by 안상희 on 10/28/23.
//

import Foundation

struct Position {
  let rank: Rank
  let file: File
}

// row (가로)
enum Rank: Int, CaseIterable {
  case one = 0
  case two = 1
  case three = 2
  case four = 3
  case five = 4
  case six = 5
  case seven = 6
  case eight = 7
}

// column (세로)
enum File: Int, CaseIterable {
  case A = 0
  case B = 1
  case C = 2
  case D = 3
  case E = 4
  case F = 5
  case G = 6
  case H = 7
}
