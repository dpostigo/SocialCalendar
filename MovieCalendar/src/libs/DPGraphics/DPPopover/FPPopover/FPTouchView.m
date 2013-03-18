//
//  FPTouchView.m
//
//  Created by Alvise Susmel on 4/16/12.
//  Copyright (c) 2012 Fifty Pixels Ltd. All rights reserved.
//
//  https://github.com/50pixels/FPPopover

#import "FPTouchView.h"

@implementation FPTouchView

@synthesize outsideBlock = _outsideBlock;
@synthesize insideBlock = _insideBlock;

- (void) setTouchedOutsideBlock: (FPTouchedOutsideBlock) outsideBlock {
    _outsideBlock = [outsideBlock copy];
}

- (void) setTouchedInsideBlock: (FPTouchedInsideBlock) insideBlock {
    _insideBlock = [insideBlock copy];
}



- (UIView *) hitTest: (CGPoint) point withEvent: (UIEvent *) event {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    UIView *subview = [super hitTest: point withEvent: event];


    if (event.type == UIEventTypeTouches) {
        BOOL touchedInside = (subview != self);
        NSLog(@"touchedInside = %d", touchedInside);
        if (!touchedInside) {
            NSLog(@"doing for each");
            for (UIView *s in self.subviews) {
                if (s == subview) {
                    //touched inside
                    touchedInside = YES;
                    break;
                }
            }
        }

        if (touchedInside && _insideBlock) {
            _insideBlock();
        }
        else if (!touchedInside && _outsideBlock) {
            NSLog(@"touchedInside = %d", touchedInside);
            NSLog(@"doing outside block");
            _outsideBlock();
        }
    }

    return subview;
}

/*

- (BOOL) pointInside: (CGPoint) point withEvent: (UIEvent *) event {
 NSLog(@"%s", __PRETTY_FUNCTION__);
 return [super pointInside: point withEvent: event];
}
*/
@end
