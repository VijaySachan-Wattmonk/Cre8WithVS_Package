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
        }
    }
    
    var title: String {
        switch self {
        case .topLeading: return "Top Leading"
        case .topTrailing: return "Top Trailing"
        case .center: return "Center"
        case .bottomLeading: return "Bottom Leading"
        case .bottomTrailing: return "Bottom Trailing"
        case .top: return "Top"
        case .bottom: return "Bottom"
        case .leading: return "Leading"
        case .trailing: return "Trailing"
        case .leadingFirstTextBaseline: return "Leading First Text Baseline"
        case .trailingFirstTextBaseline: return "Trailing First Text Baseline"
        }
    }
}

struct ZStackDemo: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
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
                
                Text("Getting text baseline guides").font(.title2).bold()
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("10. Alignment: \(StackAlignment.leadingFirstTextBaseline.title)")
                    AlignmentDemoView(stackAlignment: .leadingFirstTextBaseline)
                }
                Divider()
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("11. Alignment: \(StackAlignment.trailingFirstTextBaseline.title)")
                    AlignmentDemoView(stackAlignment: .trailingFirstTextBaseline)
                }
                Divider()
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

#Preview {
    ZStackDemo()
}
