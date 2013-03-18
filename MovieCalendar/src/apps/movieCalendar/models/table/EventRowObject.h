//
// Created by dpostigo on 3/17/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>
#import <EventKit/EventKit.h>
#import "TableRowObject.h"


@interface EventRowObject : TableRowObject {
    EKEvent *event;
}


@property(nonatomic, strong) EKEvent *event;
- (id) initWithEvent: (EKEvent *) anEvent;

@end