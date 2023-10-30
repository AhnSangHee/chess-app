//
//  PieceType.swift
//  ChessGame
//
//  Created by 안상희 on 10/28/23.
//

import Foundation

protocol PieceType {
  var color: PieceColor { get set }
  var score: Int { get set }
}
