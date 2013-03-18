//
// Created by dpostigo on 3/14/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>
#import "BasicWhiteView.h"


@interface SidebarView : BasicWhiteView {

    IBOutletCollection(UIButton) NSArray *buttons;
    BOOL isOpen;
}


@property(nonatomic) BOOL isOpen;
- (IBAction) handleButtonTapped: (id) sender;

@end