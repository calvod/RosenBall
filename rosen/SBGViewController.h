//
//  SBGViewController.h
//  rosen
//
//  Created by Diego Calvo on 12/11/13.
//  Copyright (c) 2013 Diego Calvo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>

int Number;

@interface SBGViewController : UIViewController {
    
    IBOutlet UIButton *startbutton;
    NSTimer *randomMain;
    CGPoint posgiancarlo;
    CGPoint posnick;
    CGPoint posdanny;
    CGPoint posjake;
    CGPoint posblake;
    CGPoint posdiego;
    CGPoint poskevin;
    BOOL bossMode;
    IBOutlet UIImageView *player;
    IBOutlet UIImageView *enemy;
    IBOutlet UIImageView *nick;
    IBOutlet UIImageView *danny;
    IBOutlet UIImageView *jake;
    IBOutlet UIImageView *blake;
    IBOutlet UIImageView *diego;
    IBOutlet UIImageView *kevin;

    IBOutlet UIImageView *bossModeAlert;
    IBOutlet UILabel *seconds;
    NSTimer *timer;
}
-(IBAction)start;
-(void)countdown;


@end
