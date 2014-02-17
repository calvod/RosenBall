//
//  SBGViewController.m
//  rosen
//
//  Created by Diego Calvo on 12/11/13.
//  Copyright (c) 2013 Diego Calvo. All rights reserved.
//

#import "SBGViewController.h"

@interface SBGViewController ()

@end

@implementation SBGViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    //speeds of the enemies
    posgiancarlo = CGPointMake(13.5, 14.0);
    posnick = CGPointMake(12.0, 12.5);
    posdanny = CGPointMake(10.5, 11.0);
    posgiancarlo = CGPointMake(9.0, 9.5);
    posnick = CGPointMake(7.5, 8.0);
    posdanny = CGPointMake(6.0, 6.5);
    posjake = CGPointMake(4.5, 5.0);
    posblake = CGPointMake(3.0, 3.5);
    posdiego = CGPointMake(1.5, 2.0);
    poskevin = CGPointMake(4.0, 4.5);
    [kevin setHidden:YES];
    bossModeAlert = NO;
    
    
}

-(void)countdown {
    Number = Number + 1;
    seconds.text = [NSString stringWithFormat:@"%i", Number];
}


-(IBAction)start {
    [startbutton setHidden:YES];
    [nick setHidden:YES];
    [danny setHidden:YES];
    [jake setHidden:YES];
    [blake setHidden:YES];
    [diego setHidden:YES];
    [kevin setHidden:YES];
    [enemy setHidden:NO];
    bossMode = NO;
    
    //these two lines are for the
    //score timer
    Number = 0;
    seconds.text = [NSString stringWithFormat:@"%i", Number];
    
    randomMain = [NSTimer scheduledTimerWithTimeInterval:(0.03) target:self selector:@selector(onTimer) userInfo:nil repeats:YES];
    
    timer = [NSTimer scheduledTimerWithTimeInterval:0.50 target:self selector:@selector(countdown) userInfo:nil repeats:YES];
    
    
    //this is for the sound effect at the beginning
    CFBundleRef mainBundle = CFBundleGetMainBundle();
    CFURLRef soundfileURLRef;
    soundfileURLRef =CFBundleCopyResourceURL (mainBundle, (CFStringRef) @"matt", CFSTR ("m4a"), NULL);
    UInt32 SoundID;
    AudioServicesCreateSystemSoundID(soundfileURLRef, &SoundID);
    AudioServicesPlaySystemSound(SoundID);
                  
}

-(void)onTimer {
    [self checkCollision];
    if (!bossMode) {
    enemy.center = CGPointMake(enemy.center.x+posgiancarlo.x, enemy.center.y+posgiancarlo.y);
    if (enemy.center.x > 300 || enemy.center.x < 18)
        posgiancarlo.x = -posgiancarlo.x;
    if (enemy.center.y > 480 || enemy.center.y < 16)
        posgiancarlo.y = -posgiancarlo.y;
    }
    if (Number >= 10 && !bossMode) {
        [nick setHidden:NO];
        //posgiancarlo = CGPointMake(12.7, 13.2);
        nick.center = CGPointMake(nick.center.x+posnick.x, nick.center.y+posnick.y);
        if (nick.center.x > 300 || nick.center.x < 18)
            posnick.x = -posnick.x;
        if (nick.center.y > 480 || nick.center.y < 16)
            posnick.y = -posnick.y;
    }
    
    if (Number >= 20 && !bossMode) {
        [danny setHidden:NO];
        //posgiancarlo = CGPointMake(11.9, 12.4);
        danny.center = CGPointMake(danny.center.x+posdanny.x, danny.center.y+posdanny.y);
        if (danny.center.x > 300 || danny.center.x < 18)
            posdanny.x = -posdanny.x;
        if (danny.center.y > 480 || danny.center.y < 16)
            posdanny.y = -posdanny.y;
    }
    
    if (Number >= 30 && !bossMode) {
        [jake setHidden:NO];
        //posgiancarlo = CGPointMake(11.1, 11.6);
        jake.center = CGPointMake(jake.center.x+posjake.x, jake.center.y+posjake.y);
        if (jake.center.x > 300 || jake.center.x < 18)
            posjake.x = -posjake.x;
        if (jake.center.y > 480 || jake.center.y < 16)
            posjake.y = -posjake.y;
    }
    
    if (Number >= 40 && !bossMode) {
        [blake setHidden:NO];
        //posgiancarlo = CGPointMake(10.3, 10.8);
        blake.center = CGPointMake(blake.center.x+posblake.x, blake.center.y+posblake.y);
        if (blake.center.x > 300 || blake.center.x < 18)
            posblake.x = -posblake.x;
        if (blake.center.y > 480 || blake.center.y < 16)
            posblake.y = -posblake.y;
    }
    
    if (Number >= 75 && !bossMode) {
        [diego setHidden:NO];
        //posgiancarlo = CGPointMake(9.5, 10);
        diego.center = CGPointMake(diego.center.x+posdiego.x, diego.center.y+posdiego.y);
        if (diego.center.x > 300 || diego.center.x < 18)
            posdiego.x = -posdiego.x;
        if (diego.center.y > 480 || diego.center.y < 16)
            posdiego.y = -posdiego.y;
    }
    
    if (Number >= 90) {
        bossMode = YES;
        [kevin setHidden:NO];
        [blake setHidden:YES];
        [jake setHidden:YES];
        [diego setHidden:YES];
        [enemy setHidden:YES];
        [danny setHidden:YES];
        [nick setHidden:YES];
        [bossModeAlert setHidden:NO];
        kevin.center = CGPointMake(kevin.center.x+poskevin.x, kevin.center.y+poskevin.y);
        if (kevin.center.x > 200 || kevin.center.x < 18)
            poskevin.x = -poskevin.x;
        if (kevin.center.y > 400 || kevin.center.y < 18)
            poskevin.y = -poskevin.y;
        
        
    }
}

-(void)checkCollision {
    if(CGRectIntersectsRect(player.frame, enemy.frame) || (CGRectIntersectsRect(player.frame, nick.frame) && (nick.hidden == NO)) || (CGRectIntersectsRect(player.frame, danny.frame) && (danny.hidden == NO)) || (CGRectIntersectsRect(player.frame, jake.frame) && (jake.hidden == NO)) || (CGRectIntersectsRect(player.frame, blake.frame) && (blake.hidden == NO)) || (CGRectIntersectsRect(player.frame, diego.frame) && (diego.hidden == NO)) || (CGRectIntersectsRect(player.frame, kevin.frame) && (kevin.hidden == NO)))
    {
        [randomMain invalidate];
        [timer invalidate];             //this one is for the score timer
       
        
        
        CGRect frame = [player frame];
        frame.origin.x = 137.0f;
        frame.origin.y = 326.0;
        [player setFrame:frame];
        
        CGRect frame2 = [enemy frame];
        frame2.origin.x = 137.0f;
        frame2.origin.y = 20.0;
        [enemy setFrame:frame2];
        
        CGRect frame3 = [nick frame];
        frame3.origin.x = 137.0f;
        frame3.origin.y = 20.0;
        [nick setFrame:frame3];
        [nick setHidden:YES];
        
        CGRect frame4 = [danny frame];
        frame4.origin.x = 137.0f;
        frame4.origin.y = 20.0;
        [danny setFrame:frame4];
        [danny setHidden:YES];
        
        CGRect frame5 = [jake frame];
        frame5.origin.x = 137.0f;
        frame5.origin.y = 20.0;
        [jake setFrame:frame5];
        [jake setHidden:YES];
        
        CGRect frame6 = [blake frame];
        frame6.origin.x = 137.0f;
        frame6.origin.y = 20.0;
        [blake setFrame:frame6];
        [blake setHidden:YES];
        
        CGRect frame7 = [diego frame];
        frame7.origin.x = 137.0f;
        frame7.origin.y = 20.0;
        [diego setFrame:frame7];
        [diego setHidden:YES];
        
        CGRect frame8 = [kevin frame];
        frame8.origin.x = 137.0f;
        frame8.origin.y = 20.0;
        [kevin setFrame:frame8];
        [kevin setHidden:YES];
        
        
        
        if (Number < 10) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"wut..." message:[NSString stringWithFormat:@"Your Score: %i", Number] delegate:nil cancelButtonTitle:@"Let's go to Tomuken" otherButtonTitles:nil];
        [alert show];
        //[alert release];
        } else if (Number < 25) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"no no no no NOOO!" message:[NSString stringWithFormat:@"Your Score: %i", Number] delegate:nil cancelButtonTitle:@"San Francisco is the best town ever" otherButtonTitles:nil];
            [alert show];
        } else if (Number < 40) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Pretty good that time" message:[NSString stringWithFormat:@"Your Score: %i", Number] delegate:nil cancelButtonTitle:@"Let's play Feef" otherButtonTitles:nil];
        [alert show];
        } else if (Number < 55) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Meh" message:[NSString stringWithFormat:@"Your Score: %i", Number] delegate:nil cancelButtonTitle:@"Click here to go home alone" otherButtonTitles:nil];
            [alert show];
        } else if (Number < 65) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"I'm takin you to Sava's for that one" message:[NSString stringWithFormat:@"Your Score: %i", Number] delegate:nil cancelButtonTitle:@"Click here to score" otherButtonTitles:nil];
            [alert show];
        }
        [startbutton setHidden:NO];
    }
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *myTouch = [[event allTouches] anyObject];
    player.center = [myTouch locationInView:self.view];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    
}

-(void)dealloc {
    //[super dealloc];
}
@end
