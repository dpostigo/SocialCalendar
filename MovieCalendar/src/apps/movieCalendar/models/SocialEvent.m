//
// Created by dpostigo on 3/17/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "SocialEvent.h"


@implementation SocialEvent {
}


@synthesize eventType;
@synthesize title;
@synthesize startDate;
@synthesize endDate;


- (id) initWithEventType: (SocialEventType) anEventType {
    self = [super init];
    if (self) {
        eventType = anEventType;
    }

    return self;
}


- (id) initWithTitle: (NSString *) aTitle {
    self = [super init];
    if (self) {
        title = aTitle;
    }

    return self;
}






#pragma mark UITableView


#pragma mark IBActions


#pragma mark Callbacks



@end