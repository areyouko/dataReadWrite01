//
//  ListTableViewController.h
//  
//
//  Created by JD Park on 2015. 4. 21..
//
//

#import <UIKit/UIKit.h>

@interface ListTableViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource>


@property (nonatomic, retain) NSMutableData *connectionData;
@property (nonatomic, retain) NSArray *messageArray;
//@property (retain, nonatomic) IBOutlet UITableView *messageTable;

//@property (strong, nonatomic) IBOutlet UITableView *messageTable;

@property (strong, nonatomic) IBOutlet UITableView *messageTable;

@property (retain, nonatomic) IBOutlet UIView *activityView;
@property (retain, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;


@end
