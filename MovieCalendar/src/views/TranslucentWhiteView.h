//
// Created by dpostigo on 3/15/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>
#import "BasicWhiteView.h"


@interface TranslucentWhiteView : UIView {
    UIColor *borderColor;
    CGFloat cornerRadius;
    CALayer *shadowLayer;
    CALayer *backgroundLayer;
}


@property(nonatomic, strong) UIColor *borderColor;
@property(nonatomic) CGFloat cornerRadius;

@end