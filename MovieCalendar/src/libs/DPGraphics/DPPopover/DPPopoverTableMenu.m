//
// Created by dpostigo on 10/15/12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "DPPopoverTableMenu.h"
#import "FPPopoverController.h"

@implementation DPPopoverTableMenu {
}

@synthesize options;
@synthesize popover;

- (id) initWithStyle: (UITableViewStyle) style {
    self = [super initWithStyle: style];
    if (self) {

        self.options = [[NSMutableArray alloc] init];

        //self.title = @"Popover Title";
    }

    return self;
}

- (void) viewDidLoad {
    [super viewDidLoad];
}

- (BOOL) shouldAutorotateToInterfaceOrientation: (UIInterfaceOrientation) interfaceOrientation {
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source


- (NSInteger) tableView: (UITableView *) tableView numberOfRowsInSection: (NSInteger) section {
    return [options count];
}

- (UITableViewCell *) tableView: (UITableView *) tableView cellForRowAtIndexPath: (NSIndexPath *) indexPath {
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: CellIdentifier];

    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleValue1 reuseIdentifier: CellIdentifier];
    }

    cell.textLabel.text = [options objectAtIndex: indexPath.row];

    return cell;
}


#pragma mark - Table view delegate

- (void) tableView: (UITableView *) tableView didSelectRowAtIndexPath: (NSIndexPath *) indexPath {

    if (popover != nil) {
        [popover dismissPopoverAnimated: YES];
    }
}

@end