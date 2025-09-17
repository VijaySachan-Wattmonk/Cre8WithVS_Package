//
//  ZStackDemo.swift
//  Cre8WithVS_Package
//
//  Created by Vijay Sachan on 15/06/25.
//

import SwiftUI

enum StackAlignment: String, CaseIterable, Hashable {
    case top
    case topLeading
    case topTrailing
    case bottomLeading
    case bottomTrailing
    case bottom
    case leading
    case trailing
    case center
    case leadingFirstTextBaseline
    case trailingFirstTextBaseline
    case centerFirstTextBaseline
    case leadingLastTextBaseline
    case centerLastTextBaseline
    case trailingLastTextBaseline
    var alignment: Alignment{
        switch self {
        case .topLeading: return .topLeading
        case .topTrailing: return .topTrailing
        case .center: return .center
        case .bottomLeading: return .bottomLeading
        case .bottomTrailing: return .bottomTrailing
        case .top: return .top
        case .bottom: return .bottom
        case .leading: return .leading
        case .trailing: return .trailing
        case .leadingFirstTextBaseline: return .leadingFirstTextBaseline
        case .trailingFirstTextBaseline: return .trailingFirstTextBaseline
        case .centerFirstTextBaseline: return .centerFirstTextBaseline
        case .leadingLastTextBaseline: return .leadingLastTextBaseline
        case .centerLastTextBaseline: return .centerLastTextBaseline
        case .trailingLastTextBaseline: return .trailingLastTextBaseline
        }
    }
    
    var title: String {
        switch self {
        case .topLeading: return ".topLeading"
        case .topTrailing: return ".topTrailing"
        case .center: return ".center"
        case .bottomLeading: return ".bottomLeading"
        case .bottomTrailing: return ".bottomTrailing"
        case .top: return ".top"
        case .bottom: return ".bottom"
        case .leading: return ".leading"
        case .trailing: return ".trailing"
        case .leadingFirstTextBaseline: return ".leadingFirstTextBaseline"
        case .trailingFirstTextBaseline: return ".trailingFirstTextBaseline"
        case .centerFirstTextBaseline: return ".centerFirstTextBaseline"
        case .leadingLastTextBaseline: return ".leadingLastTextBaseline"
        case .centerLastTextBaseline: return ".centerLastTextBaseline"
        case .trailingLastTextBaseline: return ".trailingLastTextBaseline"
        }
    }
}
struct ZStackDemo: View{
    @State private var selectedAlignment: StackAlignment = .center
    
    let selectableAlignments: [StackAlignment] = [.top,.topLeading, .topTrailing, .bottom, .bottomLeading, .bottomTrailing,.leading, .trailing,.center]
    var body: some View {
        ScrollView(.vertical){
            VStack(alignment: .leading, spacing: 24){
                Text("Getting top, middle, bottom guides").font(.title2).bold()
                HStack{
                    Text("Select Alignment: ")
                    
                    Picker("Alignment", selection: $selectedAlignment) {
                        ForEach(selectableAlignments, id: \.self) { alignment in
                            Text(alignment.title)
                        }
                    }
                }
                .pickerStyle(.menu)
                VStack(alignment: .leading, spacing: 8) {
                    CommonAlignmentDemoView(stackAlignment: selectedAlignment)
                }
                BaselineGuidesDemoView()
//                AlignmentGuideView()
//                AlignmentGuideView2()
                
            }
            .padding()
        }
    }
}
struct CommonAlignmentDemoView: View {
    let stackAlignment: StackAlignment
    var body: some View{
        ZStack(alignment: stackAlignment.alignment){
            Circle()
                .fill(Color.red.opacity(0.85))
                .frame(width: 60, height: 60)
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.gray.opacity(0.15))
                .frame(height: 100)
            Text(stackAlignment.title)
                .padding(6)
                .background(Color.accentColor.opacity(0.85))
                .foregroundColor(.white)
                .cornerRadius(6)
            
        }
    }
}
struct Circle1TrailingKey: AlignmentID {
    static func defaultValue(in context: ViewDimensions) -> CGFloat {
        context[HorizontalAlignment.center] // default to trailing edge
    }
}
extension HorizontalAlignment {
    static let circle1Trailing = HorizontalAlignment(Circle1TrailingKey.self)
}
struct AlignmentGuideView2: View{
//    let stackAlignment: StackAlignment
    let align=Alignment(horizontal:.leading, vertical: .bottom)
    var body: some View{
//        ZStack(alignment: Alignment(horizontal: /*.circle1Trailing*/.leading, vertical: .top)) {
        ZStack(alignment: align){
            // Circle1 sets the alignment guide
//
//            Color.gray.opacity(0.15)
            Circle()
                .fill(Color.green)
                .frame(width: 60, height: 60)
                .alignmentGuide(.leading) { context in
                    context[HorizontalAlignment.trailing] // tell the stack: my trailing edge is the guide
                }

            // Circle2 positions itself relative to Circle1’s trailing edge
            Circle()
                .fill(Color.red)
                .frame(width: 40, height: 40)
//                .alignmentGuide(.leading) { context in
//                    context[.trailing]  // place my leading 10pt to the right of Circle1’s trailing
//                }
            Circle()
                .fill(Color.blue)
                .frame(width: 20, height: 20)
//                .alignmentGuide(.leading) { context in
//                    context[.leading]  // place my leading 10pt to the right of Circle1’s trailing
//                }
        }
        .frame(idealHeight: 200,alignment:align).background(Color.gray.opacity(0.15))
    }
}
struct AlignmentGuideView: View{
//    let stackAlignment: StackAlignment
    var body: some View{
        ZStack(alignment: .trailing) {
//            Color.gray
            Color.gray.opacity(0.15)
            Circle()
                .fill(Color.green.opacity(0.85))
                .frame(width: 60, height: 60)
            Circle()
                .fill(Color.red.opacity(0.85))
                .frame(width: 60, height: 60)
                .alignmentGuide(.trailing) { context in
                    print("Width: \(context.width)")
                    print("Height: \(context.height)")
                    print("Top: \(context[.top])")
                    print("Bottom: \(context[.bottom])")
                    print("Leading: \(context[.leading])")
                    print("Trailing: \(context[.trailing])")
                    print("FirstTextBaseline: \(context[.firstTextBaseline])")
                    print("LastTextBaseline: \(context[.lastTextBaseline])")
                    return context[.trailing]+10//context.width
                    
                }
//                                    }
//            Image(systemName: "mic.fill")
//                .alignmentGuide(.bottom) { context in
//                    //context[.bottom] - 0.2 * context.height
//                    0
//                }
//            Text("Connecting")
//                .font(.caption)
            Text("Bryan")
                .font(.title)
//            Divider()
//                .background(Color.red)
        }
        .frame(height:120)/*.background(Color.gray.opacity(0.15))*/
//        .border(Color.blue, width: 2)
//        .padding()
        
    }
}

struct CommonBaselineAlignmentView: View {
    let alignment: Alignment
    var body: some View {
        ZStack(alignment: alignment) {
            Circle()
                .fill(Color.blue.opacity(0.85))
                .frame(width: 60, height: 60)
                Text("Text,  some more text, some more text, some more text,some more text,some more text")
                .font(.largeTitle)//.background(Color.blue)
                
            Divider().frame(height: 1).background(Color.red)
        }.frame(height: 100).background(Color.gray.opacity(0.15))
            
    }
}

struct BaselineGuidesDemoView: View {
    @State private var selectedBaselineAlignment: StackAlignment = .leadingFirstTextBaseline
    let selectableBaselineAlignments: [StackAlignment] = [
        .leadingFirstTextBaseline,
        .trailingFirstTextBaseline,
        .centerFirstTextBaseline,
        .leadingLastTextBaseline,
        .centerLastTextBaseline,
        .trailingLastTextBaseline
    ]
    var body: some View{
        VStack(alignment: .leading, spacing: 24){
            Text("Getting text baseline guides").font(.title2).bold()
            HStack {
                Text("Select Alignment: ")
//                Spacer()
                Picker("Baseline Alignment", selection: $selectedBaselineAlignment) {
                    ForEach(selectableBaselineAlignments, id: \.self) { alignment in
                        Text(alignment.title)
                    }
                }
            }/*.border(.black)*/
            .pickerStyle(.menu)
            VStack(alignment: .leading, spacing: 8){
                CommonBaselineAlignmentView(alignment: selectedBaselineAlignment.alignment)
            }
        }
    }
}

#Preview {
    ZStackDemo()
}
