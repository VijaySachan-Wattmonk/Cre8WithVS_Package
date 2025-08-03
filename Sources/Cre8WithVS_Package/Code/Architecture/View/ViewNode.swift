//
//  NodeView.swift
//  Cre8WithVS_Package
//
//  Created by Vijay Sachan on 6/18/25.
//
import SwiftUI
import SPiOSCommonP8

struct ViewNode: View,FWLoggerDelegate{
    var viewModel: ViewModelNode
    @State private var searchText: String = ""
    @State private var filteredViewModels: [ViewModelNode] = []
    @State private var isSearching: Bool = false
    @State private var debounceTimer: Timer?

    
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
                
                if isSearching {
                    Color.black.opacity(0.2)
                        .edgesIgnoringSafeArea(.all)
                    ProgressView("Searching...")
                        .padding()
                        .background(Color(.systemBackground))
                        .cornerRadius(10)
                }
            }
            .navigationTitle(rootNode.title)
            .searchable(text: $searchText, prompt: "Search").disabled(isSearching)
            .onChange(of: searchText) { _ in
                debounceTimer?.invalidate()
                debounceTimer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { _ in
                    Task { @MainActor in
                        performSearch()
                    }
                }
            }
            
            .onAppear {
                performSearch()
            }
        } else {
            Text("Node has no data")
        }
    }
    
    private func performSearch() {
        let trimmed = searchText.trimmingCharacters(in: .whitespacesAndNewlines)
        if trimmed.isEmpty {
            filteredViewModels = viewModel.childViewModel
            isSearching = false
        } else {
            isSearching = true
            let tag = self.tag
            Task.detached(priority: .userInitiated) {
                Global.logThreadType(tag: tag)
                try? await Task.sleep(nanoseconds: 3_000_000_000)
                let results = await viewModel.search(trimmed)
                await MainActor.run {
                    filteredViewModels = results
                    isSearching = false
                    
                }
            }
        }
    }
}
