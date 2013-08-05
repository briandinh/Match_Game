//
//  MyView.h
//  Touches
//
//  Created by Brian Dinh on 7/18/13.
//  Copyright (c) 2013 Brian Dinh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MatchDelegate.h"

@interface MyView : UIView

@property (strong, nonatomic) id <MatchDelegate> delegate;

@end
