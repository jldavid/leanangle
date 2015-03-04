//
//  sensorViewController.h
//  Accelerometer
//
//  Created by Jean-Luc David on 2/14/2014.
//  Copyright (c) 2014 Jean-Luc David. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreMotion/CoreMotion.h>
#import <AVFoundation/AVFoundation.h>

@interface sensorViewController : UIViewController

@property (nonatomic, retain) IBOutlet UILabel *labelX;
@property (nonatomic, retain) IBOutlet UILabel *labelY;
@property (nonatomic, retain) IBOutlet UILabel *labelZ;

@property (nonatomic, retain) IBOutlet UIProgressView *progressX;
@property (nonatomic, retain) IBOutlet UIProgressView *progressY;
@property (nonatomic, retain) IBOutlet UIProgressView *progressZ;

@property (strong, nonatomic) CMMotionManager *motionManager;

@property (strong, nonatomic) IBOutlet UILabel *pitch;
@property (strong, nonatomic) IBOutlet UILabel *yaw;
@property (strong, nonatomic) IBOutlet UILabel *roll;

@end
