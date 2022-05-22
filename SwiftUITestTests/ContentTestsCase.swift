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
        
        XCTAssert(viewModel.searchResults.isEmpty, "검색 결과가 없을떄는 result가 존재하면 안됩니다. ")
    }
    
    func test검색한_결과가_있을때() throws {
        
        viewModel.searchText = "H"
        
        XCTAssert(viewModel.searchResults.count == 1 && viewModel.searchResults[0] == testWord, "검색 결과가 하나만 나와야 하며 Hello가 출력되어야 합니다.")
    }
    
    func test검색한_단어와_일치하는_단어가_없을때() throws {
        viewModel.searchText = "A"
        
        XCTAssert(viewModel.description.isEmpty, "일치하는 단어가 없을 때는 description이 존재하면 안됩니다.")
    }
    
    func test검색한_단어와_일치하는_단어가_있을때() throws {
        viewModel.searchText = testWord
        XCTAssert(viewModel.description == testWordMeaning, "일치하는 단어가 있을 때는 description이 존재해야합니다.")
    }
    
}

