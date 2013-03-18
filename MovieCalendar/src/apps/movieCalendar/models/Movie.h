//
// Created by dpostigo on 3/14/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>
#import "SocialEvent.h"


@interface Movie : SocialEvent    {

    NSDictionary *posters;
    NSURL *thumbnailURL;
    NSDate *releaseDate;
    NSMutableArray *cast;
    NSString *synopsis;
}


@property(nonatomic, strong) NSURL *thumbnailURL;
@property(nonatomic, strong) NSDictionary *posters;
@property(nonatomic, strong) NSDate *releaseDate;
@property(nonatomic, strong) NSMutableArray *cast;
@property(nonatomic, copy) NSString *synopsis;

@end