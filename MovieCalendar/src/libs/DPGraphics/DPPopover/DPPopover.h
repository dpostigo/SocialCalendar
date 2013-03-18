//
// Created by dpostigo on 10/15/12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>
#import "FPPopoverController.h"
#import "DPPopoverView.h"


@interface DPPopover : FPPopoverController {

    CGSize offset;

}

@property(nonatomic, readonly) DPPopoverView *popoverView;
@property(nonatomic) CGSize offset;
- (id) initWithViewController: (UIViewController *) viewController;

@end