//
// Created by dpostigo on 3/17/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "GetEvents.h"
#import "NSDate+JMSimpleDate.h"


@implementation GetEvents {
}


@synthesize date;


- (id) initWithDate: (NSDate *) aDate {
    self = [super init];
    if (self) {
        date = aDate;
    }

    return self;
}


- (void) main {
    [super main];

    NSDate *startDate;
    NSDate *endDate;

    if (date == nil) {
        startDate = [NSDate date];
        endDate = [startDate dateByAddingDays: 14];
    } else {
        startDate = date;
        endDate = [startDate dateByAddingDays: 1];
    }

    NSLog(@"startDate = %@", startDate);
    NSLog(@"endDate = %@", endDate);
    EKEventStore *store = _model.eventStore;
    NSPredicate *predicate = [store predicateForEventsWithStartDate: startDate endDate: endDate calendars: [NSArray arrayWithObject: _model.socialCalendar]];
    NSArray *events = [store eventsMatchingPredicate: predicate];
    NSLog(@"events = %@", events);

    for (EKEvent *event in events) {
        NSLog(@"event.title = %@", event.title);
        NSLog(@"event.startDate = %@", event.startDate);
    }

    if (date == nil) {
        [_model notifyDelegates: @selector(getEventsSucceeded:) object: events];
    } else {
        [_model notifyDelegates: @selector(fetchedEvents:forDate:) object: events andObject: date];
    }
}

@end