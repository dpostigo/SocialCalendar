//
// Created by dpostigo on 9/19/12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>
#import "VeryBasicViewController.h"

@interface BasicViewController : VeryBasicViewController {
    IBOutlet UIView *backgroundView;
    IBOutlet UIActivityIndicatorView *activityView;
    BOOL hidesBackground;
}

@property(nonatomic, strong) IBOutlet UIView *backgroundView;
@property(nonatomic, strong) UIActivityIndicatorView *activityView;
@property(nonatomic) BOOL hidesBackground;

@end