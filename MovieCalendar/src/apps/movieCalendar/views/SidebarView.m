//
// Created by dpostigo on 3/14/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "SidebarView.h"


@implementation SidebarView {
}


@synthesize isOpen;


- (void) open {

}

#pragma mark UITableView




#pragma mark IBActions

- (IBAction) handleButtonTapped: (id) sender {

    [UIView animateWithDuration: 0.5 delay: 0.0 options: UIViewAnimationOptionCurveEaseOut animations: ^{
        self.left -= 300;
        self.width += 300;
    }                completion: ^(BOOL completion) {
    isOpen = YES;


    }];
}


#pragma mark Callbacks



@end