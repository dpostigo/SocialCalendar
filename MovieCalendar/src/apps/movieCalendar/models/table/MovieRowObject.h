//
// Created by dpostigo on 3/14/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>
#import "Movie.h"
#import "TableRowObject.h"


@interface MovieRowObject : TableRowObject {
    Movie *movie;
}


@property(nonatomic) Movie *movie;
- (id) initWithMovie: (Movie *) aMovie;

@end