//
//  LockView.h
//  HeartLock
//
//  Created by new on 17.04.17.
//  Copyright © 2017 Home. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>


@class LockView;

@protocol LockViewDelegate <NSObject>
@optional
- (void)gestureLockView:(LockView *)gestureLockView didBeginWithPasscode:(NSString *)passcode;

- (void)gestureLockView:(LockView *)gestureLockView didEndWithPasscode:(NSString *)passcode;

@end

@interface LockView : UIView

@property (nonatomic, strong, readonly) NSArray *buttons;
@property (nonatomic, strong, readonly) NSMutableArray *selectedButtons;

@property (nonatomic, assign) NSUInteger numberOfGestureNodes;
@property (nonatomic, assign) NSUInteger gestureNodesPerRow;

@property (nonatomic, strong) UIImage *normalGestureNodeImage;
@property (nonatomic, strong) UIImage *selectedGestureNodeImage;

@property (nonatomic, strong) UIColor *lineColor;
@property (nonatomic, assign) CGFloat lineWidth;

@property (nonatomic, strong, readonly) UIView *contentView;//the container of the gesture notes
@property (nonatomic, assign) UIEdgeInsets contentInsets;

@property (nonatomic, weak) id<LockViewDelegate> delegate;


@end
