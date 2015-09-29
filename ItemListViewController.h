//
//  ChecklistViewController.h
//  RoanokeOutsideProject
//
//  Created by K Alnajar on 8/15/15.
//
//

#import <UIKit/UIKit.h>

@interface ItemListViewController : UITableViewController

- (void)deleteItemForIndexPath:(NSIndexPath *)indexPath fromTableView:(UITableView *)tableView;

@end
