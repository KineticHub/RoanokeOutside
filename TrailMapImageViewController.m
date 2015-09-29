//
//  TrailMapViewController.m
//  RoanokeOutsideProject
//
//  Created by K Alnajar on 8/13/15.
//
//

#import "TrailMapImageViewController.h"
#import "UIHelper.h"
#import "NAMapView.h"
#import "NAPinAnnotationMapView.h"
#import "NAPinAnnotation.h"
#import "NADotAnnotation.h"

@interface TrailMapImageViewController ()

@property (nonatomic, retain) NAMapView *mapView;
@property (nonatomic, retain) NADotAnnotation *userLocationAnnotation;

@end

@implementation TrailMapImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"Trail Map";
    [self.view setBackgroundColor:[UIHelper getAppBackgroundColor]];
    
    self.mapView = [[NAMapView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height - 100.0)];
    
    self.mapView.mapViewDelegate = self;
    self.mapView.backgroundColor  = [UIColor colorWithRed:0.000f green:0.475f blue:0.761f alpha:1.000f];
    self.mapView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    self.mapView.minimumZoomScale = 1.0;
    self.mapView.maximumZoomScale = 3.0f;
    
    [self.mapView displayMap:[UIImage imageNamed:@"DragonToothTrail Large.png"]];
    [self.mapView centerOnPoint:CGPointMake(300, 320) animated:NO];
    
    [self.view addSubview:self.mapView];
    
//    NAPinAnnotation *melbourne = [NAPinAnnotation annotationWithPoint:CGPointMake(100.0f, 100.0f)];
//    melbourne.title = @"Test Pin";
////    melbourne.subtitle = @"This is a test pin!";
//    melbourne.color = NAPinColorGreen;
//    [mapView addAnnotation:melbourne animated:NO];
    [self setupLocationServices];
}

- (void)viewWillDisappear:(BOOL)animated {
    [self.locationManager stopUpdatingLocation];
    [super viewWillDisappear:animated];
}

- (void)mapView:(NAMapView *)mapView tappedOnAnnotation:(NADotAnnotation *)annotation
{
    NSLog(@"tapped: %@", annotation);
}

- (void)mapView:(NAMapView *)mapView hasChangedZoomLevel:(CGFloat)level
{
    NSLog(@"zoom: %@", @(level));
}

- (void) setupLocationServices {
    
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    
    if ([self.locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)])
    {
        [self.locationManager requestWhenInUseAuthorization];
    }
    
    [self.locationManager startUpdatingLocation];
}

# pragma mark - Location Manager Delegate Methods
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    NSLog(@"%@", [locations lastObject]);
    CLLocation *currentLocation = [locations lastObject];
    self.userLocationAnnotation = [NADotAnnotation annotationWithPoint:CGPointMake(currentLocation.coordinate.latitude, currentLocation.coordinate.longitude)];
    self.userLocationAnnotation.radius = 5.0f;
    self.userLocationAnnotation.color = [UIColor blackColor];
    [self.mapView addAnnotation:self.userLocationAnnotation animated:YES];
}

@end
