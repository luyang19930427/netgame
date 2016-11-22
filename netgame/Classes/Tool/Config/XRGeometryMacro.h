
#ifndef XRGeometryMacro_h
#define XRGeometryMacro_h

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

#define KEY_WINDOW   [[UIApplication sharedApplication] keyWindow]

//iPhone3GS     屏幕宽高比，单位点 320*480 1X
//iPhone4       屏幕宽高比，单位点 320*480 2X
//iPhone5       屏幕宽高比，单位点 320*568 2X
//iPhone6       屏幕宽高比，单位点 375*667 2X
//iPhone6Plus   屏幕宽高比，单位点 414*736 3X
#define kRealWidthValue(value) ((value)/375.0f*[UIScreen mainScreen].bounds.size.width)
#define kRealHeightValue(value) ((value)/667.0f*[UIScreen mainScreen].bounds.size.height)

//获取元素 x & y
#define VIEW_X(view) (view.frame.origin.x)
#define VIEW_Y(view) (view.frame.origin.y)
#define VIEW_Y_5(view) (view.frame.origin.y + 5)
#define VIEW_Y_8(view) (view.frame.origin.y + 8)
#define VIEW_Y_10(view) (view.frame.origin.y + 10)

//获取元素 width & height
#define VIEW_W(view)  (view.frame.size.width)
#define VIEW_H(view)  (view.frame.size.height)

//获取元素 x & y & width & height
#define VIEW_X_W(view) (view.frame.origin.x + view.frame.size.width)
#define VIEW_Y_H(view) (view.frame.origin.y + view.frame.size.height)

//获取元素 x & y & width & height + 5
#define VIEW_X_W_1(view) (view.frame.origin.x + view.frame.size.width + 1)
#define VIEW_Y_H_1(view) (view.frame.origin.y + view.frame.size.height + 1)
//获取元素 x & y & width & height + 5
#define VIEW_X_W_5(view) (view.frame.origin.x + view.frame.size.width + 5)
#define VIEW_Y_H_5(view) (view.frame.origin.y + view.frame.size.height + 5)

//获取元素 x & y & width & height + 10
#define VIEW_X_W_10(view) (view.frame.origin.x + view.frame.size.width + 10)
#define VIEW_Y_H_10(view) (view.frame.origin.y + view.frame.size.height + 10)

//获取元素 x & y & width & height + 15
#define VIEW_X_W_15(view) (view.frame.origin.x + view.frame.size.width + 15)
#define VIEW_Y_H_15(view) (view.frame.origin.y + view.frame.size.height + 15)

//获取元素 x & y & width & height + 20
#define VIEW_X_W_20(view) (view.frame.origin.x + view.frame.size.width + 20)
#define VIEW_Y_H_20(view) (view.frame.origin.y + view.frame.size.height + 20)

#endif /* XRGeometryMacro_h */
