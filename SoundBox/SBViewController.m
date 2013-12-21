//
//  SBViewController.m
//  SoundBox
//
//  Created by Jack Callister on 14/12/13.
//  Copyright (c) 2013 Jack Callister. All rights reserved.
//

#import "SBViewController.h"

@interface SBViewController ()

@end

@implementation SBViewController

@synthesize player;

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Make the background colour of the view white.
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.header];
    [self.view addSubview:self.addApplauseButton];
    [self.view addSubview:self.addScreamButton];
    [self.view addSubview:self.addChickenButton];
    [self.view addSubview:self.addDroidButton];
    [self.view addSubview:self.addMobileButton];
    [self.view addSubview:self.addKnockButton];
    [self.view addSubview:self.addToiletButton];
}

- (void)loadView
{
    // Add a view.
    CGRect viewRect = [[UIScreen mainScreen] bounds];
    UIView *view    = [[UIView alloc] initWithFrame:viewRect];
    self.view = view;
}

-(UIView *)header
{
    // Add a nav bar subview
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 92)];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"soundcube";
    label.font = [UIFont fontWithName:@"Helsinki" size:24];
    label.textColor = [UIColor whiteColor];
    
    CGRect headerRect = CGRectMake(0, 0, 380, 88);
    UIView *headerView = [[UIView alloc] initWithFrame:headerRect];
    headerView.backgroundColor = [UIColor colorWithRed:32/255 green:8/255 blue:52/255 alpha:1.0];
    
    [headerView addSubview:label];
    
    return headerView;
}

-(UIButton *)addApplauseButton
{
    NSString *title = @"applause";
    self.applauseButton = [self setupButton:title];
    self.applauseButton.frame = CGRectMake(34, 127, 62, 62);
    
    return self.applauseButton;
}

-(UIButton *)addScreamButton
{
    NSString *title = @"scream";
    self.screamButton = [self setupButton:title];
    self.screamButton.frame = CGRectMake(128, 127, 62, 62);

    return self.screamButton;
}

-(UIButton *)addChickenButton
{
    NSString *title = @"chicken";
    self.chickenButton = [self setupButton:title];
    self.chickenButton.frame = CGRectMake(129, 242, 62, 62);
    
    return self.chickenButton;
}


-(UIButton *)addDroidButton
{
    NSString *title = @"droid";
    self.droidButton = [self setupButton:title];
    self.droidButton.frame = CGRectMake(34, 242, 62, 62);
    
    return self.droidButton;
}

-(UIButton *)addMobileButton
{
    NSString *title = @"mobile";
    self.mobileButton = [self setupButton:title];
    self.mobileButton.frame = CGRectMake(224, 127, 62, 62);

    return self.mobileButton;
}

-(UIButton *)addKnockButton
{
    NSString *title = @"knock";
    self.knockButton = [self setupButton:title];
    self.knockButton.frame = CGRectMake(224, 242, 62, 62);
 
    return self.knockButton;
}


-(UIButton *)addToiletButton
{
    
    NSString *title = @"toilet";
    self.toiletButton = [self setupButton:title];
    self.toiletButton.frame = CGRectMake(129, 357, 62, 62);
    
    return self.toiletButton;
}

-(UIButton *)setupButton:(NSString *)title
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:[[UIColor alloc] initWithWhite:1 alpha:0] forState:UIControlStateNormal];
    
    NSString *imagePath = [[NSBundle mainBundle] pathForResource: title
                                                          ofType: @"png"];
    UIImage *image = [UIImage imageWithContentsOfFile:imagePath];
    
    
    [button setBackgroundImage:image forState:UIControlStateNormal];
    [button setBackgroundImage:image forState:UIControlStateHighlighted];
    [button addTarget:self
               action:@selector(playSound:)
     forControlEvents:UIControlEventTouchUpInside];
    [button addTarget:self
               action:@selector(animateButton:)
     forControlEvents:UIControlEventTouchUpInside];
    [button addTarget:self
               action:@selector(dimButtons:)
     forControlEvents:UIControlEventTouchUpInside];
    
    return button;
}

-(void)resetButtons
{
    [UIView animateWithDuration:0.3 delay:0 options:(UIViewAnimationOptionCurveEaseInOut)
                     animations:^{
                         self.applauseButton.alpha = 1;
                         self.screamButton.alpha = 1;
                         self.chickenButton.alpha = 1;
                         self.droidButton.alpha = 1;
                         self.mobileButton.alpha = 1;
                         self.knockButton.alpha = 1;
                         self.toiletButton.alpha = 1;
                     }
                     completion:^(BOOL finished){
                     }];
}

-(void)dimButtons:(UIButton *)sender
{
    self.applauseButton.alpha = 0.5;
    self.screamButton.alpha = 0.4; // its a dark button!
    self.chickenButton.alpha = 0.5;
    self.droidButton.alpha = 0.5;
    self.mobileButton.alpha = 0.5;
    self.knockButton.alpha = 0.5;
    self.toiletButton.alpha = 0.5;
    
    // Animate these
    if([sender isEqual:self.applauseButton]){
        self.applauseButton.alpha = 1;
    } else if([sender isEqual:self.screamButton]) {
        self.screamButton.alpha = 1;
    } else if([sender isEqual:self.chickenButton]) {
        self.chickenButton.alpha = 1;
    } else if([sender isEqual:self.droidButton]){
        self.droidButton.alpha = 1;
    } else if([sender isEqual:self.mobileButton]){
        self.mobileButton.alpha = 1;
    } else if([sender isEqual:self.knockButton]) {
        self.knockButton.alpha = 1;
    } else if([sender isEqual:self.toiletButton]) {
        self.toiletButton.alpha = 1;
    }
}

-(void)animateButton:(UIButton *)sender
{
    CGRect originalFrame = sender.frame;
    CGRect newFrame = CGRectMake(originalFrame.origin.x - 4, originalFrame.origin.y - 4, originalFrame.size.width + 8, originalFrame.size.height + 8);
    
    [UIView animateWithDuration:0.3 delay:0 options:(UIViewAnimationOptionCurveEaseInOut)
                     animations:^{
                        [UIView setAnimationRepeatCount:1];
                         sender.frame = newFrame;
                     }
                     completion:^(BOOL finished){
                         [UIView animateWithDuration:0.3
                                          animations:^{
                                              sender.frame = originalFrame;
                                          }];
                         
                         [self resetButtons]; // move this to when the sound finishes
                     }];
}

-(void)playSound:(UIButton *)sender
{
    NSString *soundTitle = sender.titleLabel.text;
    NSString *soundFilePath =
    [[NSBundle mainBundle] pathForResource: soundTitle
                                    ofType: @"wav"];
    
    NSURL *fileURL = [[NSURL alloc] initFileURLWithPath: soundFilePath];
    
    AVAudioPlayer *newPlayer =
    [[AVAudioPlayer alloc] initWithContentsOfURL: fileURL
                                           error: nil];
    
    self.player = newPlayer;
    [player setDelegate:self];
    [player play];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
