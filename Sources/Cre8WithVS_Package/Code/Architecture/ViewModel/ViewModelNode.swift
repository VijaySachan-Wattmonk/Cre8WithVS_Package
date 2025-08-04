import SwiftUI
import Combine
import SPiOSCommonP8

@MainActor
class ViewModelNode: ObservableObject, FWLoggerDelegate {
    @Published var rootNode: ModelNode?
    @Published var childViewModel: [ViewModelNode] = []

    // MARK: - Search State
    @Published var searchText: String = ""
    @Published var filteredViewModels: [ViewModelNode] = []
    @Published var isSearching: Bool = false

    private var viewBuilder: ((ModelNode) -> AnyView)!
    private var cancellables = Set<AnyCancellable>()
    private var searchTask: Task<[ViewModelNode], Error>!

    // MARK: - Init
    public init() {
        
        setupSearchDebounce()
    }

    public init(_ rootNode: ModelNode, _ viewBuilder: @escaping (ModelNode) -> AnyView) {
        self.rootNode = rootNode
        self.viewBuilder = viewBuilder
        setupSearchDebounce()
    }

    // MARK: - Async Load
    func loadDataAsync() async {
        let node = await Task.detached(priority: .userInitiated) {
            return await self.setUp()
        }.value
        self.rootNode = node
    }

    func loadDataSync() async {
        let node = await setUp()
        self.rootNode = node
    }

    // MARK: - Setup
    nonisolated private func setUp() async -> ModelNode {
        let tuple = await self.createRootModelAndChildViewModels()
        let arrVM = tuple.1
        for viewModel in arrVM {
            if await viewModel.rootNode == nil {
                await viewModel.loadDataSync()
            }
        }
        await MainActor.run { childViewModel.append(contentsOf: arrVM) }
        return tuple.0
    }

    nonisolated func createRootModelAndChildViewModels() async -> (ModelNode, [ViewModelNode]) {
        fatalError("Subclasses must override createChildViewModelNodes()")
    }

    func buildView() -> AnyView? {
        if let viewBuilder {
            return viewBuilder(rootNode!)
        }
        return nil
    }

    // MARK: - Search (Debounced)
    private func setupSearchDebounce() {
        $searchText
            .debounce(for: .milliseconds(500), scheduler: DispatchQueue.main)
            .removeDuplicates()
            .sink { [weak self] text in
                self?.searchTask?.cancel()
                Task {
                    do {
                        try await self?.performSearch(trimmed: text)
                    } catch is CancellationError {
                        self?.mLog(msg: "🔴 Search task was cancelled before completion")
                    } catch {
                        self?.mLog(msg: "❗️Unexpected error during search: \(error)")
                    }
                }
            }
            .store(in: &cancellables)
    }

    private func performSearch(trimmed text: String) async throws {
        let trimmed = text.trimmingCharacters(in: .whitespacesAndNewlines)
        if trimmed.isEmpty {
            filteredViewModels = self.childViewModel
            isSearching = false
        } else {
            isSearching = true
            let results = try await performSearchAsync(trimmed)
            filteredViewModels = results
            isSearching = false
        }
    }

    func performSearchAsync(_ searchText: String) async throws -> [ViewModelNode] {
        

        let tag = self.tag
        let task = Task.detached(priority: .userInitiated) { [weak self] () -> [ViewModelNode] in
            guard let self = self else { return [] }
//            Global.logThreadType(tag: tag)
            try? await Task.sleep(nanoseconds: 3_000_000_000)
            return try await self.search(searchText)
        }

        searchTask = task
        return try await task.value
    }

    func search(_ searchText: String) async throws-> [ViewModelNode] {
        var results: [ViewModelNode] = []

        try Task.checkCancellation()

        if let node = rootNode, node.matches(searchText: searchText) {
            results.append(self)
        }

        for child in childViewModel {
            
            let childResults = try await child.search(searchText)
            results.append(contentsOf: childResults)
        }

        return results
    }
}
