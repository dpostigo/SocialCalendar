//
// Created by dpostigo on 3/14/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "BasicTomatoOperation.h"
#import "Movie.h"


#define IN_THEATRES_URL @"http://api.rottentomatoes.com/api/public/v1.0/lists/movies/in_theaters.json?apikey=%@"


@implementation BasicTomatoOperation {
}


- (void) main {
    [super main];
    NSLog(@"%s", __PRETTY_FUNCTION__);

    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    NSData *data = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: [NSString stringWithFormat: IN_THEATRES_URL, TOMATO_API_KEY]]];
    NSError *error = nil;
    NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData: data options: kNilOptions error: &error];

    [_model.movies removeAllObjects];
    NSArray *movies = [dictionary objectForKey: @"movies"];

    for (NSDictionary *dict in movies) {
        Movie *movie = [[Movie alloc] initWithTitle: [dict objectForKey: @"title"]];
        movie.posters = [dict objectForKey: @"posters"];
        movie.releaseDate = [formatter dateFromString: [[dict objectForKey: @"release_dates"] objectForKey: @"theatre"]];

        NSArray *cast = [dict objectForKey: @"abridged_cast"];
        for (NSDictionary *actorDict in cast) {
            [movie.cast addObject: [actorDict objectForKey: @"name"]];
        }

        movie.synopsis = [dict objectForKey: @"synopsis"];

        [_model.movies addObject: movie];
    }

    [_model notifyDelegates: @selector(moviesUpdated) object: nil];
}

@end