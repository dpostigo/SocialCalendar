//
// Created by dpostigo on 3/17/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "BasicOperation.h"


@implementation BasicOperation {
}


- (void) saveData {
    [[NSUserDefaults standardUserDefaults] setObject: _model.calendarIdentifier forKey: CALENDAR_IDENTIFIER];
}

@end