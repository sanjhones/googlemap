//
//  ViewController.m
//  Google_Maps
//
//  Created by murugan on 10/01/17.
//  Copyright © 2017 murugan. All rights reserved.
//

#import "ViewController.h"
#import <GoogleMaps/GoogleMaps.h>

@interface ViewController ()<GMSMapViewDelegate>

@end

@implementation ViewController
NSMutableArray *array;
GMSMarker *marker;
GMSMapView *mapView;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:12.982902
                                                            longitude:80.266363
                                                                 zoom:15];
    mapView = [GMSMapView mapWithFrame:CGRectZero camera:camera];
    mapView.delegate=self;
    mapView.myLocationEnabled = YES;
    self.view = mapView;
    array = [NSMutableArray arrayWithObjects:@"13.055002,80.236216",@"12.982902,80.266363",@"13.0019082,80.23326569999995",@"12.924382,80.11939159999997", nil];
    marker = [[GMSMarker alloc] init];
    [self Add_Allpins];
}
- (void)mapView:(GMSMapView *)mapView willMove:(BOOL)gesture
{
    
}
- (void) mapView:(GMSMapView *)mapView didLongPressAtCoordinate:(CLLocationCoordinate2D)coordinate
{
    
}
- (void) mapView:(GMSMapView *)mapView didTapOverlay:(GMSOverlay *)overlay
{
    
}
- (void)mapView:(GMSMapView *)mapView didChangeCameraPosition:(GMSCameraPosition *)position
{
    double latitude = mapView.camera.target.latitude;
    double longitude = mapView.camera.target.longitude;
    CLLocationCoordinate2D center = CLLocationCoordinate2DMake(latitude, longitude);
    marker.position = center;
    marker.icon=[UIImage imageNamed:@"taxi.png"];
    
}
-(void)Add_Allpins
{
    NSMutableArray *arrCoordinateStr = [[NSMutableArray alloc] initWithCapacity:array.count];
    for(int i = 0; i < array.count; i++)
    {
        [arrCoordinateStr addObject:[array objectAtIndex:i]];
        [self addPinWithTitle:@"" AndCoordinate:arrCoordinateStr[i]];
    }
}
-(void)addPinWithTitle:(NSString *)title AndCoordinate:(NSString *)strCoordinate
{
    strCoordinate = [strCoordinate stringByReplacingOccurrencesOfString:@" " withString:@""];
    NSArray *components = [strCoordinate componentsSeparatedByString:@","];
    double latitude = [components[0] doubleValue];
    double longitude = [components[1] doubleValue];
    CLLocationCoordinate2D position = { latitude, longitude};
    GMSMarker *marker = [GMSMarker markerWithPosition:position];
    marker.title = @"name";
    marker.snippet = @"snippet";
    marker.icon=[UIImage imageNamed:@"taxi.png"];;
    marker.map = mapView;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//https://developers.google.com/maps/documentation/ios-sdk/reference/protocol_g_m_s_map_view_delegate-p#ac4fc9cd33d2d78b8f9a97f2d84ff38f5
//https://developers.google.com/maps/documentation/ios-sdk/marker
@end
