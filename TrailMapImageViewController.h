//
//  TrailMapViewController.h
//  RoanokeOutsideProject
//
//  Created by K Alnajar on 8/13/15.
//
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import "NAMapViewDelegate.h"

@interface TrailMapImageViewController : UIViewController <NAMapViewDelegate, CLLocationManagerDelegate>

@property (nonatomic, retain) CLLocationManager *locationManager;

@end
