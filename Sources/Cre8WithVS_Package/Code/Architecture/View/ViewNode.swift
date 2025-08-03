//
//  NodeView.swift
//  Cre8WithVS_Package
//
//  Created by Vijay Sachan on 6/18/25.
//
import SwiftUI
import SwiftUI

struct ViewNode: View {
    var viewModel: ViewModelNode
    @State private var searchText: String = ""
    
    var body: some View {
        if let rootNode = viewModel.rootNode {
            ZStack {
                let vmChildren = filteredViewModels
                if !vmChildren.isEmpty {
                    List {
                        ForEach(Array(vmChildren.enumerated()), id: \.offset) { index, vm in
                            if let item = vm.rootNode {
                                NavigationLink(destination: ViewNode(viewModel: vm)) {
                                    VStack(alignment: .leading, spacing: 4) {
                                        Text("\(item.title)").pkg_FontTitle()
                                        Text("\(item.subtitle)").pkg_FontSubTitle().foregroundColor(.gray)
                                    }
                                }
                            } else {
                                Text("rootNode is nil for index \(index)")
                            }
                        }
                    }
                    .listStyle(PlainListStyle())
                } else {
                    if let view=viewModel.buildView(){
                        view
                    }else{
                        Text("No search results")
                    }
                }
            }
            .navigationTitle(rootNode.title)
            .searchable(text: $searchText, prompt: "Search")
        } else {
            Text("Node has no data")
        }
    }

    var filteredViewModels: [ViewModelNode] {
        if searchText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            return viewModel.childViewModel
        } else{
            return viewModel.search(searchText)
        }
    }
}

