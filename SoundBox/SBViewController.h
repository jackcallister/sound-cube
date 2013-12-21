//
//  SBViewController.h
//  SoundBox
//
//  Created by Jack Callister on 14/12/13.
//  Copyright (c) 2013 Jack Callister. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface SBViewController : UIViewController <AVAudioPlayerDelegate>

@property (nonatomic, retain) AVAudioPlayer *player;

@property (nonatomic, retain) UIButton *chickenButton;
@property (nonatomic, retain) UIButton *applauseButton;
@property (nonatomic, retain) UIButton *screamButton;
@property (nonatomic, retain) UIButton *droidButton;
@property (nonatomic, retain) UIButton *mobileButton;
@property (nonatomic, retain) UIButton *knockButton;
@property (nonatomic, retain) UIButton *toiletButton;

-(void)playSound:(UIButton *)sender;

-(void)animateButton:(UIButton *)sender;

@end
