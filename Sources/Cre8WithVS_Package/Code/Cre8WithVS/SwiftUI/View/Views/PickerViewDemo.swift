//
//  PickerViewDemo.swift
//  Cre8WithVS_Package
//
//  Created by Vijay Sachan on 15/06/25.
//
import SwiftUI
struct PickerViewDemo: View {
    @State private var selection = "Option 1"
   
    let options = ["Option 1", "Option 2", "Option 3"]
    
    var body: some View{
        NavigationView{
            List{
                // 1. Automatic
                Section(header: Text("automatic")){
                    Picker("Choose", selection: $selection) {
                        ForEach(options, id: \.self) { Text($0) }
                    }
                    .pickerStyle(.automatic)
                }
                
                // 2. Inline
                Section(header: Text("inline")) {
                    Picker("Choose", selection: $selection) {
                        ForEach(options, id: \.self) { Text($0) }
                    }
                    .pickerStyle(.inline)
                }
                
                // 3. Menu
                Section(header: Text("menu")) {
                    Picker("Choose", selection: $selection) {
                        ForEach(options, id: \.self) { Text($0) }
                    }
                    .pickerStyle(.menu)
                }
                
                // 4. Navigation Link (iOS 16+)
                Section(header: Text("navigationLink")) {
                    Picker("Choose", selection: $selection) {
                        ForEach(options, id: \.self) { Text($0) }
                    }
                    .pickerStyle(.navigationLink)
                }
                
                // 5. Palette (iOS 17+)
                if #available(iOS 17.0, *) {
                    Section(header: Text("palette")) {
                        Picker("Choose", selection: $selection) {
                            ForEach(options, id: \.self) { Text($0) }
                        }
                        .pickerStyle(.palette)
                        
                    }
                }
                
                //                    // 6. Radio Group (iOS 17+)
                //                    Section(header: Text("radioGroup")) {
                //                        Picker("Choose", selection: $selection) {
                //                            ForEach(options, id: \.self) { Text($0) }
                //                        }
                //                        .pickerStyle(.radioGroup)
                //                    }
                
                // 7. Segmented
                Section(header: Text("segmented")) {
                    Picker("Choose", selection: $selection) {
                        ForEach(options, id: \.self) { Text($0) }
                    }
                    .pickerStyle(.segmented)
                }
                
                // 8. Wheel
                Section(header: Text("wheel")) {
                    Picker("Choose", selection: $selection) {
                        ForEach(options, id: \.self) { Text($0) }
                    }
                    .pickerStyle(.wheel)
                }
                
                // Display current selection
                Section(header: Text("Current Selection")) {
                    Text("You selected: \(selection)")
                        .bold()
                }
            }
            
        }
    }
}
#Preview{
    NavigationView{
        PickerViewDemo()
    }
}


