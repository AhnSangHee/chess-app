//
//  PieceColor.swift
//  ChessGame
//
//  Created by 안상희 on 10/30/23.
//

import Foundation
import SwiftUI

enum PieceColor {
  case black
  case white
  
  var color: Color {
    switch self {
    case .black:
      return .black
    case .white:
      return .white
    }
  }
}
