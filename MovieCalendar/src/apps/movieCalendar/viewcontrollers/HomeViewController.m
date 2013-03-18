//
// Created by dpostigo on 3/14/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "HomeViewController.h"
#import "BasicTomatoOperation.h"
#import "CreateCalendarOperation.h"


@implementation HomeViewController {
}


- (void) loadView {
    [super loadView];
    _model.homeController = self;

    [_queue addOperation: [[CreateCalendarOperation alloc] init]];
}


#pragma mark UITableView


#pragma mark IBActions


#pragma mark Callbacks



@end