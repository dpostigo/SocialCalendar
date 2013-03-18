//
// Created by dpostigo on 9/19/12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "BasicViewController.h"
#import "DeviceUtils.h"


@implementation BasicViewController {
}


@synthesize backgroundView;
@synthesize activityView;
@synthesize hidesBackground;


- (void) loadView {
    [super loadView];

    self.view.backgroundColor = [UIColor clearColor];
    self.view.opaque = NO;
    if (!hidesBackground) {
        if (backgroundView == nil) {

            NSString *string = @"background-texture.png";
            if ([DeviceUtils isPad]) string = @"background-texture-ipad.png";

            NSLog(@"string = %@", string);
            UIImageView *background = [[UIImageView alloc] initWithImage: [UIImage imageNamed: string]];

            backgroundView = [[UIView alloc] init];
            [backgroundView addSubview: background];

            [self.view insertSubview: backgroundView atIndex: 0];
        }
    }
}




- (BOOL) shouldAutorotateToInterfaceOrientation: (UIInterfaceOrientation) toInterfaceOrientation {
    return UIInterfaceOrientationIsLandscape(toInterfaceOrientation);
}

@end