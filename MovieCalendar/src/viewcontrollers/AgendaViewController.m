//
// Created by dpostigo on 3/15/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "AgendaViewController.h"
#import "DateTableSection.h"
#import "NSDate+JMSimpleDate.h"
#import "BasicTableCell.h"
#import "TranslucentWhiteView.h"
#import "UIColor+Utils.h"
#import "BasicBlackView.h"
#import "UIImage+Utils.h"
#import "GetCalendarEvents.h"
#import "EventRowObject.h"
#import "GetEvents.h"


#define NO_EVENTS_TODAY @"No events today."


@implementation AgendaViewController {
    NSDateFormatter *formatter;
    CGPoint startingSwipePoint;
    UIView *slidingView;
    UIView *swipeUnderView;
}


- (void) loadView {
    self.hidesBackground = YES;
    [super loadView];

    table.backgroundView = [[BasicWhiteView alloc] init];
    //    [_queue addOperation: [[GetEvents alloc] init]];
    [_queue addOperation: [[GetCalendarEvents alloc] init]];
}


- (void) prepareDataSource {

    formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"EEEE, MMMM dd";

    NSDate *today = [NSDate date];

    [_queue setSuspended: YES];
    for (int j = 0; j < 14; j++) {
        NSDate *date = [[NSDate date] dateByAddingDays: j];
        DateTableSection *tableSection = [[DateTableSection alloc] initWithDate: date];

        [tableSection.rows addObject: [[TableRowObject alloc] initWithTextLabel: NO_EVENTS_TODAY detailTextLabel: nil cellIdentifier: @"NoEventsCell"]];
        [dataSource addObject: tableSection];

        //        [_queue addOperation: [[GetEvents alloc] initWithDate: date]];
    }

    [table reloadData];

    [_queue setSuspended: NO];
}


#pragma mark UITableView

- (CGFloat) heightForHeaderInSection: (NSInteger) section {
    return 20;
}


- (UIView *) viewForHeaderInTableSection: (TableSection *) tableSection {
    BasicTableCell *cell = [table dequeueReusableCellWithIdentifier: @"HeaderCell"];
    cell.textLabel.text = [[self titleForHeaderInTableSection: tableSection] uppercaseString];

    cell.textLabel.textColor = [UIColor colorWithString: DARK_BLUE];
    cell.textLabel.shadowColor = [UIColor whiteColor];
    cell.textLabel.shadowOffset = CGSizeMake(0, 1);

    UIView *cellBackground = [[UIView alloc] init];
    cellBackground.backgroundColor = [[UIColor colorWithString: @"5dd1ef"] colorWithAlphaComponent: 0.3];
    cell.backgroundView = cellBackground;

    cell.clipsToBounds = NO;
    cell.layer.masksToBounds = NO;

    cell.backgroundView = [[BasicBlackView alloc] init];
    //    cell.textLabel.shadowColor = [UIColor colorWithWhite: 0.2 alpha: 1.0];
    cell.layer.borderColor = [UIColor clearColor].CGColor;
    //    cell.textLabel.textColor = [UIColor whiteColor];

    cell.backgroundView = [[UIView alloc] init];
    cell.backgroundView.backgroundColor = [UIColor colorWithWhite: 1.0 alpha: 0.3];

    return cell;
}


- (NSString *) titleForHeaderInTableSection: (TableSection *) aTableSection {
    DateTableSection *tableSection = (DateTableSection *) aTableSection;
    NSDate *date = tableSection.date;

    formatter.dateFormat = @"EEEE";
    NSString *weekday = [formatter stringFromDate: date];
    if (date.isToday) {
        weekday = @"Today";
    } else if (date.isTomorrow) {
        weekday = @"Tomorrow";
    }

    formatter.dateFormat = @"MMMM dd";

    NSString *string = [NSString stringWithFormat: @"%@, %@", weekday, [formatter stringFromDate: date]];
    return string;
}


- (void) configureCell: (UITableViewCell *) tableCell forTableSection: (TableSection *) tableSection rowObject: (TableRowObject *) rowObject {
    [super configureCell: tableCell forTableSection: tableSection rowObject: rowObject];

    BasicTableCell *cell = (BasicTableCell *) tableCell;
    if ([rowObject isKindOfClass: [EventRowObject class]]) {
        EventRowObject *eventRowObject = (EventRowObject *) rowObject;
        EKEvent *event = eventRowObject.event;
        cell.textLabel.text = event.title;

        formatter.dateFormat = @"hh:mm a";
        cell.detailTextLabel.text = [[formatter stringFromDate: event.startDate] lowercaseString];
        //        [self addSwipeToCell: cell];
        [self addPanGesture: cell];
        return;
    }

    cell.textLabel.font = [UIFont fontWithName: @"HelveticaNeue-Italic" size: cell.textLabel.font.pointSize];
}


- (void) cellPanned: (UITableViewCell *) cell withGesture: (UIPanGestureRecognizer *) panGesture {
    [super cellPanned: cell withGesture: panGesture];
    if (panGesture.state == UIGestureRecognizerStateBegan) {
        [self prepareCellForSwiping: cell];
        startingSwipePoint = [panGesture locationInView: panGesture.view];
    } else if (panGesture.state == UIGestureRecognizerStateChanged) {
        CGPoint point = [panGesture locationInView: panGesture.view];

        if (point.x < startingSwipePoint.x) {
            //swiping left

        } else if (point.x > startingSwipePoint.x) {
            CGFloat diff = point.x - startingSwipePoint.x;
            slidingView.left = diff;

            //            if (slidingView.left > slidingView.width / 4) {
            //                panGesture.enabled = NO;
            //                [self slideToCompletion: cell gesture: panGesture];
            //            }
        }
    } else if (panGesture.state == UIGestureRecognizerStateEnded) {
        if (slidingView.left > slidingView.width / 2) {
            [self slideToCompletion: cell gesture: panGesture];
        } else {
            [self slideToOriginal: cell gesture: panGesture];
        }
    }
}


- (void) cellSwiped: (UITableViewCell *) cell swipeRecognizer: (UISwipeGestureRecognizer *) gestureRecognizer {
    [super cellSwiped: cell swipeRecognizer: gestureRecognizer];
}


- (void) cellSwiped: (UITableViewCell *) aCell {
    [super cellSwiped: aCell];
    //    [self slideToCompletion: aCell];
}


- (void) slideToCompletion: (UITableViewCell *) cell gesture: (UIGestureRecognizer *) gesture {
    if (swipeUnderView == nil || slidingView == nil) {
        [self prepareCellForSwiping: cell];
    }

    [UIView animateWithDuration: 0.5 animations: ^{
        slidingView.left = slidingView.width;
    }                completion: ^(BOOL completion) {
        gesture.enabled = YES;
    }];
}


- (void) slideToOriginal : (UITableViewCell *) cell gesture: (UIPanGestureRecognizer *) gesture {
    [UIView animateWithDuration: 0.5 animations: ^{
        slidingView.left = 0;
    }                completion: ^(BOOL completion) {

        [swipeUnderView removeFromSuperview];
        for (UIView *view in slidingView.subviews) {
            [cell.contentView addSubview: view];
        }

        swipeUnderView = nil;
        slidingView = nil;
    }];
}


- (void) prepareCellForSwiping: (UITableViewCell *) cell {

    UIView *contentView = [[UIView alloc] initWithFrame: cell.contentView.bounds];
    for (UIView *view in cell.contentView.subviews) {
        [contentView addSubview: view];
    }

    UIView *underView = [[UIView alloc] initWithFrame: contentView.bounds];
    underView.backgroundColor = [UIColor grayColor];

    contentView.backgroundColor = [UIColor whiteColor];
    [cell.contentView addSubview: underView];
    [cell.contentView addSubview: contentView];

    slidingView = contentView;
    swipeUnderView = underView;
}


//
//
//- (void) cellSwiped: (UITableViewCell *) cell swipeRecognizer: (UISwipeGestureRecognizer *) swipe {
//    [super cellSwiped: cell swipeRecognizer: swipe];
//
//    NSLog(@"%s", __PRETTY_FUNCTION__);
//
//    if (swipe.state == UIGestureRecognizerStateBegan) {
//
//        NSLog(@"Started.");
//        UIView *contentView = [[UIView alloc] initWithFrame: cell.contentView.bounds];
//        for (UIView *view in cell.contentView.subviews) {
//            [contentView addSubview: view];
//        }
//
//        UIView *underView = [[UIView alloc] initWithFrame: contentView.bounds];
//        underView.backgroundColor = [UIColor grayColor];
//
//        [cell.contentView addSubview: underView];
//        [cell.contentView addSubview: contentView];
//
//        startingSwipePoint = [swipe locationInView: swipe.view];
//
//        //        [UIView animateWithDuration: 0.5 animations: ^{
//        //
//        //            contentView.left = contentView.width;
//        //        }                completion: ^(BOOL completion) {
//        //        }];
//
//    } else if (swipe.state == UIGestureRecognizerStateChanged) {
//        NSLog(@"Changed.");
//        CGPoint point = [swipe locationInView: swipe.view];
//        NSLog(@"point.x = %f", point.x);
//    } else if (swipe.state == UIGestureRecognizerStateEnded) {
//        NSLog(@"Ended.");
//    } else if (swipe.state == UIGestureRecognizerStateCancelled) {
//    }
//}



#pragma mark IBActions


#pragma mark Callbacks


- (void) socialCalendarFetched {
}


- (void) calendarEventsUpdated {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    NSLog(@"_model.socialEvents = %@", _model.socialEvents);
    [self getEventsSucceeded: _model.socialEvents];
}


- (void) fetchedEvents: (NSArray *) events forDate: (NSDate *) date {
    NSLog(@"%s", __PRETTY_FUNCTION__);

    DateTableSection *tableSection = [self tableSectionForDate: date];
    if (tableSection) {

        [tableSection.rows removeAllObjects];

        if ([events count] == 0) {
            [tableSection.rows addObject: [[TableRowObject alloc] initWithTextLabel: @"No events today."]];
        }
        for (EKEvent *event in events) {
            [tableSection.rows addObject: [[EventRowObject alloc] initWithEvent: event]];
        }

        NSInteger index = [dataSource indexOfObject: tableSection];
        NSLog(@"index = %i", index);
        [table reloadSections: [NSIndexSet indexSetWithIndex: index] withRowAnimation: UITableViewRowAnimationFade];
    }
}


- (void) getEventsSucceeded: (NSArray *) events {

    for (DateTableSection *tableSection in dataSource) {
        [tableSection.rows removeAllObjects];
    }

    for (EKEvent *event in events) {
        [self addEventToDatasource: event];
    }

    [table reloadData];
}


- (void) addEventToDatasource: (EKEvent *) event {
    DateTableSection *tableSection = [self tableSectionForEvent: event];
    if (tableSection) {
        [tableSection.rows addObject: [[EventRowObject alloc] initWithEvent: event]];
    } else {
        NSLog(@"No table section.");
    }
}


- (void) addEventSucceeded: (EKEvent *) event {
    DateTableSection *tableSection = [self tableSectionForEvent: event];
    if (tableSection) {
        [tableSection.rows addObject: [[EventRowObject alloc] initWithEvent: event]];
    }

    NSInteger row = [tableSection.rows count] - 1;
    NSInteger section = [dataSource indexOfObject: tableSection];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow: row inSection: section];
    NSArray *indexPaths = [NSArray arrayWithObject: indexPath];
    [table insertRowsAtIndexPaths: indexPaths withRowAnimation: UITableViewRowAnimationBottom];
}




#pragma mark Convenience

- (DateTableSection *) tableSectionForEvent: (EKEvent *) event {
    for (DateTableSection *tableSection in dataSource) {
        NSDate *startDate = tableSection.date;
        NSDate *endDate = [startDate dateByAddingDays: 1];
        if ([event.startDate isOnSameDate: startDate ignoringTimeOfDay: YES]) {
            return tableSection;
        }
    }
    return nil;
}


- (DateTableSection *) tableSectionForDate: (NSDate *) date {
    for (DateTableSection *tableSection in dataSource) {
        if ([tableSection.date isEqualToDate: date]) {
            return tableSection;
        }
    }
    return nil;
}

@end