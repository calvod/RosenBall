//
//  SBGAppDelegate.h
//  rosen
//
//  Created by Diego Calvo on 12/11/13.
//  Copyright (c) 2013 Diego Calvo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface SBGAppDelegate : UIResponder <UIApplicationDelegate, AVAudioPlayerDelegate> {
    AVAudioPlayer *audioPlayer1;

}

@property (strong, nonatomic) UIWindow *window;

@end
