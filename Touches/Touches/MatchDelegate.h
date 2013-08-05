//
//  MatchDelegate.h
//  Touches
//
//  Created by Brian Dinh on 7/18/13.
//  Copyright (c) 2013 Brian Dinh. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MyView;

@protocol MatchDelegate <NSObject>

- (void) didChooseView: (MyView *)myView;

@end
