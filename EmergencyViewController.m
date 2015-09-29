//
//  EmergencyViewController.m
//  RoanokeOutsideProject
//
//  Created by K Alnajar on 8/14/15.
//
//

#import "EmergencyViewController.h"

#import "UIColor+FlatUI.h"
#import "UIHelper.h"
#import <UIAlertView+Blocks.h>

@interface EmergencyViewController ()

@property (strong, nonatomic) UILabel *latitudeLabel;
@property (strong, nonatomic) UILabel *longitudeLabel;

@end

@implementation EmergencyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"Emergency Contact";
    
    [self.view setBackgroundColor:[UIHelper getAppBackgroundColor]];
    [self setupButtonLayout];
}

- (void)setupButtonLayout {
    CGFloat y = self.navigationController.navigationBar.frame.size.height + 40.0;
    CGFloat spacer = 10.0;
    CGFloat edgeInset = 10.0;
    CGFloat fieldWidth = self.view.frame.size.width - edgeInset * 2;
    CGFloat fieldHeight = 40.0;
    
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    
    if ([self.locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)])
    {
        [self.locationManager requestWhenInUseAuthorization];
    }
    
    [self.locationManager startUpdatingLocation];
    
    self.latitudeLabel = [[UILabel alloc] initWithFrame:CGRectMake(edgeInset, y, fieldWidth, fieldHeight + 5.0)];
    self.latitudeLabel.text = @"Latitude: getting coordinates...";
    [self.view addSubview:self.latitudeLabel];
    
    y += self.latitudeLabel.frame.size.height;
    
    self.longitudeLabel = [[UILabel alloc] initWithFrame:CGRectMake(edgeInset, y, fieldWidth, fieldHeight + 5.0)];
    self.longitudeLabel.text = @"Longitude: getting coordinates...";
    [self.view addSubview:self.longitudeLabel];
    
    y += self.longitudeLabel.frame.size.height + spacer;
    
    
    
    UIButton *emergencyCallButton = [UIHelper createFlatButtonWithRect:CGRectMake(edgeInset, y, fieldWidth, fieldHeight + 5.0)
                                                              andTitle:@"Call 911" andBackgroundColor:[UIColor alizarinColor] andTextColor:[UIColor whiteColor]];
    [emergencyCallButton addTarget:self action:@selector(confirmCallAlert) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:emergencyCallButton];
    
    y += emergencyCallButton.frame.size.height + spacer;
}

- (void)confirmCallAlert {
    [UIAlertView showWithTitle:@"Call 911" message:@"Are you sure you want to call 911?" cancelButtonTitle:@"Cancel" otherButtonTitles:@[@"Call"]
                      tapBlock:^(UIAlertView *alertView, NSInteger buttonIndex) {
                                if (buttonIndex == [alertView cancelButtonIndex]) {
                                    NSLog(@"Cancelled");
                                } else if ([[alertView buttonTitleAtIndex:buttonIndex] isEqualToString:@"Call"]) {
                                    NSLog(@"Calling 911");
                                    [self placeEmergencyCall];
                                }
    }];
}

- (void)placeEmergencyCall {
    UIDevice *device = [UIDevice currentDevice];
    if ([[device model] isEqualToString:@"iPhone"] ) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel:5402729204"]]];
    } else {
        UIAlertView *Notpermitted=[[UIAlertView alloc] initWithTitle:@"Alert" message:@"Your device does not support calling." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [Notpermitted show];
    }
}

# pragma mark - Location Manager Delegate Methods
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    NSLog(@"%@", [locations lastObject]);
    CLLocation *currentLocation = [locations lastObject];
    self.latitudeLabel.text = [NSString stringWithFormat:@"Latitude: %f", currentLocation.coordinate.latitude];
    self.longitudeLabel.text = [NSString stringWithFormat:@"Longitude: %f", currentLocation.coordinate.longitude];
    [self.locationManager stopUpdatingLocation];
}

@end
