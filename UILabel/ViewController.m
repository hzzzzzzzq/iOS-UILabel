//
//  ViewController.m
//  UILabel
//
//  Created by 胡正清 on 2020/8/9.
//  Copyright © 2020 胡正清. All rights reserved.
//
/*
 *****
        UILabel的属性
 *****
*/

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) UILabel *label;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.label = [[UILabel alloc] initWithFrame:CGRectMake(50, 100, self.view.bounds.size.width-100, self.view.bounds.size.height- 200)];/// label的初始化
    self.label.text = @"我爱你,可能你是一只猪。我去。。。。这么短的么？？？？还是不够长，文字到底要多长啊";/// label中要显示的内容 - 默认为空
    self.label.textColor = [UIColor whiteColor];/// 字体颜色 - 默认使用文本黑色
    self.label.font = [UIFont systemFontOfSize:25];/// 字体大小 - 默认使用系统的17
    self.label.backgroundColor = [UIColor blackColor];/// 背景颜色
    self.label.numberOfLines = 0;/// 标签最多显示行数 - 如果为0则表示多行。
    self.label.textAlignment = NSTextAlignmentCenter;/// 字体对齐方式 - 默认左对齐
    self.label.enabled = YES;
    /// 默认是YES，只是决定了Label的绘制方式，将它设置为NO将会使文本变暗，表示它没有激活，这时向它设置颜色值是无效的。
    self.label.highlighted = NO;/// 是否高亮显示 - 默认为NO
    self.label.highlightedTextColor = [UIColor orangeColor];/// 高亮显示时的文本颜色
    self.label.lineBreakMode = NSLineBreakByTruncatingTail;///设置文字过长时的显示格式，默认是最后截断尾巴，用...代替
//    self.label.shadowColor = [UIColor orangeColor];/// label阴影 -  默认没有阴影
//    self.label.shadowOffset = CGSizeMake(0, 100);/// label 阴影的偏移量 - 第一个参数为 左右偏移 第二个参数为 上下偏移
    self.label.layer.cornerRadius = 15;/// label 图层的圆角
    self.label.layer.borderWidth = 10;/// 边框的宽度
    self.label.layer.borderColor = [UIColor whiteColor].CGColor;/// 边框颜色
    self.label.baselineAdjustment = UIBaselineAdjustmentNone;/// 如果adjustsFontSizeToFitWidth属性设置为YES，这个属性就来控制文本基线的行为
    self.label.adjustsFontSizeToFitWidth = NO;/// 默认NO,改变字母之间的间距来适应Label大小
    [self.view addSubview:self.label];
    
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:self.label.text];
    ///空心字 字体里边为空
    [string addAttribute:NSStrokeWidthAttributeName
                    value:@3 range:NSMakeRange(0, 2)];
    [string addAttribute:NSStrokeColorAttributeName
                    value:[UIColor blueColor]
                    range:NSMakeRange(0, 2)];
    ///设置删除线且删除线颜色为红色
    [string addAttribute:NSStrikethroughStyleAttributeName
                    value:@(NSUnderlinePatternSolid | NSUnderlineStyleSingle)
                    range:NSMakeRange(3, 3)];
    [string addAttribute:NSStrikethroughColorAttributeName
                    value:[UIColor redColor]
                    range:NSMakeRange(3, 3)];
    
    ///文字描边颜色
    [string addAttribute:NSStrokeWidthAttributeName
                    value:@-2 range:NSMakeRange(6, 3)];
    [string addAttribute:NSStrokeColorAttributeName
                    value:[UIColor magentaColor]
                    range:NSMakeRange(6, 3)];
    [string addAttribute:NSForegroundColorAttributeName
                    value:[UIColor blueColor]
                    range:NSMakeRange(6, 3)];
    /// 设置阴影
    NSShadow *shadow = [[NSShadow alloc]init];
    shadow.shadowBlurRadius = 5;//模糊度
    shadow.shadowColor = [UIColor yellowColor];
    shadow.shadowOffset = CGSizeMake(1, 3);
    NSDictionary *attrsDic2 = @{NSShadowAttributeName: shadow,
                               NSVerticalGlyphFormAttributeName: @(0),
                               NSForegroundColorAttributeName: [UIColor magentaColor]};
    [string addAttributes:attrsDic2 range:NSMakeRange(10, 3)];
    /// 设置文本扁平化
    NSShadow *shadow1 = [[NSShadow alloc]init];
    shadow1.shadowBlurRadius = 5;//模糊度
    shadow1.shadowColor = [UIColor magentaColor];
    shadow1.shadowOffset = CGSizeMake(1, 3);
    NSDictionary *attrsDic3 = @{NSShadowAttributeName: shadow1,
                                NSVerticalGlyphFormAttributeName: @(0),
                                NSExpansionAttributeName: @1};
    [string addAttributes:attrsDic3 range:NSMakeRange(13, 4)];
    
    /// 设置字体倾斜
    NSShadow *shadow2 = [[NSShadow alloc]init];
    shadow2.shadowBlurRadius = 5;//模糊度
    shadow2.shadowColor = [UIColor blueColor];
    shadow2.shadowOffset = CGSizeMake(1, 3);
    NSDictionary *attrsDic4 = @{NSShadowAttributeName: shadow2,
                                NSVerticalGlyphFormAttributeName: @(0),
                                NSObliquenessAttributeName: @1};
    [string addAttributes:attrsDic4 range:NSMakeRange(17, 3)];
    
    //段落格式
    NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc] init];
    paragraph.lineSpacing = 2;//行间距
    paragraph.headIndent = 10;//头部缩进，相当于左padding
    paragraph.tailIndent = -10;//相当于右padding
    paragraph.lineHeightMultiple = 1.5;//行间距是多少倍
    paragraph.firstLineHeadIndent = 5;//指定段落开始的缩进，首行头缩进
    paragraph.headIndent = 10;//调整全部文字的缩进
    paragraph.paragraphSpacingBefore = 20;//段落之前的间距
    paragraph.paragraphSpacing = 20;//段落后面的间距
    paragraph.alignment = NSTextAlignmentLeft;//对齐方式

    /// 添加段落设置
    [string addAttribute:NSParagraphStyleAttributeName
                    value:paragraph
                   range:NSMakeRange(0, string.length)];
    //label添加超链接
    NSURL *url = [NSURL URLWithString:@"www.baidu.com"];
    [string addAttribute:NSLinkAttributeName
                    value:url
                   range:NSMakeRange(0, string.length)];
    self.label.attributedText = string;
}


@end
