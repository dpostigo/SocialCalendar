//
// Created by dpostigo on 3/17/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "EventRowObject.h"


@implementation EventRowObject {
}


@synthesize event;


- (id) initWithEvent: (EKEvent *) anEvent {
    self = [super init];
    if (self) {
        event = anEvent;
    }

    return self;
}




#pragma mark UITableView


#pragma mark IBActions


#pragma mark Callbacks



@end