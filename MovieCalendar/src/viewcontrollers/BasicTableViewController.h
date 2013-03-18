//
// Created by dpostigo on 12/5/12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>
#import "BasicViewController.h"
#import "BasicTableViewDelegate.h"
#import "TableRowObject.h"
#import "TableSection.h"
#import "TableTextField.h"


@interface BasicTableViewController : BasicViewController {

    CGFloat topSpacing;
    CGFloat rowSpacing;
    BOOL editingEnabled;
    IBOutlet UITableView *table;
    BasicTableViewDelegate *tableDelegate;
    __unsafe_unretained NSMutableArray *dataSource;
}


@property(nonatomic, assign) NSMutableArray *dataSource;
@property(nonatomic, strong) IBOutlet UITableView *table;
@property(nonatomic, retain) BasicTableViewDelegate *tableDelegate;
@property(nonatomic) CGFloat rowSpacing;
@property(nonatomic) BOOL editingEnabled;
@property(nonatomic) CGFloat topSpacing;
- (void) prepareDataSource;
- (void) registerExternalNibs;
- (void) sizeTableToFit;
- (NSInteger) numberOfSections;
- (NSInteger) numberOfRowsInSection: (NSInteger) section;
- (NSString *) tableView: (UITableView *) tableView titleForHeaderInSection: (NSInteger) section;
- (NSString *) titleForHeaderInTableSection: (TableSection *) tableSection;
- (CGFloat) heightForRowAtIndexPath: (NSIndexPath *) indexPath;
- (CGFloat) heightForTableRow: (TableRowObject *) rowObject inSection: (TableSection *) section;
- (CGFloat) heightForFooterInSection: (NSInteger) section;
- (CGFloat) heightForHeaderInSection: (NSInteger) section;
- (CGFloat) heightForHeaderInTableSection: (TableSection *) tableSection;
- (UIView *) viewForHeaderInSection: (NSInteger) section;
- (UIView *) viewForHeaderInTableSection: (TableSection *) tableSection;
- (void) didSelectRowAtIndexPath: (NSIndexPath *) indexPath;
- (void) didSelectRowObject: (TableRowObject *) rowObject inSection: (TableSection *) tableSection;
- (UITableViewCell *) tableView: (UITableView *) tableView cellForRowAtIndexPath: (NSIndexPath *) indexPath;
- (UITableViewCell *) tableCellForIndexPath: (NSIndexPath *) indexPath;
- (void) configureCell: (UITableViewCell *) tableCell forTableSection: (TableSection *) tableSection rowObject: (TableRowObject *) rowObject;
- (void) shouldDeleteRowAtIndexPath: (NSIndexPath *) indexPath;
- (void) shouldDeleteRow: (TableRowObject *) rowObject inSection: (TableSection *) tableSection;
- (void) shouldDeleteAtRow: (NSInteger) row inSection: (NSInteger) section;
- (void) deleteRowObject: (TableRowObject *) rowObject inSection: (TableSection *) tableSection animation: (UITableViewRowAnimation) rowAnimation;
- (TableRowObject *) rowObjectForRow: (NSInteger) row inSection: (TableSection *) tableSection;
- (void) tableTextFieldEndedEditing: (TableTextField *) tableTextField;
- (TableSection *) tableSectionForTitle: (NSString *) title;
- (NSInteger) indexOfTableSectionWithTitle: (NSString *) title;
- (void) addTopSpacing;
- (void) addButtonTarget: (UIButton *) button;
- (void) handleCellButton: (id) sender;
- (void) buttonTappedForIndexPath: (NSIndexPath *) indexPath;
- (void) buttonTappedForRowObject: (TableRowObject *) rowObject inSection: (TableSection *) tableSection;
- (void) addSwipeToCell: (UITableViewCell *) cell;
- (void) handleSwipe: (id) sender;
- (void) cellSwiped: (UITableViewCell *) cell swipeRecognizer: (UISwipeGestureRecognizer *) gestureRecognizer;
- (void) cellSwiped: (UITableViewCell *) aCell;
- (void) cellSwipedAtIndexPath: (NSIndexPath *) indexPath;
- (void) cellSwipedAtRowObject: (TableRowObject *) rowObject inSection: (TableSection *) section;
- (void) addPanGesture: (UITableViewCell *) cell;
- (void) handlePan: (UIPanGestureRecognizer *) panGesture;
- (void) cellPanned: (UITableViewCell *) cell withGesture: (UIPanGestureRecognizer *) panGesture;
- (void) cellPannedAtIndexPath: (NSIndexPath *) indexPath;

@end