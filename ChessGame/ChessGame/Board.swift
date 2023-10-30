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
  
  // 2-rank에는 흑백 체스말, 7-rank에는 백색 체스말로 초기화
  private mutating func initChessBoard() {
    map[Rank.two.rawValue] = Array(repeating: Pawn(color: .black).color.shape, count: maxSize)
    map[Rank.seven.rawValue] = Array(repeating: Pawn(color: .white).color.shape, count: maxSize)
  }
  
  mutating func move() { }
}
