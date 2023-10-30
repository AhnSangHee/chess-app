//
//  Board.swift
//  ChessGame
//
//  Created by 안상희 on 10/28/23.
//

import Foundation

struct Board: Equatable {
  var map: [[String]]
  
  // 체스 프로그램을 시작하면 흑/백 Pawn을 초기화한다.
  init() {
    self.map = Array(repeating: Array(repeating: ".", count: 8), count: 8)
    
    // 2-rank에는 흑백 체스말
    
    
    // 7-rank에는 백색 체스말
    
  }
  
  // 1-rank ~ 8-rank까지 rank 문자열 배열로 보드 위에 체스말 리턴
  func display() {
    print("  ABCDEFGH")
    for index in 1..<9 {
      print(index, map[index - 1].joined())
    }
    print("  ABCDEFGH")
  }
  
  mutating func move() { }
}
