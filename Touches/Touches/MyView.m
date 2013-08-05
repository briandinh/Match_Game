//
//  MyView.m
//  Touches
//
//  Created by Brian Dinh on 7/18/13.
//  Copyright (c) 2013 Brian Dinh. All rights reserved.
//

#import "MyView.h"

@implementation MyView{
    
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(id) initWithCoder:(NSCoder *)aDecoder {

    self = [super initWithCoder:aDecoder];
    if (self) {
        NSLog(@"MyView");
        self.backgroundColor= [UIColor lightGrayColor];
        
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    
}

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
}

-(void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{

    [_delegate didChooseView:self];
}


@end
