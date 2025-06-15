//
//  ButtonView.swift
//  iOS
//
//  Created by Vijay Sachan on 13/09/23.
//

import SwiftUI
struct ButtonView: View{
    static func pending(){
        /**
         1. Use each available constructor
         */
    }
    let font1=Font.title2
    let font2=Font.largeTitle
    let fontColor = Color.gray
    let spacing:CGFloat=20
    var body: some View {
        ScrollView(.vertical){
            ZStack(alignment: .topLeading){
                Color.clear
                VStack(alignment:.center,spacing: spacing){
                    
                    Group {
                        primitiveButtonStyle(self)
                        buttonRole(self)
                        clipShape(self)
                        customButtonStyle(self)
                        buttonForegroundStyle(self)
                        buttonBackgroundStyle(self)
                        
                    }
                    
                }.frame(maxWidth: .infinity).padding(.all,20).background(Color.white)
            }
        }
    }
    
    let primitiveButtonStyle:((ButtonView)->AnyView)={
        (buttonview:ButtonView) in
        // PrimitiveButtonStyle
        let font1=buttonview.font1
        let view=MyCustomContainer(buttonview, "PrimitiveButtonStyle"){
            VStack(alignment:.center,spacing:buttonview.spacing){
                Button("ButtonStyle .plain",action: {}).buttonStyle(.plain).font(font1)
                Button("ButtonStyle .automatic",action: {}).buttonStyle(.automatic).font(font1)
                Button("ButtonStyle .bordered",action: {}).buttonStyle(.bordered).font(font1)
                Button("ButtonStyle .borderedProminent",action: {}).buttonStyle(.borderedProminent).font(font1).fixedSize(horizontal: false, vertical: true)// fixedSize - Making button multiline
                Button("ButtonStyle .borderless",action: {}).buttonStyle(.borderless).font(font1)
            }
        }
        return AnyView(view)
    }
    let buttonRole:((ButtonView)->AnyView)={
        (buttonview:ButtonView) in
        // ButtonRole
        let font1=buttonview.font1
        let view=MyCustomContainer(buttonview, "ButtonRole"){
            VStack(alignment:.center,spacing:buttonview.spacing){
                //
                Button("ButtonRole .cancel", role:.cancel, action: {}).font(font1)
                Button("ButtonRole .destructive", role:.destructive, action: {}).font(font1)
            }
        }
        return AnyView(view)
    }
    let clipShape:((ButtonView)->AnyView)={
        (buttonview:ButtonView) in
        // clipShape
        let font1=buttonview.font1
        let view=MyCustomContainer(buttonview, "clipShape"){
            VStack(alignment:.center,spacing:buttonview.spacing){
                Button("clipShape Capsule",action: {}).buttonStyle(.borderedProminent).font(font1).clipShape(Capsule())
                Button("clipShape RoundedRectangle ",action: {}).buttonStyle(.borderedProminent).font(font1).clipShape(RoundedRectangle(cornerRadius: 15)).fixedSize(horizontal: false, vertical: true)
                Button("clipShape\nCircle",action: {}).font(font1).frame(width:150,height:150).background(Color.blue).foregroundColor(Color.white)
                    .clipShape(Circle())
            }
        }
        return AnyView(view)
    }
    let customButtonStyle:((ButtonView)->AnyView)={
        (buttonview:ButtonView) in
        // Custom ButtonStyle
        let font1=buttonview.font1
        let view=MyCustomContainer(buttonview, "Custom ButtonStyle"){
            VStack(alignment:.center,spacing:buttonview.spacing){
                
                VStack(spacing: 5){
                    Text("ButtonStyle custom \n Tap below button to change background image").multilineTextAlignment(.center).font(.title3).fixedSize(horizontal: false, vertical: true)
                    Button(action: {}, label: {
                        ZStack{
                            
                        }.frame(width:150,height:150)
                    }).buttonStyle(ButtonStyleBGImage())
                }
                
                Button("ButtonStyle custom \n Tap button to tint background color",action: {}).buttonStyle(ButtonStyleTintBGColor()).font(font1).fixedSize(horizontal: false, vertical: true)
            }
        }
        return AnyView(view)
    }
    let buttonForegroundStyle:((ButtonView)->AnyView)={
        (buttonview:ButtonView) in
        // foregroundStyle
        let font1=buttonview.font1
        var arr=ListShapeStyle.getList(.foreground)
        let view=MyCustomContainer(buttonview, "foregroundStyle"){
            VStack(alignment:.center,spacing:buttonview.spacing){
                ForEach((0..<arr.count),id: \.self){
                    i in
                    let tuple=arr[i]
                    Button("Button\nShapeStyle : \(tuple.name)",action: {}).font(font1).foregroundStyle(tuple.shapeStyle).frame(maxWidth: .infinity).padding().border(Color.black).fixedSize(horizontal: false, vertical: true)
                }
                if #available(iOS 16.0, *) {
                    Button("Button\nShapeStyle : \("TintShapeStyle")\n #available(iOS 16.0",action: {}).font(font1).frame(maxWidth: .infinity).padding().border(Color.black).fixedSize(horizontal: false, vertical: true).tint(Gradient(colors: [.red, .yellow, .green]))
                }
            }
            
            
        }
        return AnyView(view)
    }
    let buttonBackgroundStyle:((ButtonView)->AnyView)={
        (buttonview:ButtonView) in
        // foregroundStyle
        let font1=buttonview.font1
        var arr=ListShapeStyle.getList(.background)
        let view=MyCustomContainer(buttonview, "backgroundStyle"){
            VStack(alignment:.center,spacing:buttonview.spacing){
                ForEach((0..<arr.count),id: \.self){
                    i in
                    let tuple=arr[i]
                    Button("Button\nShapeStyle : \(tuple.name)",action: {}).font(font1).frame(maxWidth: .infinity).foregroundColor(.white).padding().border(Color.black).fixedSize(horizontal: false, vertical: true).background(tuple.shapeStyle)
                }
                if #available(iOS 16.0, *) {
                    Button("Button\nShapeStyle : \("TintShapeStyle")\n #available(iOS 16.0",action: {}).font(font1).frame(maxWidth: .infinity).fixedSize(horizontal: false, vertical: true).background(Gradient(colors: [.red, .yellow, .green]))
                }
            }
            
            
        }
        return AnyView(view)
    }
}
struct MyCustomContainer<Content: View>:View{
    @ViewBuilder let contentView: Content
    var buttonView:ButtonView!
    var textStr:String!
    init(_ buttonView: ButtonView,_ textStr:String,@ViewBuilder contentView: () -> Content) {
        self.contentView = contentView()
        self.buttonView = buttonView
        self.textStr=textStr
    }
    var body: some View {
        VStack(alignment:.center,spacing:0){
            Text(textStr).font(buttonView.font1).bold().frame(maxWidth: .infinity).background(Color.black).foregroundColor(.white)
            contentView.padding(buttonView.spacing)
        }.background(Color.white).compositingGroup().cornerRadius(buttonView.spacing).shadow(color: .gray,radius: buttonView.spacing/2)
    }
}

//private struct MyButtonView<S>: View where S:PrimitiveButtonStyle{
//    let subText:String
//    var buttonStyle:S
//    let font1=Font.title
//    let font2=Font.title3
//    var body: some View {
//        VStack(alignment: .center,spacing: 5){
//            Button("Button",action: {}).buttonStyle(buttonStyle).font(font1)
//            Text(subText).font(font2)
//        }
//
//    }
//}
private struct ButtonStyleTintBGColor:ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(configuration.isPressed ? Color.red : Color.yellow)
        //            .foregroundStyle(.white)
    }
}
private struct ButtonStyleBGImage:ButtonStyle{
    let imageDefault=Image(systemName: "square.and.arrow.up.circle").resizable()
    let imagePressed=Image(systemName: "square.and.arrow.up.circle.fill").resizable()
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .background(content: {
                configuration.isPressed ? imagePressed : imageDefault
            })
    }
}
struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView()
    }
}
