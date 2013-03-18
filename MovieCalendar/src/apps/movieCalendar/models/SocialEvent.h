//
// Created by dpostigo on 3/17/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>


typedef enum {
    SocialEventTypeNone = 0,
    SocialEventTypeMovie = 1,
    SocialEventTypeMusic = 2,
    SocialEventTypeTheater = 3
} SocialEventType;


@interface SocialEvent : NSObject {

    SocialEventType eventType;
    NSString *title;
    NSDate *startDate;
    NSDate *endDate;
}


@property(nonatomic) SocialEventType eventType;
@property(nonatomic, retain) NSString *title;
@property(nonatomic, strong) NSDate *startDate;
@property(nonatomic, strong) NSDate *endDate;
- (id) initWithEventType: (SocialEventType) anEventType;
- (id) initWithTitle: (NSString *) aTitle;

@end