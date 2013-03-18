//
// Created by dpostigo on 3/17/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "AddEventViewController.h"
#import "AddEventOperation.h"
#import "GetCalendarEvents.h"
#import "UILabel+Utils.h"


@implementation AddEventViewController {
}


- (void) loadView {
    [super loadView];

    textLabel.text = _model.currentSocialEvent.title;
    textLabel.numberOfLines = 0;

    [textLabel sizeToWidth];

    detailTextLabel.top = textLabel.bottom + 1;
}


#pragma mark UITableView


#pragma mark IBActions

- (IBAction) handleConfirm: (id) sender {

    NSOperation *operation1 = [[AddEventOperation alloc] initWithSocialEvent: _model.currentSocialEvent];
//    NSOperation *operation2 = [[GetCalendarEvents alloc] init];

//    [operation2 addDependency: operation1];
    [_queue addOperation: operation1];
//    [_queue addOperation: operation2];
}


#pragma mark Callbacks



@end