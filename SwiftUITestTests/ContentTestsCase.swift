//
//  ContentTestsCase.swift
//  SwiftUITestTests
//
//  Created by Andrew on 2022/05/22.
//

import XCTest
@testable import SwiftUITest

class ContentTestsCase: XCTestCase {
    
    var model: ContentModel!
    var viewModel: ContentViewModel!
    
    var testWord: String = "Hello"
    var testWordMeaning: String = "Hello means"
    
    override func setUp() {
        self.model = ContentModel(values: [testWord: testWordMeaning])
        self.viewModel = ContentViewModel(model: model)
        
        super.setUp()
    }
    
    func test검색한_결과가_없을때() throws {
        viewModel.searchText = "ABCDE"
        
        XCTAssert(viewModel.searchResults.isEmpty)
    }
    
    func test검색한_결과가_있을때() throws {
        
        viewModel.searchText = "H"
        
        XCTAssert(viewModel.searchResults.count == 1 && viewModel.searchResults[0] == testWord)
    }
    
    func test검색한_단어와_일치하는_단어가_없을때() throws {
        viewModel.searchText = "A"
        
        XCTAssert(viewModel.description.isEmpty)
    }
    
    func test검색한_단어와_일치하는_단어가_있을때() throws {
        viewModel.searchText = testWord
        XCTAssert(viewModel.description == testWordMeaning)
    }
    
}

