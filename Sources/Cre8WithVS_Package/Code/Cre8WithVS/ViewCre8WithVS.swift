
import SwiftUI
import Foundation
import SPiOSCommonP8
public struct ViewCre8WithVS: View,FWLoggerDelegate {
    @StateObject private var viewModel=VMSwiftUI()
    public init(){
        
    }
    public var body: some View {
        VStack {
            if viewModel.rootNode != nil {
                ViewNode(viewModel: viewModel)
            } else {
                Text("Loading....")
                ProgressView()
            }
        }
        .task {
            if viewModel.rootNode == nil {
                Global.logThreadType(tag: tag)
                await viewModel.loadDataAsync()
                viewModel.filteredViewModels=viewModel.childViewModel
            }
        }
    }
}
//#Preview {
//    NavigationView{
//        ViewCre8WithVS()
//    }
//}
//public struct ViewCre8WithVS: View {
//    
//    public init(){
//        
//    }
//    public var body: some View {
//        List(1...10, id: \.self) { item in
//                        NavigationLink("Item \(item)", destination: ZStackDemo())
//        }.navigationTitle("Swigfg")
//       
////        NavigationLink("Go to Detail", destination: ZStackDemo())
//        
//    }
//}
#Preview {
    NavigationView{
        ViewCre8WithVS()
    }
}
