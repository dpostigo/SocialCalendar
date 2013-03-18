//
// Created by dpostigo on 3/15/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "MonthCell.h"
#import "UIImage+Utils.h"


@implementation MonthCell {
    UIImageView *headerBackground;
    UIView *headerView;
}

//
//- (CGFloat) cellHeight {
//    return 20;
//}


- (id) initWithCalendar: (NSCalendar *) calendar reuseIdentifier: (NSString *) reuseIdentifier {
    self = [super initWithCalendar: calendar reuseIdentifier: reuseIdentifier];
    if (self) {

        //        self.textLabel.textColor = [UIColor blackColor];
        //        self.textLabel.backgroundColor = [UIColor clearColor];


        self.backgroundColor = [UIColor clearColor];
        UIImage *image = [UIImage newImageFromResource: @"tabbar-background-selected.png"];
        headerBackground = [[UIImageView alloc] initWithImage: [image stretchableImageWithLeftCapWidth: 2 topCapHeight: 3]];
        headerView = [[UIView alloc] initWithFrame: CGRectMake(0, 0, 300, 200)];
        headerBackground.width = headerView.width;
        headerBackground.height = headerView.height;
        headerBackground.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;

        [headerView addSubview: headerBackground];
        [headerView addSubview: self.textLabel];

        [self addSubview: headerView];

        self.textLabel.textAlignment = NSTextAlignmentLeft;
        self.textLabel.font = [UIFont fontWithName: @"HelveticaNeue-Bold" size: 15.0];
    }

    return self;
}


- (void) createHeaderLabels {
    [super createHeaderLabels];

    for (UILabel *headerLabel in self.headerLabels) {
        headerLabel.font = [UIFont fontWithName: @"HelveticaNeue-Medium" size: 11.0];
    }
}


- (void) layoutSubviews {
    [super layoutSubviews];
    [headerView addSubview: headerBackground];

    headerView.width = self.contentView.width;
    headerView.height = 5;

    self.textLabel.width -= 20;
    self.textLabel.height -= 5;
    self.textLabel.centerX = self.contentView.width / 2;
    self.textLabel.text = [self.textLabel.text uppercaseString];
}


#pragma mark UITableView


#pragma mark IBActions


#pragma mark Callbacks



@end