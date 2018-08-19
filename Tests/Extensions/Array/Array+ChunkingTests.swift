//
//  Array+ChunkingTests.swift
//  SBSwiftUtilsTests
//
//  Created by Steve Barnegren on 11/02/2018.
//  Copyright © 2018 SteveBarnegren. All rights reserved.
//

import XCTest
import SBSwiftUtils

class Array_ChunkingTests: XCTestCase {

    // MARK: - Chunk By Size
    
    func testChunkedWithSizeOnEmptyArrayReturnsEmptyArray() {
        let array = [Int]()
        XCTAssertEqual(array.chunked(size: 10).count, 0)
    }
    
    func testChunkedWithSizeReturnsCorrectChunks() throws {
        
        let array = [1, 2, 3, 4, 5, 6]
        
        let twos = array.chunked(size: 2)
        XCTAssertEqual(twos.count, 3)
        XCTAssertEqual(try twos.at(throwing: 0), [1, 2])
        XCTAssertEqual(try twos.at(throwing: 1), [3, 4])
        XCTAssertEqual(try twos.at(throwing: 2), [5, 6])
        
        let threes = array.chunked(size: 3)
        XCTAssertEqual(threes.count, 2)
        XCTAssertEqual(try threes.at(throwing: 0), [1, 2, 3])
        XCTAssertEqual(try threes.at(throwing: 1), [4, 5, 6])
        
        let fours = array.chunked(size: 4)
        XCTAssertEqual(fours.count, 2)
        XCTAssertEqual(try fours.at(throwing: 0), [1, 2, 3, 4])
        XCTAssertEqual(try fours.at(throwing: 1), [5, 6])
        
        let fives = array.chunked(size: 5)
        XCTAssertEqual(fives.count, 2)
        XCTAssertEqual(try fives.at(throwing: 0), [1, 2, 3, 4, 5])
        XCTAssertEqual(try fives.at(throwing: 1), [6])
        
        let sixes = array.chunked(size: 6)
        XCTAssertEqual(sixes.count, 1)
        XCTAssertEqual(try sixes.at(throwing: 0), [1, 2, 3, 4, 5, 6])
    }
    
    // MARK: - Chunk At Change To
    
    func testChunkedAtChangeToOnEmptyArrayReturnsEmptyArray() {
        
        let array = [Int]()
        XCTAssertTrue(array.chunked(atChangeTo: { $0 }).isEmpty)
    }
    
    func testChunkedAtChangeToChunksAtChange() {
        
        let input = [1, 2, 2, 3, 3, 3]
        let result = input.chunked(atChangeTo: { $0 })
        
        XCTAssertEqual(result.count, 3)
        XCTAssertEqual(try result.at(throwing: 0), [1])
        XCTAssertEqual(try result.at(throwing: 1), [2, 2])
        XCTAssertEqual(try result.at(throwing: 2), [3, 3, 3])
    }
    
    // MARK: - Chunk at
    
    func testChunkedAtEmptyArrayReturnsEmptyArray() {
        
        let array = [Int]()
        XCTAssertTrue(array.chunked(at: { _ in true }).isEmpty)
    }
    
    func testChunkedAtChunksWhenClosureReturnsTrue() {
        
        let array = [1, 2, 1, 2, 3, 1, 2]
        XCTAssertEqual(array.chunked(at: { $0 == 1 }), [[1, 2], [1, 2, 3], [1, 2]])
    }
    
    func testChunkedAtChunksCorrectlyWhenInputDoesntStartWithTrueValue() {
        
        let array = [3, 4, 1, 2, 1, 2, 3, 1, 2]
        XCTAssertEqual(array.chunked(at: { $0 == 1 }), [[3, 4], [1, 2], [1, 2, 3], [1, 2]])
    }
    
    func testChunkedAtChunksRepeatedTrueValues() {
        
        let array = [1, 1, 1]
        XCTAssertEqual(array.chunked(at: { $0 == 1 }), [[1], [1], [1]])
    }
    
    // MARK: - Chunk Ascending / Descending

    func testChunkAscendingChunksAscending() {
        
        let chunks = [4, 5, 1, 2, 5, 5, 3, 2, 5, 4, 4, 3, 5, 3, 4].chunkedAscending()
        
        XCTAssertEqual(chunks.count, 5)
        XCTAssertEqual(try chunks.at(throwing: 0), [1])
        XCTAssertEqual(try chunks.at(throwing: 1), [2, 2])
        XCTAssertEqual(try chunks.at(throwing: 2), [3, 3, 3])
        XCTAssertEqual(try chunks.at(throwing: 3), [4, 4, 4, 4])
        XCTAssertEqual(try chunks.at(throwing: 4), [5, 5, 5, 5, 5])
    }
    
    func testChunkDescendingChunksDescending() {
        
        let chunks = [4, 5, 1, 2, 5, 5, 3, 2, 5, 4, 4, 3, 5, 3, 4].chunkedDescending()
        
        XCTAssertEqual(chunks.count, 5)
        XCTAssertEqual(try chunks.at(throwing: 0), [5, 5, 5, 5, 5])
        XCTAssertEqual(try chunks.at(throwing: 1), [4, 4, 4, 4])
        XCTAssertEqual(try chunks.at(throwing: 2), [3, 3, 3])
        XCTAssertEqual(try chunks.at(throwing: 3), [2, 2])
        XCTAssertEqual(try chunks.at(throwing: 4), [1])
    }
    
    // MARK: - Chunk Ascending / Descending By
    
    func testChunkAscendingByChunksAscending() {
        
        let chunks = [4, 5, 1, 2, 5, 5, 3, 2, 5, 4, 4, 3, 5, 3, 4].chunkedAscendingBy { $0 }
        
        XCTAssertEqual(chunks.count, 5)
        XCTAssertEqual(try chunks.at(throwing: 0), [1])
        XCTAssertEqual(try chunks.at(throwing: 1), [2, 2])
        XCTAssertEqual(try chunks.at(throwing: 2), [3, 3, 3])
        XCTAssertEqual(try chunks.at(throwing: 3), [4, 4, 4, 4])
        XCTAssertEqual(try chunks.at(throwing: 4), [5, 5, 5, 5, 5])
    }
    
    func testChunkDescendingBChunksDescending() {
        
        let chunks = [4, 5, 1, 2, 5, 5, 3, 2, 5, 4, 4, 3, 5, 3, 4].chunkedDescendingBy { $0 }
        
        XCTAssertEqual(chunks.count, 5)
        XCTAssertEqual(try chunks.at(throwing: 0), [5, 5, 5, 5, 5])
        XCTAssertEqual(try chunks.at(throwing: 1), [4, 4, 4, 4])
        XCTAssertEqual(try chunks.at(throwing: 2), [3, 3, 3])
        XCTAssertEqual(try chunks.at(throwing: 3), [2, 2])
        XCTAssertEqual(try chunks.at(throwing: 4), [1])
    }
}
