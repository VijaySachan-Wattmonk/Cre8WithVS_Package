//
//  Constants+Storyboard.swift
//  iOS
//
//  Created by VS Comp on 09/11/24.
//

import Foundation
extension Constants{
    class Storyboard{
        enum FileName:String{
            case Storyboard,UITabBarController
        }
    }
    class VC{
        enum Id:String{
        case VC1,VCModalPresentationStyle,VCTestModal,VCUIKit,VCUIRefreshControl,VCUIViewContoller
            case VCUITabBar,VCUITabBarController,VCUITabBarChild
             var name:String{
                return self.rawValue
            }
        }
        
        
    }
    class UITableViewCell_{
        enum Id:String{
        case UITableViewCellUIKit
             var name:String{
                return self.rawValue
            }
        }
    }
}
