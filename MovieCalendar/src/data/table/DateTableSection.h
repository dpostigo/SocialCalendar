//
// Created by dpostigo on 3/16/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>
#import "TableSection.h"


@interface DateTableSection : TableSection {
    NSDate *date;
}


@property(nonatomic, strong) NSDate *date;
- (id) initWithDate: (NSDate *) aDate;

@end