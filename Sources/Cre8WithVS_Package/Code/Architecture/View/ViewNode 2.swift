//
//  NodeView.swift
//  Cre8WithVS_Package
//
//  Created by Vijay Sachan on 6/18/25.
//
import SwiftUI


struct ViewNode123: View {
    var viewModel: ViewModelNode
    @State private var searchText: String = ""
    @State private var filteredViewModels: [ViewModelNode] = []
    
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
            .onChange(of: searchText) { _ in
                performSearch()
            }
            .onAppear {
                performSearch()
            }
        } else {
            Text("Node has no data")
        }
    }

    private func performSearch() {
//        let trimmed = searchText.trimmingCharacters(in: .whitespacesAndNewlines)
//        if trimmed.isEmpty {
//            filteredViewModels = viewModel.childViewModel
//        } else {
//            Task.detached(priority: .userInitiated) {
//                let results = await viewModel.search(trimmed)
//                await MainActor.run {
//                    filteredViewModels = results
//                }
//            }
//        }
    }
}
