//
//  WhetherViewController.h
//  IOSDay20_WhetherApp
//
//  Created by Student P_10 on 15/06/18.
//  Copyright © 2018 Felix. All rights reserved.
//

#import "ViewController.h"

@interface WhetherViewController : UIViewController
@property float lati;
@property float longi;
@property NSMutableData *myData;
@property (strong, nonatomic) IBOutlet UILabel *humidityLabel;
@property (strong, nonatomic) IBOutlet UILabel *descriptionsLabel;
@property (strong, nonatomic) IBOutlet UILabel *namesLabel;

@property (strong, nonatomic) IBOutlet UILabel *temperatureLabel;


@property float Temp;
@property NSString *Descript;
@property float Humid;
@property NSString *Names;

@property (strong, nonatomic) IBOutlet UITextField *humidityText;
@property (strong, nonatomic) IBOutlet UITextField *descriptionText;
@property (strong, nonatomic) IBOutlet UITextField *namesText;
@property (strong, nonatomic) IBOutlet UITextField *temperatureText;

@end
