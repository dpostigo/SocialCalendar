//
// Created by dpostigo on 9/20/12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>
#import <EventKit/EventKit.h>
#import "BasicModel.h"
#import "SocialEvent.h"


@interface Model : BasicModel {
    NSMutableArray *movies;
    UIViewController *homeController;
    EKEventStore *eventStore;
    NSString *calendarIdentifier;
    EKCalendar *socialCalendar;
    NSArray *socialEvents;

    SocialEvent *currentSocialEvent;
}


@property(nonatomic, strong) NSMutableArray *movies;
@property(nonatomic, strong) UIViewController *homeController;
@property(nonatomic, strong) EKEventStore *eventStore;
@property(nonatomic, copy) NSString *calendarIdentifier;
@property(nonatomic, strong) EKCalendar *socialCalendar;
@property(nonatomic, strong) NSArray *socialEvents;
@property(nonatomic, strong) SocialEvent *currentSocialEvent;
+ (Model *) sharedModel;
- (NSDate *) beginningDateForDate: (NSDate *) date;

@end