//
//  MainMenuViewController.m
//  RoanokeOutsideProject
//
//  Created by K Alnajar on 8/14/15.
//
//

#import <UIAlertView+Blocks.h>

#import "MainMenuViewController.h"
#import "TrailMapImageViewController.h"
#import "EmergencyViewController.h"
#import "ItemListViewController.h"
#import "SocialViewController.h"

#import "UIHelper.h"

#define TOO_LATE_TO_HIKE 5

@interface MainMenuViewController ()

@end

@implementation MainMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"Menu";
    
    [self.view setBackgroundColor:[UIHelper getAppBackgroundColor]];
    [self setupMenuButtonsLayout];
    [self setupNotificationOption];
}

- (void)setupNotificationOption {
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit fromDate:[NSDate date]];
    NSInteger currentHour = [components hour];
    
    NSLog(@"%ld", (long)currentHour);
    NSLog(@"%d", TOO_LATE_TO_HIKE + 12);
    
    if (currentHour < TOO_LATE_TO_HIKE + 12) {
        NSString *yesOption = @"Yes, alert me.";
        [UIAlertView showWithTitle:@"Night Alert"
                           message:@"Would you like to be notified when it starts getting late?"
                 cancelButtonTitle:@"No, I am prepared."
                 otherButtonTitles:@[yesOption]
                          tapBlock:^(UIAlertView *alertView, NSInteger buttonIndex) {
                              if (buttonIndex == [alertView cancelButtonIndex]) {
                                  NSLog(@"Cancelled");
                              } else if ([[alertView buttonTitleAtIndex:buttonIndex] isEqualToString:yesOption]) {
                                  NSLog(@"Notification requested");
                                  [self setupLocalPushNotification];
                              }
                          }];
    } else {
        [UIAlertView showWithTitle:@"Be Prepared"
                           message:@"If you are hiking at night, please be prepared with a flashlight and weather ready clothing."
                 cancelButtonTitle:@"Okay"
                 otherButtonTitles:nil
                          tapBlock:^(UIAlertView *alertView, NSInteger buttonIndex) {}];
    }
}

- (void)setupLocalPushNotification {
    
    NSString *warningMessage = @"The sun will be setting in about an hour, if you are not experienced or do not have a flashlight, please begin heading back.";
    
    NSDate *now = [NSDate date];
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *components = [calendar components:NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit fromDate:now];
    [components setHour:12 + TOO_LATE_TO_HIKE];
    NSDate *nextTime = [calendar dateFromComponents:components];
    
    UILocalNotification* localNotification = [[UILocalNotification alloc] init];
    localNotification.fireDate = nextTime;
    localNotification.alertBody = warningMessage;
    localNotification.timeZone = [NSTimeZone defaultTimeZone];
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
}

- (void)setupMenuButtonsLayout {
    CGFloat y = self.navigationController.navigationBar.frame.size.height + 40.0;
    CGFloat spacer = 10.0;
    CGFloat edgeInset = 10.0;
    CGFloat fieldWidth = self.view.frame.size.width - edgeInset * 2;
    CGFloat fieldHeight = 40.0;
    
    NSLog(@"%f", self.view.frame.size.width);
    NSLog(@"%f", fieldWidth);
    
    UIButton *mapButton = [UIHelper createFlatButtonWithRect:CGRectMake(edgeInset, y, fieldWidth, fieldHeight + 5.0)
                                                      andTitle:@"Map"];
    [mapButton addTarget:self action:@selector(transitionTrailMapView) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:mapButton];
    
    y += mapButton.frame.size.height + spacer;
    
    UIButton *emergencyButton = [UIHelper createFlatButtonWithRect:CGRectMake(edgeInset, y, fieldWidth, fieldHeight + 5.0)
                                                    andTitle:@"Emergency"];
    [emergencyButton addTarget:self action:@selector(transitionEmergencyView) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:emergencyButton];
    
    y += emergencyButton.frame.size.height + spacer;
    
    UIButton *gearButton = [UIHelper createFlatButtonWithRect:CGRectMake(edgeInset, y, fieldWidth, fieldHeight + 5.0)
                                                    andTitle:@"Gear"];
    [gearButton addTarget:self action:@selector(transitionChecklistView) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:gearButton];
    
    y += gearButton.frame.size.height + spacer;
    
    UIButton *socialButton = [UIHelper createFlatButtonWithRect:CGRectMake(edgeInset, y, fieldWidth, fieldHeight + 5.0)
                                                    andTitle:@"Social"];
    [socialButton addTarget:self action:@selector(transitionSocialView) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:socialButton];
    
    y += socialButton.frame.size.height + spacer;
    
    UIButton *nearbyButton = [UIHelper createFlatButtonWithRect:CGRectMake(edgeInset, y, fieldWidth, fieldHeight + 5.0)
                                                    andTitle:@"Nearby"];
    //    [nearbyButton addTarget:self action:@selector(userLogin) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:nearbyButton];
    
    y += nearbyButton.frame.size.height + spacer;
    
    UIButton *trailButton = [UIHelper createFlatButtonWithRect:CGRectMake(edgeInset, y, fieldWidth, fieldHeight + 5.0)
                                                    andTitle:@"Info"];
    //    [trailButton addTarget:self action:@selector(userLogin) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:trailButton];
    
    y += trailButton.frame.size.height + spacer;
}

- (void) transitionTrailMapView {
    TrailMapImageViewController *trailMapViewController = [[TrailMapImageViewController alloc] init];
    [self.navigationController pushViewController:trailMapViewController animated:YES];
}

- (void) transitionEmergencyView {
    EmergencyViewController *emergencyViewController = [[EmergencyViewController alloc] init];
    [self.navigationController pushViewController:emergencyViewController animated:YES];
}

- (void) transitionChecklistView {
    ItemListViewController *itemListViewController = [[ItemListViewController alloc] init];
    [self.navigationController pushViewController:itemListViewController animated:YES];
}

- (void) transitionSocialView {
    SocialViewController *socialViewController = [[SocialViewController alloc] init];
    [self.navigationController pushViewController:socialViewController animated:YES];
}

@end
