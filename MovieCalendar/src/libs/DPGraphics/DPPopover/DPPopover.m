//
// Created by dpostigo on 10/15/12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "DPPopover.h"
#import "DPPopoverView.h"


@implementation DPPopover {
}


@synthesize offset;


- (DPPopoverView *) popoverView {
    return (DPPopoverView *) _contentView;
}


- (id) initWithViewController: (UIViewController *) viewController {
    self = [super init];
    if (self) {

        self.arrowDirection = FPPopoverArrowDirectionAny;
        self.view.userInteractionEnabled = YES;

        _touchView = [[FPTouchView alloc] initWithFrame: self.view.bounds];
        _touchView.backgroundColor = [UIColor clearColor];
        _touchView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        _touchView.clipsToBounds = NO;
        [self.view addSubview: _touchView];

        [_touchView setTouchedOutsideBlock: ^{
            [self dismissPopoverAnimated: YES];
        }];



        self.contentSize = CGSizeMake(300, 200); //default size
        _contentView = [[DPPopoverView alloc] initWithFrame: CGRectMake(0, 0,
                self.contentSize.width, self.contentSize.height)];
        _viewController = viewController;
        [_touchView addSubview: _contentView];
        [_contentView addContentView: _viewController.view];
        _viewController.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;

        self.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        self.view.clipsToBounds = NO;

        _touchView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        _touchView.clipsToBounds = NO;

        //setting contentview
        _contentView.title = _viewController.title;
        _contentView.clipsToBounds = NO;

        [_viewController addObserver: self forKeyPath: @"title" options: NSKeyValueObservingOptionNew context: nil];
    }
    return self;
}
//
//- (void) setupView {
//    [super setupView];
//
//    self.view.frame = CGRectMake(offset.width, offset.height, [self parentWidth], [self parentHeight]);
//
//}

@end