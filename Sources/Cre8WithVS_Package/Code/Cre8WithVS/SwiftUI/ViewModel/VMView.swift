//
//  VMView.swift
//  Cre8WithVS_Package
//
//  Created by Vijay Sachan on 6/23/25.
//
import SwiftUI
import SPiOSCommonP8
class VMView: ViewModelNode{
    override nonisolated func createRootModelAndChildViewModels() async -> (ModelNode, [ViewModelNode]) {
        Global.logThreadType(tag: tag)
        let node=ModelNode( "View", "SwiftUI elements, showcasing various interactive and display components", "platforms")
        let vmChildNodes:[ViewModelNode] = [
            await VMView(ModelNode("Button", "Triggers actions via tappable components", "All"), { _ in AnyView(ButtonView()) }),
            await VMView(ModelNode("Image", "Displays and styles images in SwiftUI", "All"), { _ in AnyView(ImageViewDemo()) }),
            await VMView(ModelNode("Picker", "Presents a list of selectable options", "All"), { _ in AnyView(PickerViewDemo()) }),
            await VMView(ModelNode("Slider", "Selects a value from a range using a sliding control", "All"), { _ in AnyView(SliderViewDemo()) }),
            await VMView(ModelNode("Text", "Displays styled and formatted text content", "All"), { _ in AnyView(TextViewDemo()) }),
            await VMView(ModelNode("TextField", "Captures user input via editable text fields", "All"), { _ in AnyView(TextFieldViewDemo()) }),
            await VMView(ModelNode("Toggle", "Represents on/off state using a switch control", "All"), { _ in AnyView(ToggleViewDemo()) })
        ]
        return (node,vmChildNodes)
    }
}
