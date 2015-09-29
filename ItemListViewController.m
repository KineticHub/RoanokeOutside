//
//  ChecklistViewController.m
//  RoanokeOutsideProject
//
//  Created by K Alnajar on 8/15/15.
//
//

#import "ItemListViewController.h"
#import "ListItem.h"
#import "AddItemViewController.h"
#import "UIHelper.h"

@interface ItemListViewController ()

@property NSMutableArray *items;

@end

@implementation ItemListViewController

- (void)loadInitialData {
    NSArray *RECOMMENDED_GEAR = @[@"flashlight", @"water", @"sunscreen", @"car keys", @"first aid kit", @"snacks", @"compass", @"rain jacket", @"trash bag", @"weather ready clothing"];
    self.items = [[NSMutableArray alloc] init];
    
    for (NSString *name in RECOMMENDED_GEAR) {
        ListItem *newItem = [[ListItem alloc] init];
        newItem.name = name;
        newItem.checked = [NSNumber numberWithBool:FALSE];
        NSLog(@"%@", newItem.name);
        [self.items addObject:newItem];
    }
    
    NSLog(@"For loop complete");
    NSLog(@"%@", self.items);
    [self saveListItems];
    [self reloadItems];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"Checklist";
    
    [self.view setBackgroundColor:[UIHelper getAppBackgroundColor]];
    
    self.tableView.allowsMultipleSelectionDuringEditing = NO;
    self.items = [[NSMutableArray alloc] init];
    
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                                                target:self action:@selector(transitionAddListItem)];
    self.navigationItem.rightBarButtonItem = addButton;
    [self reloadItems];
}

- (void) viewDidAppear:(BOOL)animated {
    [self reloadItems];
    [self.tableView reloadData];
}

- (void) reloadItems {
    [self.items removeAllObjects];
    NSMutableArray *savedItems = [[[NSUserDefaults standardUserDefaults] arrayForKey:@"ListItems"] mutableCopy];
    if ([savedItems count] == 0) {
        [self loadInitialData];
    } else {
        for (NSArray *itemInfo in savedItems) {
            ListItem *item = [[ListItem alloc] init];
            item.name = itemInfo[0];
            item.checked = itemInfo[1];
            [self.items addObject:item];
        }
    }
}

- (void) transitionAddListItem {
    AddItemViewController *addItemViewController = [[AddItemViewController alloc] init];
    [self.navigationController pushViewController:addItemViewController animated:YES];
}

- (void) saveListItems {
    NSMutableArray *saveArray = [[NSMutableArray alloc] init];
    for (ListItem *item in self.items) {
        NSLog(@"item: %@ %@", item.name, item.checked);
        [saveArray addObject:@[item.name, item.checked]];
    }
    [[NSUserDefaults standardUserDefaults] setObject:[NSArray arrayWithArray:saveArray] forKey:@"ListItems"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.items count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ListPrototypeCell"];
    
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ListPrototypeCell"];
        [cell setBackgroundColor:[UIColor clearColor]];
        cell.textLabel.textColor = [UIColor blackColor];
        //        cell.textLabel.font = [UIFont boldFlatFontOfSize:24];
        cell.detailTextLabel.textColor = [UIColor blackColor];
        [cell setAccessoryType:UITableViewCellAccessoryNone];
    }
    
    ListItem *item = [self.items objectAtIndex:indexPath.row];
    cell.textLabel.text = item.name;
    if ([item.checked boolValue]) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    } else {
        [cell setAccessoryType:UITableViewCellAccessoryNone];
    }
    return cell;
}

- (NSArray *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewRowAction *deleteAction = [UITableViewRowAction
                                          rowActionWithStyle:UITableViewRowActionStyleDefault
                                          title:@"Delete"
                                          handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {
                                              [self deleteItemForIndexPath:indexPath fromTableView:tableView];
                                          }];
    deleteAction.backgroundColor = [UIColor redColor];
    return @[deleteAction];
}

- (void)deleteItemForIndexPath:(NSIndexPath *)indexPath fromTableView:(UITableView *)tableView  {
    [self.items removeObjectAtIndex:indexPath.row];
    [self saveListItems];
    [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        NSLog(@"allow deleting");
    }
}

#pragma mark - Table View Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    ListItem *tappedItem = [self.items objectAtIndex:indexPath.row];
    tappedItem.checked = [NSNumber numberWithBool:![tappedItem.checked boolValue]];
    [self.items replaceObjectAtIndex:indexPath.row withObject:tappedItem];
    [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
    [self saveListItems];
}

@end
