//
// Created by dpostigo on 3/15/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <QuartzCore/QuartzCore.h>
#import "TranslucentWhiteView.h"
#import "UIColor+Utils.h"


@implementation TranslucentWhiteView {
}


@synthesize borderColor;
@synthesize cornerRadius;


- (void) create {

    self.backgroundColor = [UIColor clearColor];
    self.opaque = NO;

    self.layer.masksToBounds = NO;
    self.layer.shadowColor = [[UIColor blackColor] CGColor];
    self.layer.shadowOffset = CGSizeMake(0, 1);
    self.layer.shadowRadius = 2;
    self.layer.shadowOpacity = 0.5;


}
//
//
//- (void) setFrame: (CGRect) frame {
//    [super setFrame: frame];
//
//    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect: self.bounds cornerRadius: self.layer.cornerRadius];
//    shadowLayer.shadowPath = path.CGPath;
//}


- (void) drawRect: (CGRect) rect {
    [super drawRect: rect];

    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect: self.bounds cornerRadius: 0.0];

    [[UIColor colorWithWhite: 0.95 alpha: 0.97] setFill];
    [path fill];

    [[UIColor whiteColor] setStroke];
    [path stroke];
}

@end