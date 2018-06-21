//
//  ViewController.m
//  IOSDay20_WhetherApp
//
//  Created by Student P_10 on 18/05/18.
//  Copyright © 2018 Felix. All rights reserved.
//

#import "ViewController.h"
#import "WhetherViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.searchText.delegate=self;
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(bool)textFieldShouldReturn:(UITextField *)textField
{
    static MKPlacemark *oldPlace;
    NSString *location=self.searchText.text;
    CLGeocoder *geocoder=[[CLGeocoder alloc]init];
    [geocoder geocodeAddressString:location completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error)
     {
         if (placemarks && placemarks.count>0)
         {
             if(oldPlace !=nil)
             {
                 [self.whetherAppView removeAnnotation:oldPlace];
             }
             CLPlacemark *topResults=[placemarks objectAtIndex:0];
             MKPlacemark *placemark=[[MKPlacemark alloc]initWithPlacemark:topResults];
        MKCoordinateRegion region=self.whetherAppView.region;
             region.center=placemark.region.center;
             region.span.longitudeDelta=1;
             region.span.latitudeDelta=1;
             NSLog(@"\n Latitude = %f \nLongitude = %f",region.center.latitude, region.center.longitude);
             

             
             self.latitude=region.center.latitude;
             self.longitude=region.center.longitude;
             
             
             [self.whetherAppView setRegion:region animated:YES];
             [self.whetherAppView addAnnotation:placemark];
             oldPlace=placemark;
             
         }
     }
     ];
    [textField resignFirstResponder];
    return YES;
    
}
- (IBAction)getWheterButton:(UIButton *)sender
{
     WhetherViewController *wvc=[self.storyboard instantiateViewControllerWithIdentifier:@"WhetherViewController"];
    wvc.lati=self.latitude;
    wvc.longi=self.longitude;
    
    [self.navigationController pushViewController:wvc animated:YES];

}
@end 
