//
// Created by dpostigo on 3/17/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "AddEventOperation.h"
#import "NSDate+JMSimpleDate.h"


@implementation AddEventOperation {
}


@synthesize socialEvent;


- (id) initWithSocialEvent: (SocialEvent *) aSocialEvent {
    self = [super init];
    if (self) {
        socialEvent = aSocialEvent;
    }

    return self;
}


- (void) main {
    [super main];
    EKEventStore *eventStore = _model.eventStore;
    EKEvent *event = [EKEvent eventWithEventStore: eventStore];
    EKCalendar *calendar = [eventStore calendarWithIdentifier: _model.calendarIdentifier];
    event.calendar = calendar;

    // Set the start date to the current date/time and the event duration to one hour
    event.startDate = socialEvent.startDate;
    event.endDate = [event.startDate dateByAddingHours: 1];

    event.title = socialEvent.title;

    NSError *error = nil;
    BOOL result = [eventStore saveEvent: event span: EKSpanThisEvent commit: YES error: &error];
    if (result) {
        NSLog(@"Saved event to event store.");

        [_model notifyDelegates: @selector(addEventSucceeded:) object: event];
    } else {
        NSLog(@"Error saving event: %@.", error);
    }
}

@end