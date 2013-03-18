//
// Created by dpostigo on 10/15/12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>
#import "FPPopoverView.h"



typedef enum {
   DPPopoverStyleWhiteOnBlack

} DPPopoverStyle;



@interface DPPopoverView : FPPopoverView {

    UIColor *innerStrokeColor;
    UIColor *strokeColor;
    CGFloat cornerRadius;
    CGFloat borderWidth;
    UIView *innerShadow;

    DPPopoverStyle *style;

}

@property(nonatomic, retain) UIColor *innerStrokeColor;
@property(nonatomic, retain) UIColor *strokeColor;
@property(nonatomic) CGFloat cornerRadius;
@property(nonatomic) CGFloat borderWidth;
@property(nonatomic, retain) UIView *innerShadow;
@property(nonatomic) DPPopoverStyle *style;
- (id) initWithFrame: (CGRect) frame;
- (id) initWithStyle: (DPPopoverStyle *) aStyle;
- (CGPathRef) newContentPathWithBorderWidth: (CGFloat) borderWidth arrowDirection: (FPPopoverArrowDirection) direction;
- (CGGradientRef) newGradient;

@end