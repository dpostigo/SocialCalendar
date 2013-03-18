//
// Created by dpostigo on 3/17/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <EventKit/EventKit.h>
#import "GetCalendarEvents.h"
#import "NSDate+JMSimpleDate.h"


@implementation GetCalendarEvents {
}


- (void) main {
    [super main];

    EKEventStore *store = _model.eventStore;
    NSDate *today = [NSDate date];
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier: NSGregorianCalendar];
    [calendar setLocale: [NSLocale currentLocale]];
    [calendar setTimeZone: [NSTimeZone timeZoneWithName: @"US/Central"]];

    NSDateComponents *nowComponents = [calendar components: NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit fromDate: today];
    today = [calendar dateFromComponents: nowComponents];

    NSDate *twoWeeksLater = [today dateByAddingDays: 14];
    NSArray *calendars = [store calendarsForEntityType: EKEntityTypeEvent];
    NSPredicate *predicate = [store predicateForEventsWithStartDate: today endDate: twoWeeksLater calendars: [NSArray arrayWithObject: _model.socialCalendar]];
    NSArray *events = [store eventsMatchingPredicate: predicate];
    NSLog(@"events = %@", events);

    _model.socialEvents = events;

    [_model notifyDelegates: @selector(calendarEventsUpdated) object: nil];
}


@end