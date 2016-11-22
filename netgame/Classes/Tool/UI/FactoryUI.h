

#import <Foundation/Foundation.h>

@interface FactoryUI : NSObject

//工厂，实际是大批量生产零件的地方，如果映射到代码中，其实就是将一类控件的所有属性用一个静态方法做一总结归纳，方便统一修改

//UIView
+(UIView *)viewInitWithFrame:(CGRect)frame;
//UILabel
+(UILabel *)labelInitWithFrame:(CGRect)frame text:(NSString *)text textColor:(UIColor *)textColor font:(UIFont *)font;
//UIButton
+(UIButton *)buttonInitWithFrame:(CGRect)frame title:(NSString *)title titleColor:(UIColor *)titleColor titleFont:(UIFont *)font target:(id)target selector:(SEL)selector;
//UIImageView
+(UIImageView *)imageViewInitWithFrame:(CGRect)frame imageName:(NSString *)imageName;
//UITextField
+(UITextField *)textFieldInitWithFrame:(CGRect)frame text:(NSString *)text placeHolder:(NSString *)placeHolder placeHolderFont:(UIFont *)font placeHolderColor:(UIColor *)color;

@end
