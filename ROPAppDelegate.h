//
//  ROPAppDelegate.h
//  RoanokeOutsideProject
//
//  Created by K Alnajar on 8/13/15.
//
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

#import "UIHelper.h"
#import "MainMenuViewController.h"

@interface ROPAppDelegate : UIResponder <UIApplicationDelegate, UINavigationControllerDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong) UINavigationController *rootNavigationController;
@property (strong, nonatomic) MainMenuViewController* mainMenuViewController;

@end
