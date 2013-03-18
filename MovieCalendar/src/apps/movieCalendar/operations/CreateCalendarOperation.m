//
// Created by dpostigo on 3/17/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "CreateCalendarOperation.h"
#import "NSDate+JMSimpleDate.h"


#define CALENDAR_NAME @"SocialCalendar"


@implementation CreateCalendarOperation {
}


- (void) main {
    [super main];
    if (_model.calendarIdentifier != nil) {
        EKCalendar *calendar = [_model.eventStore calendarWithIdentifier: _model.calendarIdentifier];
        _model.socialCalendar = calendar;
        [self getCalendarEvents];
    }

    else {
        [self getSocialCalendar];
    }
}


- (void) getSocialCalendar {

    EKEventStore *store = _model.eventStore;

    [store requestAccessToEntityType: EKEntityTypeEvent completion: ^(BOOL granted, NSError *error) {
        NSArray *calendars = [store calendarsForEntityType: EKEntityTypeEvent];
        BOOL hasSocialCalender = NO;
        for (EKCalendar *calendar in calendars) {
            if ([calendar.calendarIdentifier isEqualToString: _model.calendarIdentifier]) {
                hasSocialCalender = YES;
                break;
            }
        }

        if (hasSocialCalender) return;

        else {
            NSLog(@"Does not have SocialCalendar.");
        }

        EKSource *localSource;
        for (EKSource *source in _model.eventStore.sources) {
            if (source.sourceType == EKSourceTypeLocal) {
                localSource = source;
                break;
            }
        }

        if (!localSource) return;
        else {
            NSLog(@"Has local source.");
        }

        EKCalendar *calendar = [EKCalendar calendarForEntityType: EKEntityTypeEvent eventStore: _model.eventStore];
        calendar.source = localSource;
        calendar.title = CALENDAR_NAME;

        error = nil;
        BOOL success = [_model.eventStore saveCalendar: calendar commit: YES error: &error];
        if (error != nil) {
            NSLog(error.description);
            // TODO: error handling here
        }

        if (success) {
            NSLog(@"Created calendar.");
            _model.calendarIdentifier = calendar.calendarIdentifier;
            NSLog(@"_model.calendarIdentifier = %@", _model.calendarIdentifier);
            [self saveData];
        } else {
            NSLog(@"Did not create calendar.");
        }

        [self getCalendarEvents];
    }];
}


- (void) getCalendarEvents {
    NSLog(@"%s", __PRETTY_FUNCTION__);

    EKEventStore *store = _model.eventStore;
    NSDate *today = [_model beginningDateForDate: [NSDate date]];
    NSDate *twoWeeksLater = [today dateByAddingDays: 14];
    NSArray *calendars = [store calendarsForEntityType: EKEntityTypeEvent];
    NSPredicate *predicate = [store predicateForEventsWithStartDate: today endDate: twoWeeksLater calendars: [NSArray arrayWithObject: _model.socialCalendar]];
    NSArray *events = [store eventsMatchingPredicate: predicate];

    _model.socialEvents = events;

    [_model notifyDelegates: @selector(calendarEventsUpdated) object: nil];
}

@end