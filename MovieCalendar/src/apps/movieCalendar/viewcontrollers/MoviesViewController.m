//
// Created by dpostigo on 3/14/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "MoviesViewController.h"
#import "MovieRowObject.h"
#import "BasicTomatoOperation.h"
#import "BasicTableCell.h"
#import "UIColor+Utils.h"
#import "BasicWhiteView.h"
#import "TranslucentWhiteView.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import <SDWebImage/UIButton+WebCache.h>
#import <QuartzCore/QuartzCore.h>


@implementation MoviesViewController {
}


- (void) loadView {
    self.rowSpacing = 10;
    self.hidesBackground = YES;
    [super loadView];
    self.topSpacing = 10;
    [_queue addOperation: [[BasicTomatoOperation alloc] init]];
}


- (void) prepareDataSource {
    TableSection *tableSection = [[TableSection alloc] initWithTitle: @""];

    for (Movie *movie in _model.movies) {
        [tableSection.rows addObject: [[MovieRowObject alloc] initWithMovie: movie]];
    }

    [dataSource addObject: tableSection];
    [table reloadData];
}





#pragma mark UITableView

- (void) configureCell: (UITableViewCell *) tableCell forTableSection: (TableSection *) tableSection rowObject: (TableRowObject *) rowObject {
    [super configureCell: tableCell forTableSection: tableSection rowObject: rowObject];

    BasicTableCell *cell = (BasicTableCell *) tableCell;
    MovieRowObject *movieRowObject = (MovieRowObject *) rowObject;
    Movie *movie = movieRowObject.movie;

    cell.backgroundView = [[TranslucentWhiteView alloc] init];
    cell.textLabel.text = movie.title;
    //    [cell.textLabel sizeToFit];

    CGSize size = [cell.textLabel sizeThatFits: CGSizeMake(cell.textLabel.width, 1000)];
    cell.textLabel.height = size.height;

    cell.detailTextLabel.top = cell.textLabel.bottom + 5;
    cell.captionLabel.text = movie.synopsis;

    //    CGFloat multiplier = 0.7;
    //    cell.imageView.width = 180 * multiplier;
    //    cell.imageView.height = 267 * multiplier;

    UIView *imageShadow = [[UIView alloc] initWithFrame: cell.imageView.frame];
    imageShadow.clipsToBounds = NO;
    imageShadow.layer.masksToBounds = NO;
    imageShadow.layer.shadowColor = [UIColor whiteColor].CGColor;
    imageShadow.layer.shadowOpacity = 1.0;
    imageShadow.layer.shadowOffset = CGSizeMake(0, 1);
    imageShadow.layer.shadowRadius = 1.0;
    imageShadow.backgroundColor = [UIColor whiteColor];

    [cell.imageView.superview insertSubview: imageShadow belowSubview: cell.imageView];

    [cell.imageView setImageWithURL: movieRowObject.movie.thumbnailURL];
    cell.imageView.clipsToBounds = YES;

    cell.backgroundView = [[UIView alloc] init];

    UIButton *button = [UIButton buttonWithType: UIButtonTypeCustom];
    button.frame = cell.imageView.frame;
    [cell.imageView.superview insertSubview: button belowSubview: cell.imageView];
    [button setImageWithURL: movie.thumbnailURL forState: UIControlStateNormal];

    cell.button = button;
    cell.imageView.hidden = YES;

    [self addButtonTarget: cell.button];

    [cell rasterize];
}


- (void) didSelectRowObject: (TableRowObject *) rowObject inSection: (TableSection *) tableSection {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    NSLog(@"self.parentViewController = %@", self.parentViewController);
    //    [_model.homeController performSegueWithIdentifier: @"ModalSegue" sender: self];

}



#pragma mark IBActions


- (void) buttonTappedForRowObject: (TableRowObject *) rowObject inSection: (TableSection *) tableSection {
    [super buttonTappedForRowObject: rowObject inSection: tableSection];

    MovieRowObject *movieRowObject = (MovieRowObject *) rowObject;
    Movie *movie = movieRowObject.movie;

    _model.currentSocialEvent = movie;
}



#pragma mark Callbacks

- (void) moviesUpdated {
    [dataSource removeAllObjects];
    TableSection *tableSection = [[TableSection alloc] initWithTitle: @""];

    for (Movie *movie in _model.movies) {
        [tableSection.rows addObject: [[MovieRowObject alloc] initWithMovie: movie]];
    }

    [dataSource addObject: tableSection];
    [table reloadData];
}

@end