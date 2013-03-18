//
// Created by dpostigo on 3/17/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "UILabel+Utils.h"


@implementation UILabel (Utils)


- (void) sizeToWidth {
    CGSize size = [self sizeThatFits: CGSizeMake(self.width, 100000)];
    self.height = size.height;
}

@end