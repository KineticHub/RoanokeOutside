//
//  EmergencyViewController.h
//  RoanokeOutsideProject
//
//  Created by K Alnajar on 8/14/15.
//
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface EmergencyViewController : UIViewController <CLLocationManagerDelegate>

@property (nonatomic, retain) CLLocationManager *locationManager;

@end
