//
// Created by dpostigo on 3/14/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "Movie.h"


@implementation Movie {
}


@synthesize thumbnailURL;
@synthesize posters;
@synthesize releaseDate;
@synthesize cast;
@synthesize synopsis;


- (id) initWithTitle: (NSString *) aTitle {
    self = [super initWithTitle: aTitle];
    if (self) {
        cast = [[NSMutableArray alloc] init];
        self.eventType = SocialEventTypeMovie;
    }

    return self;
}


- (void) setPosters: (NSDictionary *) posters1 {
    posters = posters1;
    self.thumbnailURL = [NSURL URLWithString: [posters objectForKey: @"detailed"]];
}



#pragma mark UITableView


#pragma mark IBActions


#pragma mark Callbacks



@end