import SwiftUI

enum SplitLayout: String, CaseIterable, Identifiable {
    case two = "2 Columns"
    case three = "3 Columns"
    var id: Self { self }
}
struct NavigationSplitViewDemo: View{
    @State private var layout: SplitLayout = .three // Default 3 columns
    @State private var sidebarSelection: String? = "Inbox"
    @State private var contentSelection: String? = "Item 1"
    private let listSidebar = ["Side bar item 1", "Side bar item 2", "Side bar item 3", "Side bar item 4"]
    private let listContent = (1...20).map { "Content Item \($0)" }
    var body: some View {
        VStack(spacing: 0) {
            // Picker to switch between 2-column and 3-column layouts
            Picker("Layout", selection: $layout) {
                ForEach(Array(SplitLayout.allCases.enumerated()), id: \.element) { index, option in
                    Text("\(option.rawValue)").tag(option)
                }
            }
            .pickerStyle(.segmented)
            .padding()
            Group {
                if layout == .three {
                    // 3-column NavigationSplitView (sidebar, content, detail)
                    NavigationSplitView {
                        VStack(alignment: .leading, spacing: 12) {
                            List(listSidebar, id: \.self, selection: $sidebarSelection) { folder in
                                Label(folder, systemImage: "folder")
                            }
                            .listStyle(.insetGrouped)
                        }
                        .padding([.horizontal, .top])
                    } content: {
                        VStack(alignment: .leading, spacing: 12) {
                            
                            List(listContent, id: \.self, selection: $contentSelection) { item in
                                Label(item, systemImage: "doc.text")
                            }
                            .listStyle(.insetGrouped)
                        }
                        .padding([.horizontal, .top])
                    } detail: {
                        VStack(alignment: .leading, spacing: 12) {
                            
                            Group {
                                if let item = contentSelection {
                                    Text("Detail for \(item)")
                                        .font(.title3)
                                        .padding(.top, 8)
                                } else {
                                    Text("Select an item")
                                        .foregroundStyle(.secondary)
                                        .padding(.top, 8)
                                }
                            }
                            Spacer()
                        }
                        .padding([.horizontal, .top])
                    }
                } else {
                    // 2-column NavigationSplitView (sidebar, detail)
                    NavigationSplitView {
                        VStack(alignment: .leading, spacing: 12) {
                            List(listSidebar, id: \.self, selection: $sidebarSelection) { folder in
                                Label(folder, systemImage: "folder")
                            }
                            .listStyle(.insetGrouped)
                        }
                        .padding([.horizontal, .top])
                    } detail: {
                        VStack(alignment: .leading, spacing: 12) {

                            Group {
                                if let item = sidebarSelection {
                                    Text("Detail for \(item)")
                                        .font(.title3)
                                        .padding(.top, 8)
                                } else {
                                    Text("Select an item")
                                        .foregroundStyle(.secondary)
                                        .padding(.top, 8)
                                }
                            }
                            Spacer()
                        }
                        .padding([.horizontal, .top])
                    }
                }
            }
        }
    }
}
#Preview {
    NavigationSplitViewDemo()
}
