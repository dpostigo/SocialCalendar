//
// Created by dpostigo on 3/15/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "CalendarViewController.h"
#import "TSQTACalendarRowCell.h"
#import "MonthCell.h"
#import "RowCell.h"
#import "UIColor+Utils.h"
#import "DPPopover.h"
#import "AddEventOperation.h"
#import "NSDate+JMSimpleDate.h"


@implementation CalendarViewController {
}


- (void) loadView {
    [super loadView];

    TSQCalendarView *calendarView = [[TSQCalendarView alloc] init];
    //    calendarView.calendar = self.calendar;
    calendarView.rowCellClass = [RowCell class];
    calendarView.headerCellClass = [MonthCell class];
    calendarView.delegate = self;
    calendarView.firstDate = [NSDate date];
    calendarView.lastDate = [NSDate dateWithTimeIntervalSinceNow: 60 * 60 * 24 * 365];
    calendarView.backgroundColor = [UIColor colorWithRed: 0.84f green: 0.85f blue: 0.86f alpha: 1.0f];
    calendarView.backgroundColor = [UIColor colorWithWhite: 0.9 alpha: 1.0];
    calendarView.backgroundColor = [UIColor colorWithString: WHITE_STRING];
    //    calendarView.backgroundColor = [UIColor clearColor];
    //    calendarView.opaque = NO;
    calendarView.pagingEnabled = YES;
    CGFloat onePixel = 1.0f / [UIScreen mainScreen].scale;
    calendarView.contentInset = UIEdgeInsetsMake(0.0f, onePixel, 0.0f, onePixel);

    calendarView.width = self.view.width;
    calendarView.height = self.view.height;
    //    calendarView.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    //    [self.view addSubview: calendarView];
    self.view = calendarView;
}


#pragma mark UITableView


#pragma mark IBActions


#pragma mark Callbacks


#pragma mark TSQCalendarView

- (void) calendarView: (TSQCalendarView *) calendarView didSelectDate: (NSDate *) date {

    if (_model.currentSocialEvent) {

        NSLog(@"%s", __PRETTY_FUNCTION__);

        UIViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier: @"Popover"];
        DPPopover *popover = [[DPPopover alloc] initWithViewController: controller];
        popover.arrowDirection = FPPopoverArrowDirectionUp;
        popover.contentSize = CGSizeMake(300, 200);

        NSDate *startOfDay = [calendarView clampDate: date toComponents: NSDayCalendarUnit | NSMonthCalendarUnit | NSYearCalendarUnit];
        NSIndexPath *indexPath = [calendarView indexPathForRowAtDate: startOfDay];
        CGRect rect = [calendarView.tableView rectForRowAtIndexPath: indexPath];

        date = [date dateByAddingDays: 1];

        _model.currentSocialEvent.startDate = date;
        UIButton *button = calendarView.selectedButton;
        [popover presentPopoverFromView: button];
    }
}

@end