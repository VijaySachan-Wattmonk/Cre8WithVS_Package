//
//  VMView.swift
//  Cre8WithVS_Package
//
//  Created by Vijay Sachan on 6/23/25.
//
import SwiftUI
class VMView: ViewModelNode{
    override nonisolated func createRootModelAndChildViewModels() async -> (ModelNode, [ViewModelNode]) {
        logCurrentThread()
        let node=ModelNode( "View", "SwiftUI subtitle", "platforms")
        let vmChildNodes:[ViewModelNode] = [
            await VMView(ModelNode("Image", "Displays and styles images in SwiftUI", "All"), { _ in AnyView(ImageViewDemo()) }),
            await VMView(ModelNode("TextField", "Captures user input via editable text fields", "All"), { _ in AnyView(TextFieldViewDemo()) }),
            await VMView(ModelNode("Slider", "Selects a value from a range using a sliding control", "All"), { _ in AnyView(SliderViewDemo()) }),
            await VMView(ModelNode("Picker", "Presents a list of selectable options", "All"), { _ in AnyView(PickerViewDemo()) }),
            await VMView(ModelNode("Button", "Triggers actions via tappable components", "All"), { _ in AnyView(ButtonView()) }),
            await VMView(ModelNode("Toggle", "Represents on/off state using a switch control", "All"), { _ in AnyView(ToggleViewDemo()) }),
            await VMView(ModelNode("Text", "Displays styled and formatted text content", "All"), { _ in AnyView(TextViewDemo()) })
        ]
        return (node,vmChildNodes)
    }
    
}
