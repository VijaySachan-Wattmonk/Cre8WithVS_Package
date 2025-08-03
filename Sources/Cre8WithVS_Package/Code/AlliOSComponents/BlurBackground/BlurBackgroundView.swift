//
//  BlurBackgroundView.swift
//  iOS
//
//  Created by Vijay Sachan on 20/09/23.
//

import SwiftUI

@available(iOS 16.0, *)
struct BlurBackgroundView: View {
    enum AvailableMaterial: String,CaseIterable,Identifiable {
        case  bar,regular,thin,ultraThin,thick,ultraThick,noMaterial

        
        
        var id: Self { self }
    }
    @State private var selectedMaterial: AvailableMaterial = .regular
    var body: some View {
        ZStack{
            Rectangle().fill(LinearGradient(colors: [.yellow,.green], startPoint: .top, endPoint: .bottom))
            Image(systemName: "square.and.arrow.down.on.square").resizable().scaledToFit()
            ZStack{
                if selectedMaterial != .noMaterial{
                    Rectangle() // Any shape can be used like Circle,Capsule
                        .fill(getMaterial(selectedMaterial))
                }
                Picker("Material", selection: $selectedMaterial) {
                    ForEach(AvailableMaterial.allCases) {
                        style in
                        Text(style.rawValue).font(.largeTitle).foregroundColor(Color.red)
                    }
                }.pickerStyle(.wheel)
            }.frame(maxWidth: .infinity,maxHeight: .infinity)
            
            
        }.frame(maxWidth: .infinity,maxHeight: .infinity).ignoresSafeArea()
    }
    func getMaterial(_ style:AvailableMaterial)->AnyShapeStyle{
        switch style{
        case .bar:
            return AnyShapeStyle(Material.bar)
        case .regular:
            return AnyShapeStyle(Material.regular)
        case .thick:
            return AnyShapeStyle(Material.thick)
        case .thin:
            return AnyShapeStyle(Material.thin)
        case .ultraThick:
            return AnyShapeStyle(Material.ultraThick)
        case .ultraThin:
            return AnyShapeStyle(Material.ultraThin)
        case .noMaterial:
            return AnyShapeStyle(Material.ultraThickMaterial)
        }
    }
}

@available(iOS 16.0, *)
struct BlurBackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BlurBackgroundView()
    }
}
