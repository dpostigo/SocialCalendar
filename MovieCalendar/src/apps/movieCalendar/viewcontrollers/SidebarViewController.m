//
// Created by dpostigo on 3/15/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <QuartzCore/QuartzCore.h>
#import "SidebarViewController.h"
#import "UIImage+Utils.h"
#import "BasicWhiteView.h"
#import "TranslucentWhiteView.h"


@implementation SidebarViewController {
    BOOL isAnimating;
    BOOL isOpen;
}


- (void) loadView {

    self.hidesBackground = YES;
    [super loadView];

    backgroundView = [[UIView alloc] initWithFrame: self.view.bounds];

    backgroundView.layer.shadowOffset = CGSizeMake(1, 1);
    backgroundView.layer.shadowColor = [UIColor blackColor].CGColor;
    backgroundView.layer.shadowRadius = 1;
    backgroundView.layer.shadowOpacity = 1;
    backgroundView.clipsToBounds = NO;
    backgroundView.layer.masksToBounds = NO;
    backgroundView.backgroundColor = [UIColor clearColor];
    backgroundView.opaque = NO;
    backgroundView.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleWidth;

    self.view.clipsToBounds = NO;
    self.view.layer.masksToBounds = NO;


    [self.view insertSubview: backgroundView atIndex: 0];

    //    UIView *customBackground = [[TranslucentWhiteView alloc] init];
    //    UIImageView *backgroundImage = [[UIImageView alloc] initWithImage: [UIImage newImageFromResource: @"black-navbar-bg.png"]];
    //    //    [customBackground addSubview: backgroundImage];
    //    customBackground.layer.cornerRadius = 5.0;
    //
    //    UIView *tabBarBackground = nil;
    //    for (UIView *view in tabBar.subviews) {
    //        if ([view isKindOfClass: NSClassFromString(@"_UITabBarBackgroundView")]) {
    //            tabBarBackground = view;
    //            view.hidden = YES;
    //        }
    //    }
    //
    //    //    customBackground.frame = tabBar.frame;
    //    customBackground.frame = tabBarBackground.frame;
    ////    customBackground.width -= 2;
    ////    customBackground.left += 3;
    //    customBackground.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    //    [tabBar insertSubview: customBackground aboveSubview: tabBarBackground];
    //    //    [self.view insertSubview: customBackground belowSubview: tabBar];
    //    //    customBackground.top = 0;
    //    //    customBackground.height = 80;
    //    [tabBarBackground removeFromSuperview];

    tabBar.backgroundImage = [UIImage newImageFromResource: @"tabbar_background_black.png"];
    tabBar.selectionIndicatorImage = [UIImage newImageFromResource: @"tabbar-background-selected.png"];
    tabBar.selectedImageTintColor = [UIColor blackColor];

    for (UITabBarItem *item in tabBar.items) {
        [item setFinishedSelectedImage: item.image withFinishedUnselectedImage: item.image];
    }

    tabBar.selectedItem = [tabBar.items objectAtIndex: 0];
}


#pragma mark UITableView


#pragma mark IBActions

- (IBAction) toggle: (id) sender {
    if (isAnimating) return;
    else {
        if (isOpen) [self hide: sender];
        else [self show: sender];
    }
}


- (IBAction) hide: (id) sender {

    isAnimating = YES;
    [UIView animateWithDuration: 0.5 delay: 0.0 options: UIViewAnimationOptionCurveEaseOut animations: ^{

        self.view.left = -self.view.width + 48;
    }                completion: ^(BOOL completion) {

        isAnimating = NO;
        isOpen = NO;
    }];
}


- (IBAction) show: (id) sender {
    isAnimating = YES;
    [UIView animateWithDuration: 0.5 delay: 0.0 options: UIViewAnimationOptionCurveEaseOut animations: ^{
        self.view.left = 0;
    }                completion: ^(BOOL completion) {
        isAnimating = NO;
        isOpen = YES;
    }];
}

#pragma mark Callbacks



@end