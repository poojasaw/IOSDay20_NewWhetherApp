//
//  WhetherViewController.m
//  IOSDay20_WhetherApp
//
//  Created by Student P_10 on 15/06/18.
//  Copyright © 2018 Felix. All rights reserved.
//

#import "WhetherViewController.h"

@interface WhetherViewController ()

@end

@implementation WhetherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSString *str=[NSString stringWithFormat:@"http://api.openweathermap.org/data/2.5/weather?lat=%f&lon=%f&appid=afe2f9a21f8509bd4f62a273fa49bedb",self.lati,self.longi];
NSLog(@"url=%@", str);
NSURL *url=[NSURL URLWithString:str];
NSURLSession *session=[NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
NSURLSessionTask *dataTask=[session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
if(response)
{
NSHTTPURLResponse *myResponse=(NSHTTPURLResponse *)response;
if(myResponse.statusCode==200)
{
NSLog(@"Response Found");
    if(data)
    {
NSArray *outerDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
                    
NSArray *weatherArr = [outerDictionary valueForKey:@"weather"];
NSDictionary *wDic=[weatherArr lastObject];
self.Descript = [wDic valueForKey:@"description"];
NSLog(@"\nDescription = %@", self.Descript);
                    
NSDictionary *mainDic = [outerDictionary valueForKey:@"main"];
self.Temp= [[mainDic valueForKey:@"temp"] floatValue];
NSLog(@"\nTemperature = %f", self.Temp);
self.Humid = [[mainDic valueForKey:@"humidity"] floatValue];
NSLog(@"\nHumidity = %f", self.Humid);
                    
self.Names = [outerDictionary valueForKey:@"name"];
NSLog(@"\nName = %@", self.Names);
                    
[self performSelectorOnMainThread:@selector(updateUI) withObject:nil waitUntilDone:NO];
                    
    }
    else
{
    NSLog(@"Data not found");
    }
    
}
  else
            {
                NSLog(@"response not found");
            }
        }
        
        
    }];
    [dataTask resume];
    
    
    
}

-(void)updateUI
{
    self.descriptionText.text=self.Descript;
    self.temperatureText.text= [NSString stringWithFormat:@"%f",self.Temp];
    self.humidityText.text=[NSString stringWithFormat:@"%f",self.Humid];;
    self.namesText.text=self.Names;
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
