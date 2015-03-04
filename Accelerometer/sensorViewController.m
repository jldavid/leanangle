#import "sensorViewController.h"

@interface sensorViewController ()
@end

@implementation sensorViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.motionManager = [[CMMotionManager alloc] init];
    self.motionManager.accelerometerUpdateInterval = .1;
    self.motionManager.deviceMotionUpdateInterval = .1;
    
    [self.motionManager startAccelerometerUpdatesToQueue:[NSOperationQueue currentQueue]
    withHandler:^(CMAccelerometerData  *accelerometerData, NSError *error) {
        [self outputAccelerationData:accelerometerData.acceleration];
            if(error){
                NSLog(@"%@", error);
            }
     }];
    
    [self.motionManager startDeviceMotionUpdatesToQueue:[NSOperationQueue  currentQueue] withHandler:^ (CMDeviceMotion *devMotion, NSError *error) {
        CMAttitude *currentAttitude = devMotion.attitude;
        float roll = currentAttitude.roll*180/M_PI;
        float pitch = currentAttitude.pitch*180/M_PI;
        float yaw = currentAttitude.yaw*180/M_PI;

        self.roll.text = [NSString stringWithFormat:@"Roll: %f", roll];
        self.pitch.text = [NSString stringWithFormat:@"Pitch: %f", pitch];
        self.yaw.text = [NSString stringWithFormat:@"Yaw: %f", yaw];
    }];
    
    
    
}

-(void)outputAccelerationData:(CMAcceleration)acceleration
{
    self.labelX.text = [NSString stringWithFormat:@"%@%f", @"X: ", acceleration.x];
    self.labelY.text = [NSString stringWithFormat:@"%@%f", @"Y: ", acceleration.y];
    self.labelZ.text = [NSString stringWithFormat:@"%@%f", @"Z: ", acceleration.z];
    
    self.progressX.progress = ABS(acceleration.x);
    self.progressY.progress = ABS(acceleration.y);
    self.progressZ.progress = ABS(acceleration.z);
}

@end
