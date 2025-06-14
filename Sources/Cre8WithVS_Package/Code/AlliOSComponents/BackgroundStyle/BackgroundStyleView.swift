//
//  BackgroundStyleView.swift
//  iOS
//
//  Created by Vijay Sachan on 20/09/23.
//

import SwiftUI
/**
 Different ways to set background style
 */
@available(iOS 16.0, *)
struct BackgroundStyleView: View {
    enum AvailableShape: String,CaseIterable,Identifiable {
        case rectangle,circle,capsule,ellipse
        var id: Self { self }
    }
    @State private var selectedShape: AvailableShape = .rectangle
    var body: some View {
        GeometryReader{
            geometryProxy in
            VStack(spacing: 10){
                List {
                    Picker("Shape", selection: $selectedShape) {
                        ForEach(AvailableShape.allCases) {
                            style in
                            Text(style.rawValue.capitalized)
                        }
                    }
                }
                
                ZStack{
                    // Example 1
                    getShape(style: selectedShape).fill(LinearGradient(colors: [.yellow,.green], startPoint: .top, endPoint: .bottom))
                    Text("Syntax 1 ")
                    
                }.frame(maxHeight: geometryProxy.size.height/3)
                ZStack{
                    Text("Syntax 2")
                }.frame(maxWidth: .infinity, maxHeight: geometryProxy.size.height/3).background(in: getShape(style: selectedShape)).backgroundStyle(LinearGradient(colors: [.red,.blue], startPoint: .top, endPoint: .bottom))
                
            }.frame(maxWidth: .infinity,maxHeight: .infinity)
        }
    }
    
    func getShape(style:AvailableShape)->AnyShape{
        switch style{
            
        case .rectangle:
            return AnyShape(Rectangle())
        case .circle:
            return AnyShape(Circle())
        case .capsule:
            return AnyShape(Capsule())
        case .ellipse:
            return AnyShape(Ellipse())
        }
    }
}
@available(iOS 16.0, *)
struct BackgroundStyleView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundStyleView()
    }
}
