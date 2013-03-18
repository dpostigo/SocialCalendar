//
// Created by dpostigo on 3/17/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>
#import "BasicOperation.h"


@interface AddEventOperation : BasicOperation {
    SocialEvent *socialEvent;

}


@property(nonatomic, strong) SocialEvent *socialEvent;
- (id) initWithSocialEvent: (SocialEvent *) aSocialEvent;

@end