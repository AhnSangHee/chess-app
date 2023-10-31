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
  
  func test_체스보드에서_같은색상의_말이_이미_to위치에_있으면_말을_옮길수없음() {
    // given, when
    let invalidCase = sut.moveable(
      Piece(
        position: .init(rank: .one, file: .B),
        type: Pawn(color: .black)
      ),
      to: .init(rank: .two, file: .B)
    )
    
    // then
    XCTAssertFalse(invalidCase)
  }
  
  func test_체스보드에서_다른색상의_말이_to위치에_있으면_말을_제거하고_이동할수있음() {
    // given, when
    let validCase = sut.moveable(
      Piece(
        position: .init(rank: .three, file: .A),
        type: Pawn(color: .white)
      ),
      to: .init(rank: .two, file: .A)
    )
    
    // then
    XCTAssertTrue(validCase)
  }
  
  func test_체스보드에서_흰색Pawn이_위로_한칸_이동함() {
    // given
    let board = [
      [".", ".", ".", ".", ".", ".", ".", "."],
      ["♟", "♟", "♟", "♟", "♟", "♟", "♟", "♟"],
      [".", ".", ".", ".", ".", ".", ".", "."],
      [".", ".", ".", ".", ".", ".", ".", "."],
      [".", ".", ".", ".", ".", ".", ".", "."],
      ["♙", ".", ".", ".", ".", ".", ".", "."],
      [".", "♙", "♙", "♙", "♙", "♙", "♙", "♙"],
      [".", ".", ".", ".", ".", ".", ".", "."]
    ]
    
    // when
    sut.movePiece(
      Piece(
        position: .init(rank: .seven, file: .A),
        type: Pawn(color: .white)
      ),
      to: .init(rank: .six, file: .A)
    )
    
    // then
    XCTAssertEqual(sut.display(), board)
  }
  
  func test_체스보드에서_다른색상의_말이_to위치에_있으면_말을_제거하고_이동함() {
    // given
    let board = [
      [".", ".", ".", ".", ".", ".", ".", "."],
      [".", "♟", "♟", "♟", "♟", "♟", "♟", "♟"],
      [".", ".", ".", ".", ".", ".", ".", "."],
      ["♙", ".", ".", ".", ".", ".", ".", "."],
      [".", ".", ".", ".", ".", ".", ".", "."],
      [".", ".", ".", ".", ".", ".", ".", "."],
      [".", "♙", "♙", "♙", "♙", "♙", "♙", "♙"],
      [".", ".", ".", ".", ".", ".", ".", "."]
    ]
    
    // when
    sut.movePiece(
      Piece(
        position: .init(rank: .seven, file: .A),
        type: Pawn(color: .white)
      ),
      to: .init(rank: .six, file: .A)
    )
    
    sut.movePiece(
      Piece(
        position: .init(rank: .two, file: .A),
        type: Pawn(color: .black)
      ),
      to: .init(rank: .three, file: .A)
    )
    
    sut.movePiece(
      Piece(
        position: .init(rank: .six, file: .A),
        type: Pawn(color: .white)
      ),
      to: .init(rank: .five, file: .A)
    )
    
    sut.movePiece(
      Piece(
        position: .init(rank: .three, file: .A),
        type: Pawn(color: .black)
      ),
      to: .init(rank: .four, file: .A)
    )
    
    sut.movePiece(
      Piece(
        position: .init(rank: .five, file: .A),
        type: Pawn(color: .white)
      ),
      to: .init(rank: .four, file: .A)
    )
    
    // then
    XCTAssertEqual(sut.display(), board)
  }
  
  func test_체스말은_대각선으로_움직일수없음() {
    // given
    sut = Board()

    // when
    let invalidCase = sut.moveable(
      Piece(
        position: .init(rank: .seven, file: .A),
        type: Pawn(color: .white)
      ),
      to: .init(rank: .six, file: .B)
    )
    
    // then
    XCTAssertFalse(invalidCase)
  }
}
