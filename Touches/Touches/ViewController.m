//
//  ViewController.m
//  Touches
//
//  Created by Brian Dinh on 7/18/13.
//  Copyright (c) 2013 Brian Dinh. All rights reserved.
//

#import "ViewController.h"
#import "MyView.h"

@interface ViewController (){
    __weak IBOutlet UILabel *youWinLabel;
    __weak IBOutlet UIButton *resetButton;
    __weak IBOutlet UITextView *subLabel;
    int guesses;
    __weak IBOutlet UILabel *guessesLabel;
    NSMutableArray *tagsArray;
    NSTimer *countDownTimer;
    int secondsRemaining;
    __weak IBOutlet UILabel *timeDisplay;
    BOOL running;
    int i;
    bool clicked;
    MyView *firstCard;
    MyView *secondCard;
    int matches;
    __weak IBOutlet UILabel *count;
    __weak IBOutlet UILabel *matchLabel;
    NSMutableArray *totalViews;
    MyView *match1;
    MyView *match2;
    MyView *match3;
    MyView *match4;
    MyView *match5;
    MyView *match6;
    MyView *match7;
    MyView *match8;
    MyView *match9;
    MyView *match10;
    MyView *match11;
    MyView *match12;
    MyView *match13;
    MyView *match14;
    MyView *match15;
    MyView *match16;
    MyView *wrongCard;
    __weak IBOutlet UIButton *startButton;
    
    __weak IBOutlet MyView *card1;
    __weak IBOutlet MyView *card2;
    __weak IBOutlet MyView *card3;
    __weak IBOutlet MyView *card4;
    __weak IBOutlet MyView *card5;
    __weak IBOutlet MyView *card6;
    __weak IBOutlet MyView *card7;
    __weak IBOutlet MyView *card8;
    __weak IBOutlet MyView *card9;
    __weak IBOutlet MyView *card10;
    __weak IBOutlet MyView *card11;
    __weak IBOutlet MyView *card12;
    __weak IBOutlet MyView *card13;
    __weak IBOutlet MyView *card14;
    __weak IBOutlet MyView *card15;
    __weak IBOutlet MyView *card16;
}
@property (weak, nonatomic) IBOutlet MyView *card5;
- (IBAction)resetGame:(id)sender;
- (IBAction)startGame:(id)sender;

@end

@implementation ViewController
@synthesize card5;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    subLabel.text = @"";
    youWinLabel.hidden = YES;
    guesses = 0;
    secondsRemaining = 60;
    countDownTimer = [[NSTimer alloc] init];
    totalViews = [NSMutableArray arrayWithCapacity:16];
    clicked = NO;
    matches = 0;
	for (UIView *subView in self.view.subviews) {
        if ([subView isKindOfClass:[MyView class]]) {
            MyView * myView = (MyView *) subView;
            myView.delegate = self;
        }
    }
    matchLabel.text = @"PRESS START";
    running = NO;
    
    
    [self shuffleArray];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) shuffleArray {
    tagsArray = [[NSMutableArray alloc] initWithObjects:@"1",@"1",@"2",@"2",@"3",@"3",@"4",@"4",@"5",@"5",@"6",@"6",@"7",@"7",@"8",@"8", nil];
    
    for (int x = 0; x < [tagsArray count]; x++) {
        int randInt = (arc4random() % ([tagsArray count] - x)) + x;
        [tagsArray exchangeObjectAtIndex:x withObjectAtIndex:randInt];
    }
    
    
    card1.tag = [[tagsArray objectAtIndex:0] intValue];
    card2.tag = [[tagsArray objectAtIndex:1] intValue];
    card3.tag = [[tagsArray objectAtIndex:2] intValue];
    card4.tag = [[tagsArray objectAtIndex:3] intValue];
    card5.tag = [[tagsArray objectAtIndex:4] intValue];
    card6.tag = [[tagsArray objectAtIndex:5] intValue];
    card7.tag = [[tagsArray objectAtIndex:6] intValue];
    card8.tag = [[tagsArray objectAtIndex:7] intValue];
    card9.tag = [[tagsArray objectAtIndex:8] intValue];
    card10.tag = [[tagsArray objectAtIndex:9] intValue];
    card11.tag = [[tagsArray objectAtIndex:10] intValue];
    card12.tag = [[tagsArray objectAtIndex:11] intValue];
    card13.tag = [[tagsArray objectAtIndex:12] intValue];
    card14.tag = [[tagsArray objectAtIndex:13] intValue];
    card15.tag = [[tagsArray objectAtIndex:14] intValue];
    card16.tag = [[tagsArray objectAtIndex:15] intValue];
    
}
-(void) colorChange {
    if (firstCard.tag == 1) {
        firstCard.backgroundColor = [UIColor redColor];
    }
    if (secondCard.tag == 1) {
        secondCard.backgroundColor = [UIColor redColor];
    }
    if (wrongCard.tag == 1) {
        wrongCard.backgroundColor = [UIColor redColor];
    }
    
    if (firstCard.tag == 2) {
        firstCard.backgroundColor = [UIColor blueColor];
    }
    if (wrongCard.tag == 2) {
        wrongCard.backgroundColor = [UIColor blueColor];
    }
    if (secondCard.tag == 2) {
        secondCard.backgroundColor = [UIColor blueColor];
    }
    if (firstCard.tag == 3) {
        firstCard.backgroundColor = [UIColor yellowColor];
    }
    if (secondCard.tag == 3) {
        secondCard.backgroundColor = [UIColor yellowColor];
    }
    if (wrongCard.tag == 3) {
        wrongCard.backgroundColor = [UIColor yellowColor];
    }
    if (firstCard.tag == 4) {
        firstCard.backgroundColor = [UIColor greenColor];
    }
    if (secondCard.tag == 4) {
        secondCard.backgroundColor = [UIColor greenColor];
    }
    if (wrongCard.tag == 4) {
        wrongCard.backgroundColor = [UIColor greenColor];
    }
    if (firstCard.tag == 5) {
        firstCard.backgroundColor = [UIColor purpleColor];
    }
    if (secondCard.tag == 5) {
        secondCard.backgroundColor = [UIColor purpleColor];
    }
    if (wrongCard.tag == 5) {
        wrongCard.backgroundColor = [UIColor purpleColor];
    }
    
    if (firstCard.tag == 6) {
        firstCard.backgroundColor = [UIColor orangeColor];
    }
    if (secondCard.tag == 6) {
        secondCard.backgroundColor = [UIColor orangeColor];
    }
    if (wrongCard.tag == 6) {
        wrongCard.backgroundColor = [UIColor orangeColor];
    }
    if (firstCard.tag == 7) {
        firstCard.backgroundColor = [UIColor magentaColor];
    }
    if (secondCard.tag == 7) {
        secondCard.backgroundColor = [UIColor magentaColor];
    }
    if (wrongCard.tag == 7) {
        wrongCard.backgroundColor = [UIColor magentaColor];
    }
    
    if (firstCard.tag == 8) {
        firstCard.backgroundColor = [UIColor cyanColor];
    }
    if (secondCard.tag == 8) {
        secondCard.backgroundColor = [UIColor cyanColor];
    }
    if (wrongCard.tag == 8) {
        wrongCard.backgroundColor = [UIColor cyanColor];
    }
    
}

-(void) foundMatch {
    firstCard.hidden = YES;
    secondCard.hidden = YES;
}

-(void) notMatch {
    firstCard.backgroundColor = [UIColor lightGrayColor];
    wrongCard.backgroundColor = [UIColor lightGrayColor];
}

-(void) matchLabelReset {
    matchLabel.text=@"";
}

- (void) didChooseView: (MyView *) myView {
    if ((clicked == NO) && ([matchLabel.text isEqual: @""])) {
        wrongCard = nil;
        i = myView.tag;
        clicked = YES;
        firstCard = myView;
        [self colorChange];
        NSLog(@"%i", firstCard.tag);
    }
    else {
    }
    if ((firstCard != myView) && ([matchLabel.text isEqual: @""])) {
        
        if (i == myView.tag) {
            NSLog(@"Match!");
            guesses = guesses+1;
            guessesLabel.text = [NSString stringWithFormat:@"guesses: %i",guesses];
            secondCard = myView;
            NSLog(@"%i", secondCard.tag);
            clicked= NO;
            [self colorChange];
            [self performSelector:@selector(foundMatch) withObject:self afterDelay:.5 ];
            matches++;
            count.text = [NSString stringWithFormat:@"count: %i", matches];
            [totalViews addObject:firstCard];
            [totalViews addObject:myView];
            matchLabel.text = @"YOU GOT ONE";
            [self performSelector:@selector(matchLabelReset) withObject:self afterDelay:.5 ];
            if (match2 == Nil) {
                match1 = firstCard;
                match2 = secondCard;
            }
            
            else if  (match4 == Nil) {
                match3 = firstCard;
                match4 = secondCard;
            }
            
            else if  (match6 == Nil) {
                match5 = firstCard;
                match6 = secondCard;
            }
            
            else if  (match8 == Nil) {
                match7 = firstCard;
                match8 = secondCard;
            }
            
            else if  (match10 == Nil) {
                match9 = firstCard;
                match10 = secondCard;
            }
            
            else if  (match12 == Nil) {
                match11 = firstCard;
                match12 = secondCard;
            }
            
            else if  (match14 == Nil) {
                match13 = firstCard;
                match14 = secondCard;
            }
            else if  (match16 == Nil) {
                match15 = firstCard;
                match16 = secondCard;
            }
            
            
        }
        else{
            NSLog(@"No match!");
            guesses = guesses+1;
            guessesLabel.text = [NSString stringWithFormat:@"guesses: %i",guesses];wrongCard = myView;
            [self colorChange];
            [self performSelector:@selector(notMatch) withObject:self afterDelay:.5 ];
            [self performSelector:@selector(matchLabelReset) withObject:self afterDelay:.5 ];
            matchLabel.text = @"NOPE";
            clicked = NO;
        }
    }
    
    if (matches == 8) {
        [self performSelector:@selector(youWin) withObject:self afterDelay:.5 ];      }
}


-(void)youWin {
    youWinLabel.hidden=NO;
    [countDownTimer invalidate];
    
    if (guesses >30) {
        subLabel.text = [NSString stringWithFormat:@"but %i is a whole lot of guesses... Try harder next time.", guesses];
    }
    else {
        subLabel.text = [NSString stringWithFormat:@"with only %i guesses. Not bad.", guesses];
        [resetButton setTitle:@"Play Again" forState:UIControlStateNormal];
    }
}
- (void)countDown{
    secondsRemaining = secondsRemaining -1;
    
    
    timeDisplay.text = [NSString stringWithFormat:@"00:%02i", secondsRemaining];
    
    if (secondsRemaining == 0) {
        [countDownTimer invalidate];
        
        matchLabel.text = @"YOU LOSE";
        [resetButton setTitle:@"Play Again" forState:UIControlStateNormal];
    }
}

- (IBAction)resetGame:(id)sender {
    [resetButton setTitle:@"Reset" forState:UIControlStateNormal];
    subLabel.text = @"";
    youWinLabel.hidden = YES;
    running = NO;
    guesses = 0;
    guessesLabel.text=@"guesses: 0";
    firstCard.backgroundColor = [UIColor lightGrayColor];
    firstCard = nil;
    secondCard = nil;
    match1.hidden=NO;
    match2.hidden=NO;
    match3.hidden=NO;
    match4.hidden=NO;
    match5.hidden=NO;
    match6.hidden=NO;
    match7.hidden=NO;
    match8.hidden=NO;
    match9.hidden=NO;
    match10.hidden=NO;
    match11.hidden=NO;
    match12.hidden=NO;
    match13.hidden=NO;
    match14.hidden=NO;
    match15.hidden=NO;
    match16.hidden=NO;
    match1.backgroundColor=[UIColor lightGrayColor];
    match2.backgroundColor=[UIColor lightGrayColor];
    match3.backgroundColor=[UIColor lightGrayColor];
    match4.backgroundColor=[UIColor lightGrayColor];
    match5.backgroundColor=[UIColor lightGrayColor];
    match6.backgroundColor=[UIColor lightGrayColor];
    match7.backgroundColor=[UIColor lightGrayColor];
    match8.backgroundColor=[UIColor lightGrayColor];
    match9.backgroundColor=[UIColor lightGrayColor];
    match10.backgroundColor=[UIColor lightGrayColor];
    match11.backgroundColor=[UIColor lightGrayColor];
    match12.backgroundColor=[UIColor lightGrayColor];
    match13.backgroundColor=[UIColor lightGrayColor];
    match14.backgroundColor=[UIColor lightGrayColor];
    match15.backgroundColor=[UIColor lightGrayColor];
    match16.backgroundColor=[UIColor lightGrayColor];
    match1 = nil;
    match2 = nil;
    match3 = nil;
    match4 = nil;
    match5 = nil;
    match6 = nil;
    match7 = nil;
    match8 = nil;
    match9 = nil;
    match10 = nil;
    match11 = nil;
    match12 = nil;
    match13= nil;
    match14 = nil;
    match15 = nil;
    match16 = nil;
    /*    card1=nil;
     card2=nil;
     card3=nil;
     card4=nil;
     card5=nil;
     card6=nil;
     card7=nil;
     card8=nil;
     card9=nil;
     card10=nil;
     card11=nil;
     card12=nil;
     card13=nil;
     card14=nil;
     card15=nil;
     card16=nil;*/
    matches = 0;
    count.text = [NSString stringWithFormat:@"count: %i", matches];
    
    [startButton setTitle:@"Start" forState:UIControlStateNormal];
    secondsRemaining = 60;
    [countDownTimer invalidate];
    clicked = NO;
    timeDisplay.text = @"01:00";
    matchLabel.text = @"PRESS START";
    
    [self shuffleArray];
}

- (IBAction)startGame:(id)sender {
    
    guesses = 0;
    
    matchLabel.text = @"";
    
    
    if (running == NO) {
        running = YES;
        
        countDownTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(countDown) userInfo:nil repeats:YES];
        [startButton setTitle:@"Pause" forState:UIControlStateNormal];
    }
    else if (![timeDisplay.text isEqual: @"00:00"]){
        running = NO;
        [countDownTimer invalidate];
        matchLabel.text = @"PAUSED";
        [startButton setTitle:@"Resume" forState:UIControlStateNormal];
        
    }
    
    
}

@end
