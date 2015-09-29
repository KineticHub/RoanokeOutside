////
////  TrailMapViewController.m
////  RoanokeOutsideProject
////
////  Created by K Alnajar on 8/15/15.
////
////
//
//#import "TrailMapViewController.h"
//
//#import "RMOpenAerialMapSource.h"
//#import "RMOpenStreetMapSource.h"
//#import "RMMapContents.h"
//#import "RMMapView.h"
//#import "RMMarkerManager.h"
//#import "RMMarker.h"
//#import "RMMercatorToScreenProjection.h"
//#import "RMProjection.h"
//
//@interface TrailMapViewController ()
//
//@synthesize mapView;
//@synthesize infoTextView;
//@synthesize mapSrc;
//
//@end
//
//@implementation TrailMapViewController
//
//- (void)addMarkers
//{
//    CLLocationCoordinate2D markerPosition;
//#define kNumberRows 1
//#define kNumberColumns 9
//#define kSpacing 2.0
//    
//    UIImage *redMarkerImage = [UIImage imageNamed:@"marker-red.png"];
//    UIImage *blueMarkerImage = [UIImage imageNamed:@"marker-blue.png"];
//    UIImage *xMarkerImage = [UIImage imageNamed:@"marker-X.png"];
//    NSLog(@"%@", xMarkerImage);
//    markerPosition.latitude = mapSrc.centerOfCoverage.latitude; // - ((kNumberRows - 1)/2.0 * kSpacing);
//    int i, j;
//    for (i = 0; i < kNumberRows; i++) {
//        markerPosition.longitude = mapSrc.centerOfCoverage.longitude;// - ((kNumberColumns - 1)/2.0 * kSpacing);
//        for (j = 0; j < kNumberColumns; j++) {
//            //			markerPosition.longitude += kSpacing;
//            NSLog(@"%f %f", markerPosition.latitude, markerPosition.longitude);
//            RMMarker *newMarker;
//            //			if ((markerPosition.longitude < -80) ||
//            //				(markerPosition.longitude > -81))
//            //				newMarker = [[RMMarker alloc] initWithUIImage:redMarkerImage anchorPoint:CGPointMake(0.5, 1.0)];
//            //			else
//            newMarker = [[RMMarker alloc] initWithUIImage:blueMarkerImage anchorPoint:CGPointMake(0.5, 1.0)];
//            [self.mapView.contents.markerManager addMarker:newMarker
//                                                 AtLatLong:markerPosition];
//            [newMarker changeLabelUsingText:[NSString stringWithFormat:@"%4.1f", markerPosition.longitude]];
//            [newMarker release];
//            RMMarker *xMarker = [[RMMarker alloc] initWithUIImage:xMarkerImage anchorPoint:CGPointMake(0.5, 0.5)];
//            [self.mapView.contents.markerManager addMarker:xMarker AtLatLong:markerPosition];
//            [xMarker release];
//        }
//        markerPosition.latitude += kSpacing;
//    }
//}
//
//// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
//- (void)viewDidLoad {
//    [super viewDidLoad];
//    [mapView setDelegate:self];
//    id myTilesource = [[[RMOpenStreetMapSource alloc] init] autorelease];
//    
//    //	// have to initialize the RMMapContents object explicitly if we want it to use a particular tilesource
//    //	[[[RMMapContents alloc] initWithView:mapView
//    //							  tilesource:myTilesource] autorelease];
//    // Use the bundled database as our map source
//    mapSrc = [[[RMDBMapSource alloc] initWithPath:@"dragon_tooth_map.sqlite"] autorelease];
//    [[[RMMapContents alloc] initWithView:mapView tilesource:mapSrc] autorelease];
//    
//    // Constrain our map so the user can only browse through our exported map tiles
//    [mapView setConstraintsSW:CLLocationCoordinate2DMake(mapSrc.bottomRightOfCoverage.latitude, mapSrc.topLeftOfCoverage.longitude)
//                           NE:CLLocationCoordinate2DMake(mapSrc.topLeftOfCoverage.latitude, mapSrc.bottomRightOfCoverage.longitude)];
//    // Move to the center of our exported map
//    [mapView moveToLatLong:mapSrc.centerOfCoverage];
//    
//    center.latitude = 66.44;
//    center.longitude = -179.0;
//    
//    //	[mapView moveToLatLong:center];
//    [mapView.contents setZoom:14.4];
//    [[mapView contents] moveBy:CGSizeMake(-5.0, 0.0)];
//    [self updateInfo];
//    [self performSelector:@selector(addMarkers) withObject:nil afterDelay:0.1];
//}
//
//
///*
// // Override to allow orientations other than the default portrait orientation.
// - (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
// // Return YES for supported orientations
// return (interfaceOrientation == UIInterfaceOrientationPortrait);
// }
// */
//
//
//- (void)didReceiveMemoryWarning {
//    RMLog(@"didReceiveMemoryWarning %@", self);
//    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
//    // Release anything that's not essential, such as cached data
//}
//
//- (void)viewDidAppear:(BOOL)animated {
//    [self updateInfo];
//}
//
//- (void)dealloc {
//    LogMethod();
//    self.infoTextView = nil;
//    self.mapView = nil;
//    [super dealloc];
//}
//
//- (void)updateInfo {
//    RMMapContents *contents = self.mapView.contents;
//    CLLocationCoordinate2D mapCenter = [contents mapCenter];
//    
//    [infoTextView setText:[NSString stringWithFormat:@"Latitude : %f\nLongitude : %f\nZoom level : %.2f\n%@",
//                           mapCenter.latitude,
//                           mapCenter.longitude,
//                           contents.zoom,
//                           [[contents tileSource] shortAttribution]
//                           ]];
//}
//
//
//#pragma mark -
//#pragma mark Delegate methods
//
//- (void) afterMapMove: (RMMapView*) map {
//    [self updateInfo];
//}
//
//- (void) afterMapZoom: (RMMapView*) map byFactor: (float) zoomFactor near:(CGPoint) center {
//    [self updateInfo];
//}
//
//@end
