//
// Created by dpostigo on 7/18/12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "VeryBasicOperation.h"
#import "Model.h"


@implementation VeryBasicOperation {
}

@synthesize delegate;

- (id) init {
    self = [super init];
    if (self) {
        _model = [Model sharedModel];
    }

    return self;
}

- (void) main {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    _model = [Model sharedModel];
}



@end