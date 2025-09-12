//
//  ZStackDemo.swift
//  Cre8WithVS_Package
//
//  Created by Vijay Sachan on 15/06/25.
//

import SwiftUI

enum StackAlignment: String, CaseIterable, Hashable {
    case topLeading
    case topTrailing
    case center
    case bottomLeading
    case bottomTrailing
    case top
    case bottom
    case leading
    case trailing
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
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
//                BaselineGuidesDemoView()
                Text("ZStack Alignment Examples")
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                
                Text("Getting top guides").font(.title2).bold()
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("1. Alignment: \(StackAlignment.topLeading.title)")
                    AlignmentDemoView(stackAlignment: .topLeading)
                }
                Divider()
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("2. Alignment: \(StackAlignment.top.title)")
                    AlignmentDemoView(stackAlignment: .top)
                }
                Divider()
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("3. Alignment: \(StackAlignment.topTrailing.title)")
                    AlignmentDemoView(stackAlignment: .topTrailing)
                }
                Divider()
                
                Text("Getting middle guides").font(.title2).bold()
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("4. Alignment: \(StackAlignment.leading.title)")
                    AlignmentDemoView(stackAlignment: .leading)
                }
                Divider()
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("5. Alignment: \(StackAlignment.center.title)")
                    AlignmentDemoView(stackAlignment: .center)
                }
                Divider()
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("6. Alignment: \(StackAlignment.trailing.title)")
                    AlignmentDemoView(stackAlignment: .trailing)
                }
                Divider()
                
                Text("Getting bottom guides").font(.title2).bold()
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("7. Alignment: \(StackAlignment.bottomLeading.title)")
                    AlignmentDemoView(stackAlignment: .bottomLeading)
                }
                Divider()
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("8. Alignment: \(StackAlignment.bottom.title)")
                    AlignmentDemoView(stackAlignment: .bottom)
                }
                Divider()
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("9. Alignment: \(StackAlignment.bottomTrailing.title)")
                    AlignmentDemoView(stackAlignment: .bottomTrailing)
                }
                Divider()
                
                BaselineGuidesDemoView()
            }
            .padding()
        }
    }
}

struct AlignmentDemoView: View{
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

struct CommonBaselineAlignmentView: View {
    let alignment: Alignment
    var body: some View {
        ZStack(alignment: alignment) {
//            RoundedRectangle(cornerRadius: 10)
//            HStack(alignment:.lastTextBaseline){
                Text("0. Text at 0 index some more text, some more text, some more text Text at 0 index")
                .font(.largeTitle)//.background(Color.blue)
            Text("1. Text at 1 index some more text, some more text, some more text some more text, some more text, some more text some more text, some more text, some more text Text at 1 index")
                .font(.caption)
//            }
            Divider().frame(height: 1).background(Color.red)
        }.frame(height: 100).background(Color.gray.opacity(0.15))
            
    }
}

struct BaselineGuidesDemoView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            Text("Getting text baseline guides").font(.title2).bold()
            
            VStack(alignment: .leading, spacing: 8) {
                Text("10. Alignment: \(StackAlignment.leadingFirstTextBaseline.title)")
                CommonBaselineAlignmentView(
                    alignment: .leadingFirstTextBaseline
                )
            }
            Divider()
            
            VStack(alignment: .leading, spacing: 8) {
                Text("11. Alignment: \(StackAlignment.trailingFirstTextBaseline.title)")
                CommonBaselineAlignmentView(alignment: .trailingFirstTextBaseline)
            }
            Divider()
            
            VStack(alignment: .leading, spacing: 8) {
                Text("12. Alignment: \(StackAlignment.centerFirstTextBaseline.title)")
                CommonBaselineAlignmentView(alignment: .centerFirstTextBaseline)
            }
            Divider()
            
            VStack(alignment: .leading, spacing: 8) {
                Text("13. Alignment: \(StackAlignment.leadingLastTextBaseline.title)")
                CommonBaselineAlignmentView(alignment: .leadingLastTextBaseline)
            }
            Divider()
            
            VStack(alignment: .leading, spacing: 8) {
                Text("14. Alignment: \(StackAlignment.centerLastTextBaseline.title)")
                CommonBaselineAlignmentView(alignment: .centerLastTextBaseline)
            }
            Divider()
            
            VStack(alignment: .leading, spacing: 8) {
                Text("15. Alignment: \(StackAlignment.trailingLastTextBaseline.title)")
                CommonBaselineAlignmentView(alignment: .trailingLastTextBaseline)
            }
            Divider()
        }
    }
}

#Preview {
    ZStackDemo()
}
