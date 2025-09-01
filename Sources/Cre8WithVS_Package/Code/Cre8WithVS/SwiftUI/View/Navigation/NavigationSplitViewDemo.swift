import SwiftUI

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

///
/// # NavigationSplitViewDemo
/// A guided demo showcasing 2- and 3-column `NavigationSplitView` with a segmented picker.
///
/// ## Why `fullScreenCover` instead of embedding in `NavigationStack`?
/// - `NavigationSplitView` is itself a navigation container. Wrapping it in another
///   top-level `NavigationStack` often causes confusing behavior (especially in compact
///   width on iPhone) such as duplicated bars, broken back behavior, or incorrect
///   column collapsing.
/// - Presenting the split view **modally** via `fullScreenCover` avoids a nested container
///   and ensures the split view owns the navigation experience.
///
/// ## Compact vs Regular
/// - **Regular width** (iPad / Mac): you see 2 or 3 columns side by side.
/// - **Compact width** (iPhone): the split view **collapses** into a single-column stack.
///
/// ## How to use
/// - Use the segmented picker to switch between **2 columns** and **3 columns**.
/// - The demo fully rebuilds the split subtree when layout changes (see `.id(layoutVersion)`).
///
/// ## Notes
/// - If you *must* embed `NavigationSplitView` in a parent container, do it only inside
///   a detail area (or a dedicated screen) and avoid wrapping the entire app in multiple
///   navigation containers.
///
struct NavigationSplitViewDemo: View{
    @State private var layout: SplitLayout = .three // Default 3 columns
    @State private var sidebarSelection: String? = "Inbox"
    @State private var contentSelection: String? = "Item 1"
    private let listSidebar = ["Side bar item 1", "Side bar item 2", "Side bar item 3", "Side bar item 4"]
    private let listContent = (1...20).map { "Content Item \($0)" }
    /// A version token to force a rebuild of the split view subtree when layout changes.
    @State private var layoutVersion = UUID()
    @State var present: Bool = false
    var body: some View {
       ZStack{
            
       }.onAppear{
           // Present the split view modally to avoid nested navigation containers.
           present=true
       }.fullScreenCover(isPresented:$present) { // Use a modal presentation to keep `NavigationSplitView` at the top level
           VStack(spacing: 0) {
               // MARK: Layout controls – choose between 2 or 3 columns
               Picker("Layout", selection: $layout) {
                   ForEach(Array(SplitLayout.allCases.enumerated()), id: \.element) { index, option in
                       Text("\(option.rawValue)").tag(option)
                   }
               }
               .pickerStyle(.segmented)
               .padding()
               // MARK: Split view – rebuilt when `layoutVersion` changes
               Group {
                   if layout == .three {
                       // 3-column NavigationSplitView using preferredCompactColumn
                       NavigationSplitView{
                           SidebarView(items: listSidebar, selection: $sidebarSelection)
                       } content: {
                           ContentView(items: listContent, selection: $contentSelection)
                       } detail: {
                           DetailView(selectedItem: contentSelection)
                       }
                   } else {
                       // 2-column NavigationSplitView using preferredCompactColumn
                       NavigationSplitView{
                           SidebarView(items: listSidebar, selection: $sidebarSelection)
                       } detail: {
                           DetailView(selectedItem: sidebarSelection)
                       }
                   }
               }
               
           }
               .onChange(of: layout) { oldValue, newValue in
                   // When the number of columns changes, force a fresh identity so the
                   // split view reconstructs cleanly.
                   print("Layout changed from \(oldValue) to \(newValue)")
                   layoutVersion = UUID()
           }
//           .id(layoutVersion)
       }
    }
}
#Preview {
    // Keep the split view top-level to mirror the fullScreenCover behavior.
    NavigationSplitViewDemo()
}
