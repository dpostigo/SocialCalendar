//
// Created by dpostigo on 3/16/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "DateRowObject.h"


@implementation DateRowObject {
}


@synthesize date;


- (id) initWithDate: (NSDate *) aDate {
    self = [super init];
    if (self) {
        date = aDate;
    }

    return self;
}




#pragma mark UITableView


#pragma mark IBActions


#pragma mark Callbacks



@end