//
// Created by dpostigo on 3/16/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>
#import "TableRowObject.h"


@interface DateRowObject : TableRowObject {
    NSDate *date;
}


@property(nonatomic, strong) NSDate *date;
- (id) initWithDate: (NSDate *) aDate;

@end