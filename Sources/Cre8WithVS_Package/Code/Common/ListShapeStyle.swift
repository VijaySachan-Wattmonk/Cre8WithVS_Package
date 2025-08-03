//
//  ListShapeStyle.swift
//  iOS
//
//  Created by Vijay Sachan on 17/09/23.
//

import Foundation
import SwiftUI
class ListShapeStyle{
    enum StyleType{
        case foreground,background
    }
    static func pending(){
        /**
         1. All ShapeStyle are not added
         */
    }
    static func  getList(_ styleType:StyleType)->[(name:String,shapeStyle:AnyShapeStyle)]{
        var arr=[(String,AnyShapeStyle)]()
        arr.append((("AngularGradient"),AnyShapeStyle(AngularGradient(colors: [Color.blue,Color.green], center: .center))))
        arr.append((("LinearGradient"),AnyShapeStyle(LinearGradient(colors: [.yellow, .red],
                                                                    startPoint: .top,
                                                                    endPoint: .bottom))))
        arr.append((("Color"),AnyShapeStyle(Color.indigo)))
        arr.append((("EllipticalGradient"),AnyShapeStyle(EllipticalGradient(gradient:Gradient(colors: [.red, .black])))))
        arr.append((("RadialGradient"),AnyShapeStyle(RadialGradient(colors: [.red, .black,.blue], center: .center, startRadius: 10, endRadius: 50))))
        /**
          Below shape styles have not been added to the list
         1. TintShapeStyle is directly set with func tint(_:) in any view
         2. Material
         /**
          1. You can apply a blur effect to a view that appears behind another view by adding a material with the background(_:ignoresSafeAreaEdges:) modifier:
          2. Check all types of material (Material.regular,Material.bar and more)
          */
         */
        
        
        return arr
    }
    
    
}
