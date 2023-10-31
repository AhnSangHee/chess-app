//
//  Board.swift
//  ChessGame
//
//  Created by 안상희 on 10/28/23.
//

import Foundation

struct Board {
  private var map: [[String]]
  private let maxSize: Int = 8
  
  // 체스 프로그램을 시작하면 흑/백 Pawn을 초기화한다.
  init() {
    self.map = Array(repeating: Array(repeating: ".", count: maxSize), count: maxSize)
    
    initChessBoard()
  }
  
  func display() -> [[String]] {
    return map
  }
  
  // 체스 게임과 달리 처음에도 1칸만 움직일 수 있고, 다른 말을 잡을 때도 대각선이 아니라 직선으로 움직일 때 잡는다고 가정한다.
  // 말을 옮길 수 있으면 true, 옮길 수 없으면 false를 리턴한다.
  func moveable(_ piece: Piece, to pos: Position) -> Bool {
    guard isValidRange(piece, position: pos) else { return false }
    guard !isDiagonalMove(piece, position: pos) else { return false }
    // 같은 색상의 말이 to 위치에 이미 있으면 옮길 수 없다.
    if piece.type.color.shape == map[pos.rank.rawValue][pos.file.rawValue] { return false }
    return true
  }
  
  // 다른 색상의 말이 to 위치에 있는 경우는 기존에 있던 말을 제거하고 이동한다.
  mutating func movePiece(_ piece: Piece, to pos: Position) {
    if moveable(piece, to: pos) {
      map[pos.rank.rawValue][pos.file.rawValue] = Pawn(color: piece.type.color).color.shape
      map[piece.position.rank.rawValue][piece.position.file.rawValue] = "."
    }
  }
  
  // 2-rank에는 흑백 체스말, 7-rank에는 백색 체스말로 초기화
  private mutating func initChessBoard() {
    map[Rank.two.rawValue] = Array(repeating: Pawn(color: .black).color.shape, count: maxSize)
    map[Rank.seven.rawValue] = Array(repeating: Pawn(color: .white).color.shape, count: maxSize)
  }
  
  // 백색은 큰 rank에서 더 작은 rank로 움직일 수 있고, 흑색은 작은 rank에서 더 큰 rank로 움직일 수 있다.
  private func isValidRange(_ piece: Piece, position: Position) -> Bool {
    if piece.type.color == .black {
      // (이동 전 rank - 이동 후 rank) > 0이어야 가능
      guard piece.position.rank.rawValue - position.rank.rawValue < 0 else { return false }
    } else {
      // (이동 전 rank - 이동 후 rank) < 0이어야 가능
      guard piece.position.rank.rawValue - position.rank.rawValue > 0 else { return false }
    }
    return true
  }
  
  // 대각선 이동은 불가능
  private func isDiagonalMove(_ piece: Piece, position: Position) -> Bool {
    let moves = [(-1, 1), (1, 1), (1, -1), (-1, -1)]
    
    for move in moves {
      if (piece.position.rank.rawValue + move.0 == position.rank.rawValue) && (piece.position.file.rawValue + move.1 == position.file.rawValue) {
        return true
      }
    }
    return false
  }
}
