//
// Created by dpostigo on 3/15/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "RowCell.h"


@implementation RowCell {
}

//
//- (CGFloat) cellHeight {
//    return 100;
//}


- (void) configureButton: (UIButton *) button; {
    button.titleLabel.font = [UIFont boldSystemFontOfSize: 15.f];
    button.titleLabel.font = [UIFont fontWithName: @"HelveticaNeue-Bold" size: 15.0];
    button.titleLabel.shadowOffset = self.shadowOffset;
    button.adjustsImageWhenDisabled = NO;
    [button setTitleColor: self.textColor forState: UIControlStateNormal];
    [button setTitleShadowColor: [UIColor whiteColor] forState: UIControlStateNormal];
}


- (void) layoutViewsForColumnAtIndex: (NSUInteger) index inRect: (CGRect) rect; {

    // Move down for the row at the top
    rect.origin.y += self.columnSpacing;
    rect.size.height -= (self.bottomRow ? 2.0f: 1.0f) * self.columnSpacing;
    [super layoutViewsForColumnAtIndex: index inRect: rect];

//    UIButton *dayButton = self.dayButtons[index];
//    UIFont *font = dayButton.font;
//    dayButton.titleLabel.font = [UIFont fontWithName: font.fontName size: 12.0];
//    [dayButton sizeToFit];

}


- (UIImage *) todayBackgroundImage; {
    return [[UIImage imageNamed: @"CalendarTodaysDate.png"] stretchableImageWithLeftCapWidth: 4 topCapHeight: 4];
}


- (UIImage *) selectedBackgroundImage; {
    return [[UIImage imageNamed: @"CalendarSelectedDate.png"] stretchableImageWithLeftCapWidth: 4 topCapHeight: 4];
}


- (UIImage *) notThisMonthBackgroundImage; {
    return [[UIImage imageNamed: @"CalendarPreviousMonth.png"] stretchableImageWithLeftCapWidth: 0 topCapHeight: 0];
}


- (UIImage *) backgroundImage; {
    return [UIImage imageNamed: [NSString stringWithFormat: @"CalendarRow%@.png", self.bottomRow ? @"Bottom": @""]];
}

@end