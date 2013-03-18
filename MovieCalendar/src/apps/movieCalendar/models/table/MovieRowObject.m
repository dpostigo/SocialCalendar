//
// Created by dpostigo on 3/14/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "MovieRowObject.h"


@implementation MovieRowObject {
}


@synthesize movie;


- (id) initWithMovie: (Movie *) aMovie {
    self = [super init];
    if (self) {
        movie = aMovie;
    }

    return self;
}




#pragma mark UITableView


#pragma mark IBActions


#pragma mark Callbacks



@end