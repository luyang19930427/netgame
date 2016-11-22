
#import "FactoryUI.h"

@implementation FactoryUI
//UIView
+(UIView *)viewInitWithFrame:(CGRect)frame;
{
    UIView * view = [[UIView alloc]initWithFrame:frame];
    return view;
}
//UILabel
+(UILabel *)labelInitWithFrame:(CGRect)frame text:(NSString *)text textColor:(UIColor *)textColor font:(UIFont *)font;
{
    UILabel * label = [[UILabel alloc]initWithFrame:frame];
    label.text = text;
    label.textColor = textColor;
    label.font = font;
    return label;
}
//UIButton
+(UIButton *)buttonInitWithFrame:(CGRect)frame title:(NSString *)title titleColor:(UIColor *)titleColor titleFont:(UIFont *)font target:(id)target selector:(SEL)selector
{
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    //标题
    [button setTitle:title forState:UIControlStateNormal];
    //标题颜色
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    //标题大小
    button.titleLabel.font = font;
    //添加点击事件
    [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    
    return button;
}
//UIImageView
+(UIImageView *)imageViewInitWithFrame:(CGRect)frame imageName:(NSString *)imageName
{
    UIImageView * imageView = [[UIImageView alloc]initWithFrame:frame];
    imageView.image = [UIImage imageNamed:imageName];
    return imageView;
}
//UITextField
+(UITextField *)textFieldInitWithFrame:(CGRect)frame text:(NSString *)text placeHolder:(NSString *)placeHolder placeHolderFont:(UIFont *)font placeHolderColor:(UIColor *)color
{
    UITextField * textField = [[UITextField alloc]initWithFrame:frame];
    textField.text = text;
    textField.placeholder = placeHolder;
    textField.textAlignment = NSTextAlignmentCenter;
    textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;

//    [textField placeholderRectForBounds:CGRectMake(5, ([textField height] - 15)/2, [textField width]-10, 15)];
    [textField setValue:color forKeyPath:@"_placeholderLabel.textColor"];
    [textField setValue:font forKeyPath:@"_placeholderLabel.font"];
    return textField;
}

@end
