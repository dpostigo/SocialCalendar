//
// Created by dpostigo on 3/17/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>
#import "BasicViewController.h"


@interface AddEventViewController : BasicViewController  {

    IBOutlet UILabel *textLabel;
    IBOutlet UILabel *detailTextLabel;

}


- (IBAction) handleConfirm: (id) sender;

@end