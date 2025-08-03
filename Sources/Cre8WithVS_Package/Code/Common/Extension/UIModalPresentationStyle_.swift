//
//  UIModalPresentationStyle_.swift
//  iOS
//
//  Created by VS Comp on 07/12/24.
//

import UIKit
extension UIModalPresentationStyle{
    static var _list: [UIModalPresentationStyle]{
        return [.fullScreen,.overFullScreen,.currentContext,.overCurrentContext,.pageSheet,.formSheet,.popover,.automatic,.custom,.none,]
    }
    var _name:String{
        switch self{
        case .fullScreen: return "fullScreen"
        case .pageSheet: return "pageSheet"
        case .formSheet: return "formSheet"
        case .popover: return "popover"
        case .currentContext:
            return "currentContext"
        case .custom:
            return "custom"
        case .overFullScreen:
            return "overFullScreen"
        case .overCurrentContext:
            return "overCurrentContext"
        case .none:
            return "none"
        case .automatic:
            return "automatic"
        @unknown default:
            return "default"
        }
    }
    var _description:(String,String){
        switch self{
        case .fullScreen:
            let str1="""
            1. Same presentation in iPhone and iPad.
            """
            let str2="""
1. A presentation style in which the presented view covers the screen.

2. The views belonging to the presenting view controller are removed after the presentation completes.
"""
            return (str1,str2)
        case .pageSheet:
            let str1="""
                        1. Different presentation in iPhone and iPad.
            """
            let str2="""
1. A presentation style that partially covers the underlying content.

2. In a regular-width, regular-height size class, the system adds a dimming layer over the background content and centers the view controller’s content on top of this layer.

3. In a compact-width, regular-height size class, the system displays the view controller as a sheet with part of the background content visible near the top of the screen.

4. In a compact-height size class, the behavior is the same as UIModalPresentationStyle.fullScreen.

5. A part of the background content always remains visible.

6. To provide a custom content size, use the UIModalPresentationStyle.formSheet style instead, and set the modal view controller’s preferredContentSize property.

7. Where the background content remains visible, the system doesn’t call the presenting view controller’s viewWillDisappear(_:) and viewDidDisappear(_:) methods.

8. Check code for customizing "UISheetPresentationController"

"""
            return (str1,str2)
        case .formSheet:
            let str1="""
                        1. Different presentation in iPhone and iPad.
            """
            let str2="""
1. A presentation style that displays the content centered in the screen.

2. The default content size is smaller than that of the UIModalPresentationStyle.pageSheet style.

3.  A part of the background content always remains visible.

4. In a regular-width, regular-height size class, the system adds a dimming layer over the background content and centers the view controller’s content on top of this layer. 

5. To provide a custom content size, use the modal view controller’s preferredContentSize property.

6. In a compact-width, regular-height size class, the system displays the view controller as a sheet with part of the background content visible near the top of the screen.

7. In a compact-height size class, the behavior is the same as UIModalPresentationStyle.fullScreen.

8. Where the background content remains visible, the system doesn’t call the presenting view controller’s viewWillDisappear(_:) and viewDidDisappear(_:) methods.

9. Check code for customizing "UISheetPresentationController"

"""
            return (str1,str2)
        case .popover:
            let str1="""
                                    1. Different presentation in iPhone and iPad.
            """
            let str2="""
1. A presentation style where the content is displayed in a popover view.

2. In a horizontally regular environment, this style displays the view controller in a popover view.

3. The background content is dimmed and taps outside the popover cause the popover to be dismissed.

4.  If you do not want taps to dismiss the popover, you can assign one or more views to the passthroughViews property of the associated UIPopoverPresentationController object, which you can get from the popoverPresentationController property.

5. In iOS 13 and later, for horizontally or vertically compact environments, this option behaves the same as UIModalPresentationStyle.formSheet.

6. Check code for customizing "UIPopoverPresentationController"
"""
            return (str1,str2)
        case .currentContext:
            let str1="""
                        1. Same presentation in iPhone and iPad.
            """
            let str2="""
1. A presentation style where the content is displayed over another view controller’s content.

"""
            return (str1,str2)

        case .overFullScreen:
            let str1="""
                        1. Same presentation in iPhone and iPad.
            """
            let str2="""
1. A view presentation style in which the presented view covers the screen.

2. The views beneath the presented content are not removed from the view hierarchy when the presentation finishes. So if the presented view controller does not fill the screen with opaque content, the underlying content shows through.
"""
            return (str1,str2)
        case .overCurrentContext:
            let str1="""
                        1. Same presentation in iPhone and iPad.
            """
            let str2="""
1. A presentation style where the content is displayed over another view controller’s content.

2. The views beneath the presented content are not removed from the view hierarchy when the presentation finishes. So if the presented view controller does not fill the screen with opaque content, the underlying content shows through.
"""
            return (str1,str2)
        case .custom:
            let str1="""
                        1. Check Documentation
            """
            let str2="""
1. A custom view presentation style that is managed by a custom presentation controller and one or more custom animator objects.

"""
            return (str1,str2)
        case .none:
            let str1="""
            1. Check Documentation
            """
            let str2="""
1. A presentation style that indicates no adaptations should be made.

2. Do not use this style to present a view controller. Instead, return it from the adaptivePresentationStyle(for:) method of an adaptive delegate when you do not want a presentation controller to adapt the style of an already presented view controller.
"""
            return (str1,str2)
        case .automatic:
            let str1="""
                        1. Different presentation in iPhone and iPad.
            """
            let str2="""
1. The default presentation style chosen by the system.

2. For most view controllers, UIKit maps this style to the UIModalPresentationStyle.pageSheet style, but some system view controllers may map it to a different style.
"""
            return (str1,str2)
        @unknown default:
            return ("default","test2")
        }
    }

}
