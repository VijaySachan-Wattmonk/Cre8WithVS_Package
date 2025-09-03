import SwiftUI
import SPiOSCommonP8

struct SidebarView: View {
    let items: [String]
    @Binding var selection: String?
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("This is SideBar View")
            List(items, id: \.self, selection: $selection) { item in
                Label(item, systemImage: "folder")
            }
            .listStyle(.insetGrouped)
        }
        .padding([.horizontal, .top])
    }
}
struct ContentView: View {
    let items: [String]
    @Binding var selection: String?
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("This is Content View")
            List(items, id: \.self, selection: $selection) { item in
                Label(item, systemImage: "doc.text")
            }
            .listStyle(.insetGrouped)
        }
        .padding([.horizontal, .top])
    }
}

struct DetailView: View{
    let selectedItem: String?
    var body: some View{
        VStack(alignment: .leading, spacing: 12){
            Text("This is Detail View")
            Group {
                if let item = selectedItem {
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


enum SplitLayout: String, CaseIterable, Identifiable {
    case two = "2 Columns"
    case three = "3 Columns"
    var id: Self { self }
}

enum VisibilityOption: String, CaseIterable, Identifiable, Hashable {
    case automatic = "automatic : Use the default leading column visibility for the current device."
    case all = "all : Show all the columns of a three-column navigation split view."
    case doubleColumn = "doubleColumn : Show the content column and detail area of a three-column navigation split view, or the sidebar column and detail area of a two-column navigation split view."
    case detailOnly = "detailOnly : Hide the leading two columns of a three-column navigation split view, so that just the detail area shows."
    var id: Self { self }
    
    var shortTitle: String {
        switch self {
        case .automatic:    return "automatic"
        case .all:          return "all"
        case .doubleColumn: return "doubleColumn"
        case .detailOnly:   return "detailOnly"
        }
    }

    var toSplitVisibility: NavigationSplitViewVisibility {
        switch self {
        case .automatic:   return .automatic
        case .all:         return .all
        case .doubleColumn:      return .doubleColumn
        case .detailOnly:  return .detailOnly
        }
    }

    static func from(_ v: NavigationSplitViewVisibility) -> VisibilityOption {
        switch v {
        case .automatic:      return .automatic
        case .all:            return .all
        case .doubleColumn:   return .doubleColumn
        case .detailOnly:     return .detailOnly
        default:              return .automatic
        }
    }
}

enum ColumnOption: String, CaseIterable, Identifiable, Hashable {
    case sidebar = "Sidebar"
    case content = "Content"
    case detail  = "Detail"
    var id: Self { self }

    var toSplitColumn: NavigationSplitViewColumn {
        switch self {
        case .sidebar: return .sidebar
        case .content: return .content
        case .detail:  return .detail
        }
    }

    static func from(_ v: NavigationSplitViewColumn) -> ColumnOption {
        switch v {
        case .sidebar: return .sidebar
        case .content: return .content
        case .detail:  return .detail
        default:       return .sidebar
        }
    }
}

enum SplitStyleOption: String, CaseIterable, Identifiable, Hashable {
    case automatic = "automatic"
    case balanced = "balanced"
    case prominentDetail = "prominentDetail"
    var id: Self { self }
}

extension View {
    @ViewBuilder
    func applySplitStyle(_ option: SplitStyleOption) -> some View {
        switch option {
        case .automatic:
            self.navigationSplitViewStyle(.automatic)
        case .balanced:
            self.navigationSplitViewStyle(.balanced)
        case .prominentDetail:
            self.navigationSplitViewStyle(.prominentDetail)
        }
    }
}

struct NavigationSplitViewDemo: View{
    @Environment(\.dismiss) var dismiss
    @State private var layout: SplitLayout = .two // Default 3 columns
    @State private var sidebarSelection: String? = "Inbox"
    @State private var contentSelection: String? = "Item 1"
    
    private let listSidebar = ["Side bar item 1", "Side bar item 2", "Side bar item 3", "Side bar item 4"]
    private let listContent = (1...20).map { "Content Item \($0)" }
    /// A version token to force a rebuild of the split view subtree when layout changes.
    @State private var layoutVersion = UUID()
    // Controls the two-column split's visibility (automatic, all, doubleColumn, detailOnly)
    @State private var columnVisibility: NavigationSplitViewVisibility = .all
    @State private var visibilityOption: VisibilityOption = .all
    @State private var preferredColumn: NavigationSplitViewColumn = .sidebar
    @State private var preferredOption: ColumnOption = .sidebar
    @State private var splitStyle: SplitStyleOption = .automatic
    @State var present: Bool = false
    var body: some View {
       ZStack{
            
       }.onAppear{
           // Present the split view modally to avoid nested navigation containers.
           present=true
       }.fullScreenCover(isPresented:$present) { // Use a modal presentation to keep `NavigationSplitView` at the top level
           VStack(spacing: 0){
               HStack(spacing:10){
                   Button(action: {
                       dismiss()
                   }) {
                       HStack{
                           Image(systemName: "chevron.backward")
                               .font(.system(size: 18, weight: .semibold))
//                           Text("Back")
                       }.foregroundColor(.blue)
                   }
                   .buttonStyle(.plain)
                   .accessibilityLabel("Back")
                   Spacer()
                   Text("NavigationSplitView")
                   Spacer()
                   ViewInfoIconButton(title: "kfnsd",message: infoText,onClose: {
                       
                   })
               }
                // MARK: Control Bar — choose layout, visibility, and preferred compact column
               VStack(alignment: .leading, spacing: 12) {
                    // Row 1: SplitLayout (2 or 3 columns)
                    HStack(spacing: 12) {
                        Picker("Layout", selection: $layout) {
                            ForEach(SplitLayout.allCases) { option in
                                Text(option.rawValue).tag(option)
                            }
                        }
                        .pickerStyle(.segmented)
                    }

                    // Row 2: Column Visibility (automatic/all/double/detail)
                    VStack(spacing: 12) {
                        HStack{
                            Text(NavigationSplitViewVisibilityTuple.title).font(.subheadline).foregroundStyle(.secondary)
                            ViewInfoIconButton(title: NavigationSplitViewVisibilityTuple.title, message: NavigationSplitViewVisibilityTuple.desc, onClose: {})
                            Picker("Visibility", selection: $visibilityOption) {
                                ForEach(VisibilityOption.allCases) { opt in
                                    Text(opt.shortTitle).tag(opt)
                                }
                            }
                            .pickerStyle(.menu)
                        }
                        
                    }

                    // Row 3: Preferred Compact Column (sidebar/content/detail)
                    VStack(spacing: 12) {
                        HStack{
                            Text(NavigationSplitViewColumnTuple.title).font(.subheadline).foregroundStyle(.secondary)
                            ViewInfoIconButton(title: NavigationSplitViewColumnTuple.title, message: NavigationSplitViewColumnTuple.desc, onClose: {})
                            Picker("Preferred", selection: $preferredOption) {
                                ForEach(ColumnOption.allCases) { opt in
                                    Text(opt.rawValue).tag(opt)
                                }
                            }
                            .pickerStyle(.menu)
                        }
                    }
                    // Row 4: Navigation Split View Style (automatic/balanced/prominentDetail)
                    VStack(spacing: 12) {
                        HStack {
                            Text("navigationSplitViewStyle:")
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                            ViewInfoIconButton(title: NavigationSplitViewStyleTuple.title, message: NavigationSplitViewStyleTuple.desc, onClose: {})
                            Picker("Style", selection: $splitStyle) {
                                ForEach(SplitStyleOption.allCases) { opt in
                                    Text(opt.rawValue).tag(opt)
                                }
                            }
                            .pickerStyle(.menu)
                        }
                    }
                }
                .padding(.horizontal)
                .padding(.bottom, 8)
               
               // MARK: Split view – rebuilt when `layoutVersion` changes
               Group {
                   if layout == .three {
                       // 3-column NavigationSplitView using preferredCompactColumn
                       NavigationSplitView(columnVisibility: $columnVisibility, preferredCompactColumn: $preferredColumn) {
                           SidebarView(items: listSidebar, selection: $sidebarSelection)
                       } content: {
                           ContentView(items: listContent, selection: $contentSelection)
                       } detail: {
                           DetailView(selectedItem: contentSelection)
                       }
                   } else {
                       // 2-column NavigationSplitView using explicit columnVisibility
                       NavigationSplitView(columnVisibility: $columnVisibility, preferredCompactColumn: $preferredColumn) {
                           SidebarView(items: listSidebar, selection: $sidebarSelection)
                       } detail: {
                           DetailView(selectedItem: sidebarSelection)
                       }
                   }
               }
               .applySplitStyle(splitStyle)
               
           }
           .padding(.horizontal)
           .padding(.bottom)
               .onChange(of: layout) { oldValue, newValue in
                   // When the number of columns changes, force a fresh identity so the
                   // split view reconstructs cleanly.
                   print("Layout changed from \(oldValue) to \(newValue)")
                   layoutVersion = UUID()
           }
           .onChange(of: visibilityOption) { _, newValue in
               columnVisibility = newValue.toSplitVisibility
           }
           .onChange(of: preferredOption) { _, newValue in
               preferredColumn = newValue.toSplitColumn
           }
           .onAppear{
               // Keep pickers in sync with initial values
               visibilityOption = VisibilityOption.from(columnVisibility)
               preferredOption = ColumnOption.from(preferredColumn)
           }
//           .id(layoutVersion)
       }
    }
}

#Preview {
    // Keep the split view top-level to mirror the fullScreenCover behavior.
    NavigationSplitViewDemo()
}

let NavigationSplitViewColumnTuple=(title:"NavigationSplitViewColumn",desc:"A NavigationSplitView collapses into a single stack in some contexts, like on iPhone or Apple Watch. Use this type with the preferredCompactColumn parameter to control which column of the navigation split view appears on top of the collapsed stack.")
let NavigationSplitViewVisibilityTuple=(title:"NavigationSplitViewVisibility",desc:"""
The visibility of the leading columns in a navigation split view.

1. automatic : Use the default leading column visibility for the current device.

2. all : Show all the columns of a three-column navigation split view.

3. doubleColumn : Show the content column and detail area of a three-column navigation split view, or the sidebar column and detail area of a two-column navigation split view.

4. detailOnly : Hide the leading two columns of a three-column navigation split view, so that just the detail area shows.

Note : Some platforms don’t respect every option. For example, macOS always displays the content column.



""")

let NavigationSplitViewStyleTuple = (title: "navigationSplitViewStyle(_:)", desc: """
Controls visual emphasis and column prominence.

1. automatic : It resolves its appearance automatically based on the current context.

2. balanced : It reduces the size of the detail content to make room when showing the leading column or columns.

3. prominentDetail : It attempts to maintain the size of the detail content when hiding or showing the leading columns.
""")

private let infoText="""
1. Embedding "NavigationSplitView" in "NavigationStack" doesnot work properly.So 
presenting this demo using method "fullScreenCover(isPresented:onDismiss:content:)"

 
"""
