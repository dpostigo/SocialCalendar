//
// Created by dpostigo on 3/17/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>
#import "BasicOperation.h"


@interface GetEvents : BasicOperation {
    NSDate *date;

}


@property(nonatomic, strong) NSDate *date;
- (id) initWithDate: (NSDate *) aDate;

@end