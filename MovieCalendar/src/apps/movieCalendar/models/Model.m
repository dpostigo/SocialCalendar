//
// Created by dpostigo on 9/20/12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "Model.h"


@implementation Model {
}


@synthesize movies;
@synthesize homeController;
@synthesize eventStore;
@synthesize calendarIdentifier;
@synthesize socialCalendar;
@synthesize socialEvents;
@synthesize currentSocialEvent;


+ (Model *) sharedModel {
    static Model *_instance = nil;

    @synchronized (self) {
        if (_instance == nil) {
            _instance = [[self alloc] init];
        }
    }

    return _instance;
}


- (id) init {
    self = [super init];
    if (self) {

        self.movies = [[NSMutableArray alloc] init];
        self.eventStore = [[EKEventStore alloc] init];
        [self getData];
    }

    return self;
}


- (void) getData {

    NSString *string = [[NSUserDefaults standardUserDefaults] objectForKey: CALENDAR_IDENTIFIER];
    if (string) {
        self.calendarIdentifier = string;
    }
}



- (NSDate *) beginningDateForDate: (NSDate *) date {
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier: NSGregorianCalendar];
    [calendar setLocale: [NSLocale currentLocale]];
    [calendar setTimeZone: [NSTimeZone timeZoneWithName: @"US/Central"]];

    NSDateComponents *nowComponents = [calendar components: NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit fromDate: date];
    date = [calendar dateFromComponents: nowComponents];
    return date;
}
@end