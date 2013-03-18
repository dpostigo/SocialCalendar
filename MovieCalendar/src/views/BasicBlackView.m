//
// Created by dpostigo on 3/17/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <QuartzCore/QuartzCore.h>
#import "BasicBlackView.h"


@implementation BasicBlackView {
}


- (void) create {

    self.opaque = NO;
    self.backgroundColor = [UIColor colorWithWhite: 0.1 alpha: 1.0];
    self.clipsToBounds = NO;
    self.layer.shadowColor = [UIColor blackColor].CGColor;
    self.layer.shadowOffset = CGSizeMake(0, 1);
    self.layer.shadowOpacity = 0.5;
    self.layer.shadowRadius = 1.0;
    self.layer.masksToBounds = NO;
    self.layer.borderColor = [UIColor colorWithWhite: 0.1 alpha: 1.0].CGColor;
    self.layer.borderWidth = 1.0;
    [self rasterize];
}

@end