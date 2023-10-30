//
//  ChessGameTests.swift
//  ChessGameTests
//
//  Created by 안상희 on 10/28/23.
//

import XCTest

final class ChessGameTests: XCTestCase {
  
  private var sut: Board!
  
  override func setUpWithError() throws {
    sut = Board()
    
    try super.setUpWithError()
  }
  
  override func tearDownWithError() throws {
    sut = nil
    
    try super.tearDownWithError()
  }
  
  func test_체스보드가_초기화됨() {
    // given
    let board = [
      [".", ".", ".", ".", ".", ".", ".", "."],
      ["♟", "♟", "♟", "♟", "♟", "♟", "♟", "♟"],
      [".", ".", ".", ".", ".", ".", ".", "."],
      [".", ".", ".", ".", ".", ".", ".", "."],
      [".", ".", ".", ".", ".", ".", ".", "."],
      [".", ".", ".", ".", ".", ".", ".", "."],
      ["♙", "♙", "♙", "♙", "♙", "♙", "♙", "♙"],
      [".", ".", ".", ".", ".", ".", ".", "."]
    ]
    
    // when, then
    XCTAssertEqual(sut.display(), board)
  }
}
