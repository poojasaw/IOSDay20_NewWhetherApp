//
//  ViewController.h
//  IOSDay20_WhetherApp
//
//  Created by Student P_10 on 18/05/18.
//  Copyright © 2018 Felix. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "WhetherViewController.h"
//afe2f9a21f8509bd4f62a273fa49bedb
//http://samples.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=b6907d289e10d714a6e88b30761fae22
@interface ViewController : UIViewController<UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet MKMapView *whetherAppView;
@property (strong, nonatomic) IBOutlet UITextField *searchText;
@property float latitude;
@property float longitude;


- (IBAction)getWheterButton:(UIButton *)sender;

@end

