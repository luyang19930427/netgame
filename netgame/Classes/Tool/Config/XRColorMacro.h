
#ifndef XRColorMacro_h
#define XRColorMacro_h

//颜色和透明度设置

#define rgb(r,g,b) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:1.0f]
#define rgba(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define hexColor(colorV) [UIColor colorWithHexColorString:@#colorV]
#define hexColorAlpha(colorV,a) [UIColor colorWithHexColorString:@#colorV alpha:a];

// RGB颜色
#define XRColor(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]

// 随机色
#define XRRandomColor XRColor(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256), 1.0)

#define XRThemeColor [UIColor colorWithHexColorString:@"0092ff" alpha:1.0]


#endif /* XRColorMacro_h */
