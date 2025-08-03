//
//  HomeViewModel.swift
//  Cre8WithVS_Package
//
//  Created by Vijay Sachan on 15/06/25.
//
import SwiftUI
@MainActor
final class HomeViewModel: AppViewCode {
    @Published var searchText = ""
    private(set) var allItems: [ListModel] = []
    init(){
        super.init(printTag: "")
        allItems.append(ListModel(title: "Button",
                      subTitle: "A tappable button element.",
                      category: .views,
                                  contentView: AnyView(ButtonView())))
        allItems.append(ListModel(title: "Material",
                      subTitle: "Blurred, semi-transparent material effect used to create frosted glass-like backgrounds.",
                      category: .views,
                                  contentView: AnyView(BlurBackgroundView())))
        allItems.append(ListModel(title: "Shape",
                      subTitle: "A 2D shape that you can use when drawing a view.",
                      category: .views,
                                  contentView: AnyView(ShapesDemoView())))
        allItems.append(ListModel(title: "Text",
                                  subTitle: "Displays a line or block of read-only text.", category: .views,
                                  contentView: AnyView(TextViewDemo())))
        allItems.append(ListModel(title: "Image",
                                  subTitle: "Displays images from assets or SF Symbols.",category: .views,
                                  contentView: AnyView(ImageViewDemo())))
        allItems.append(ListModel(title: "TextField",
                                  subTitle: "Allows user text input.",category: .views,
                                  contentView: AnyView(TextFieldViewDemo())))
        allItems.append(ListModel(title: "Toggle",
                                  subTitle: "Switches between on and off states.",category: .views,
                                  contentView: AnyView(ToggleViewDemo())))
        allItems.append(ListModel(title: "Slider",
                                  subTitle: "Selects a value from a range.",category: .views,
                                  contentView: AnyView(SliderViewDemo())))
        allItems.append(ListModel(title: "Picker",
                                  subTitle: "Allows choosing from a list of options.",category: .views,
                                  contentView: AnyView(PickerViewDemo())))
        
        allItems.append(ListModel(title: "NavigationLink",
                                  subTitle: "Navigates to another screen.",category: .views,
                                  contentView: AnyView(NavigationLinkDemo())))
        
        allItems.append(ListModel(title: "TabView",
                      subTitle: "A view that switches between multiple child views using interactive user interface elements.",
                      category: .layouts,
                                  contentView: AnyView(TabViewSwiftUI())))
        allItems.append(ListModel(title: "List",
                                  subTitle: "Displays rows of data in a scrolling view.",category: .layouts,
                                  contentView: AnyView(ListViewDemo())))
        allItems.append(ListModel(title: "VStack",
                                  subTitle: "Arranges child views in a vertical line.",category: .layouts,
                                  contentView: AnyView(( VStackDemo() ))))
        allItems.append(ListModel(title: "HStack",
                                  subTitle: "Arranges child views in a horizontal line.",category: .layouts,
                                  contentView: AnyView((HStackDemo()))))
        allItems.append(ListModel(title: "ZStack",
                                  subTitle: "Overlays child views on top of each other.",category: .layouts,
                                  contentView: AnyView(( ZStackDemo() ))))
        allItems.append(ListModel(title: "ScrollView",
                                  subTitle: "Makes content scrollable in horizontal/vertical.",category: .layouts,
                                  contentView: AnyView(( ScrollViewDemo() ))))
        
//        allItems.append(ListData(title:"Button",contentView: AnyView(ButtonView())))
//        allItems.append(ListData(title:"Blur Background",contentView: AnyView(BlurBackgroundView())))
//        allItems.append(ListData(title:"BackgroundStyle",contentView: AnyView(BackgroundStyleView())))
//        allItems.append(ListData(title:"TabView\nA view that switches between multiple child views using interactive user interface elements.",contentView: AnyView(TabViewSwiftUI())))
    }
    var filteredItems: [ListModel] {
        if searchText.isEmpty {
            return allItems
        } else {
            return allItems.filter {
                $0.title.localizedCaseInsensitiveContains(searchText)
                || $0.subTitle.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
}
enum ListCategory: String, CaseIterable, Identifiable {
    case views = "View (Control / Content View)"
    case layouts = "Layout / Container View"
    var id: String { rawValue }
}
