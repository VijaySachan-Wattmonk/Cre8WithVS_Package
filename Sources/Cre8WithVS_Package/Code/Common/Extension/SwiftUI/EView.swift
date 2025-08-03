//
//  EView.swift
//  Cre8WithVS_Package
//
//  Created by Vijay Sachan on 6/16/25.
//

import SwiftUI
public extension View{
    func pkg_FontTitle() -> some View{
        return self.font(PH.Font_.title)
    }
    func pkg_FontHeader() -> some View {
        self.font(PH.Font_.header)
    }
    
    func pkg_FontSubTitle() -> some View {
        self.font(PH.Font_.subTitle)
    }
    
    func pkg_FontFooter() -> some View {
        self.font(PH.Font_.footer)
    }
}

