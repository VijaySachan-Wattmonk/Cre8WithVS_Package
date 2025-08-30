//
//  NodeView.swift
//  Cre8WithVS_Package
//
//  Created by Vijay Sachan on 6/18/25.
//

import SwiftUI
import SPiOSCommonP8

struct ViewNode: View, FWLoggerDelegate {
    @State private var isSearchBarVisible: Bool = true
    @ObservedObject var viewModel: ViewModelNode

    var body: some View {
        if let rootNode = viewModel.rootNode {
            ZStack {
                let vmChildren = viewModel.filteredViewModels
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
                    if let view = viewModel.buildView() {
                        view.onAppear(){
                            isSearchBarVisible = false
                        }
                    } else {
                        Text("No search results")
                    }
                }

                if viewModel.isSearching {
                    Color.black.opacity(0.2)
                        .edgesIgnoringSafeArea(.all)
                    ProgressView("Searching...")
                        .padding()
                        .background(Color(.systemBackground))
                        .cornerRadius(10)
                }
            }
            .navigationTitle(rootNode.title)
            .ext_If(isSearchBarVisible) { view in
                view.searchable(text: $viewModel.searchText, prompt: "Search")
            }
        } else {
            Text("Node has no data")
        }
    }
}
