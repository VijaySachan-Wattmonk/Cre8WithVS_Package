//
//  ViewModelArchitecture.swift
//  Cre8WithVS_Package
//
//  Created by Vijay Sachan on 6/20/25.
//
import SwiftUI
@MainActor
class ViewModelNode: ObservableObject{
    @Published var rootNode: ModelNode?
    @Published var childViewModel:[ViewModelNode] = []
    private var viewBuilder: ((ModelNode) -> AnyView)!
    public init(){
        print(String(describing: type(of: self)))
    }
    public init(_ rootNode:ModelNode,_ viewBuilder: @escaping (ModelNode) -> AnyView){
        //        print(String(describing: type(of: self)))
        self.rootNode = rootNode
        self.viewBuilder = viewBuilder
    }
    /// Asynchronously loads the root node using a background thread
    func loadDataAsync() async {
        let node = await Task.detached(priority: .userInitiated) {
            return  await self.setUp()
        }.value
        self.rootNode = node
    }
    /// Synchronously loads the root node
    func loadDataSync() async {
        let node =  await setUp()
        self.rootNode = node
    }
    /// Creates the root node using provided parent and children
    nonisolated private func setUp()async -> ModelNode{
        let tuple = await self.createRootModelAndChildViewModels()
        let arrVM=tuple.1
        for viewModel in arrVM{
            if await viewModel.rootNode == nil{
                await viewModel.loadDataSync()
            }
        }
        await MainActor.run{childViewModel.append(contentsOf:arrVM)}
        return tuple.0
    }
    nonisolated func createRootModelAndChildViewModels() async -> (ModelNode,[ViewModelNode]){
        fatalError("Subclasses must override createChildViewModelNodes()")
    }
    func buildView() -> AnyView?{
        if let viewBuilder{
            return viewBuilder(rootNode!)
        }
        return nil
    }
    
}
extension ViewModelNode {
    func search(_ searchText: String) -> [ViewModelNode] {
        var results: [ViewModelNode] = []

        if let node = rootNode, node.matches(searchText: searchText) {
            results.append(self)
        }

        for child in childViewModel {
            results.append(contentsOf: child.search(searchText))
        }

        return results
    }
}
