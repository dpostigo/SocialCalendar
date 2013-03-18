//
// Created by dpostigo on 3/17/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "MenuViewController.h"


@implementation MenuViewController {
}



- (void) loadView {

    [super loadView];


    UIImageView *imageView = (UIImageView *) backgroundView;

    UIImage *image = imageView.image;
    image = [image stretchableImageWithLeftCapWidth: 3 topCapHeight: 3];
    imageView.image = image;

    backgroundView.height = self.view.height;
}

#pragma mark UITableView


#pragma mark IBActions


#pragma mark Callbacks



@end