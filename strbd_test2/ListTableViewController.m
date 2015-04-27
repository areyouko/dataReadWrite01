//
//  ListTableViewController.m
//  
//
//  Created by JD Park on 2015. 4. 21..
//
//

#import "ListTableViewController.h"

@interface ListTableViewController ()

@end

@implementation ListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
            NSLog(@"테이블 진입 성공");
    
    
   
    
    //load messages
    NSURL *msgURL = [NSURL URLWithString:@"http://choose.wfk.co.kr/result_test.asp"];
    NSURLRequest *msgRequest = [NSURLRequest requestWithURL:msgURL
                                                cachePolicy:NSURLRequestUseProtocolCachePolicy
                                            timeoutInterval:60.0];
    
    NSURLConnection *theConnection = [[NSURLConnection alloc] initWithRequest:msgRequest
                                                                     delegate:self];
    
    if (theConnection) {
        NSMutableData *connData = [[NSMutableData alloc] init];
        [self setConnectionData:connData];
        
       // NSLog(@"받은 json 값은 : %@" , _connectionData);
        
    } else {
        NSLog(@"Connection failed...");
    //    [self.activityView setHidden:YES];
    //    [self.activityIndicator stopAnimating];
    }

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




#pragma mark - NSURLConnection delegate methods

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    [_connectionData setLength:0];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [_connectionData appendData:data];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
   
     connection = nil;
     _connectionData = nil;
    
    NSLog(@"Connection failed. Error - %@ %@",
          [error localizedDescription],
          [[error userInfo] objectForKey:NSURLErrorFailingURLStringErrorKey]);
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSString *retString = [NSString stringWithUTF8String:[_connectionData bytes]];
    
    NSLog(@"_connectionData 값은 : %@", _connectionData);
    NSLog(@" stringWithUTF8스트링 값은 : %@", retString);
    
    NSError *parseError = nil;
    NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData:_connectionData
                                    options:0
                                      error:&parseError];
    
    if (!parseError) {
        [self setMessageArray:jsonArray];
           NSLog(@"json array is %@", jsonArray);
        
          // NSLog(@"값 테스트 %@", [jsonArray objectForKey:@"D_Name"]);
        
        
        [_messageTable reloadData];
    } else {
        NSString *err = [parseError localizedDescription];
        NSLog(@"Encountered error parsing: %@", err);
    }
    
    

    
    
    
    
    
    
    
    
    
    
    
    
    connection = nil;
    _connectionData = nil;
    
  //  [self.activityView setHidden:YES];
 //   [self.activityIndicator stopAnimating];
}














#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [_messageArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    // Configure the cell...
    if (cell == nil) {
        cell = [[UITableViewCell alloc]
                 initWithStyle:UITableViewCellStyleSubtitle
                 reuseIdentifier:@"Cell"];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    NSDictionary *message = (NSDictionary *)[[_messageArray objectAtIndex:indexPath.row] objectForKey:@"tbl_survey_test"];
    
    NSString *byLabel = [NSString stringWithFormat:@"by %@ on %@",[message objectForKey:@"D_Name"],[message objectForKey:@"W_Date"]];
    
    cell.textLabel.text = [message objectForKey:@"H_Name"];
    cell.detailTextLabel.text = byLabel;
    
   // NSLog(@"메시지 어레이의 값의 갯수는" , [_messageArray count]);
    
    
    
    
    
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
