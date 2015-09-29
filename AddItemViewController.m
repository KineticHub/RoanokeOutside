//
//  AddItemViewController.m
//  RoanokeOutsideProject
//
//  Created by K Alnajar on 8/15/15.
//
//

#import "AddItemViewController.h"
#import "ListItem.h"
#import "UIHelper.h"

@interface AddItemViewController ()

@property (strong, nonatomic) UITextField *nameTextField;
@property (strong, nonatomic) UIBarButtonItem *saveButton;

@end

@implementation AddItemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"Add Item";
    
    [self.view setBackgroundColor:[UIHelper getAppBackgroundColor]];
    
    self.nameTextField = [[UITextField alloc] initWithFrame:CGRectMake(20.0, self.view.frame.size.width/2, self.view.frame.size.width - 40.0, 40.0)];
    self.nameTextField.borderStyle = UITextBorderStyleRoundedRect;
    self.nameTextField.font = [UIFont systemFontOfSize:15];
    self.nameTextField.placeholder = @"enter text";
    self.nameTextField.autocorrectionType = UITextAutocorrectionTypeNo;
    self.nameTextField.keyboardType = UIKeyboardTypeDefault;
    self.nameTextField.returnKeyType = UIReturnKeyDone;
    self.nameTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.nameTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [self.view addSubview:self.nameTextField];
    
    [self.nameTextField becomeFirstResponder];
    
    UIButton *saveItem = [UIHelper createFlatButtonWithRect:CGRectMake(20.0, self.view.frame.size.width/2 + 60.0, self.view.frame.size.width - 40.0, 40.0) andTitle:@"Save Item"];
    [saveItem addTarget:self action:@selector(saveToDoItem) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:saveItem];
}

- (void)saveToDoItem {
    NSMutableArray *savedItems = [[[NSUserDefaults standardUserDefaults] arrayForKey:@"ListItems"] mutableCopy];
    [savedItems addObject:@[self.nameTextField.text, [NSNumber numberWithBool:FALSE]]];
    [[NSUserDefaults standardUserDefaults] setObject:[NSArray arrayWithArray:savedItems] forKey:@"ListItems"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [self.navigationController popViewControllerAnimated:YES];
}

@end
