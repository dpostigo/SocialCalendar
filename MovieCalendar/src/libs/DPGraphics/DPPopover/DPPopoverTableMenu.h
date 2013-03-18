//
// Created by dpostigo on 10/15/12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>
#import "DPPopover.h"

@interface DPPopoverTableMenu : UITableViewController {

    NSMutableArray *options;
    __unsafe_unretained DPPopover *popover;
}

@property(nonatomic, strong) NSMutableArray *options;
@property(nonatomic, assign) DPPopover *popover;


- (UITableViewCell *) tableView: (UITableView *) tableView cellForRowAtIndexPath: (NSIndexPath *) indexPath;
- (void) tableView: (UITableView *) tableView didSelectRowAtIndexPath: (NSIndexPath *) indexPath;

@end