//
//  ContentView.swift
//  SwiftUITest
//
//  Created by Andrew on 2022/05/22.
//

import SwiftUI


struct ContentModel {
    var values = ["Holly":"Holly shit", "Josh" : "Josh is angry", "Rhonda" : "Rhonda is hungry", "Ted" : "Ted is good"]
    
    func getDescription(about word: String) -> String {
        values[word] ?? ""
    }
    
    func getSearchResults(from text: String) -> [String] {
        values.keys.filter { $0.contains(text) }
    }
}


class ContentViewModel: ObservableObject {
    
    let model: ContentModel!
     var searchText = "" {
        didSet{
            description = model.getDescription(about: searchText)
            searchResults = model.getSearchResults(from: searchText)
        }
    }
    
    init(model: ContentModel = ContentModel()){
        self.model = model
    }
    
    
    @Published var description = ""
    @Published var searchResults:[String] = []
}

struct ContentView: View {
    
    @ObservedObject var viewModel = ContentViewModel()
    @State private var searchText = ""

    var body: some View {
        NavigationView {
            VStack{
                List {
                    ForEach(viewModel.searchResults, id: \.self) { name in
                        NavigationLink(destination: Text(name)) {
                            Text(name)
                        }
                    }
                }
                .searchable(text: $viewModel.searchText) {
                    if viewModel.searchResults.isEmpty && (searchText.isEmpty == false) {
                        Text("Theres no \(searchText)")
                    }
                }
                .navigationTitle("Contacts")
                
                VStack {
                    Text(viewModel.description).frame(width: nil, height: 300, alignment: .leading)
//                    EmptyView
                }
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


