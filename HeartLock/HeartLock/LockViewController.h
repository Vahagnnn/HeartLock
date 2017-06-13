//
//  LockViewController.h
//  HeartLock
//
//  Created by new on 17.04.17.
//  Copyright © 2017 Home. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LockView.h"

@interface LockViewController : UIViewController <LockViewDelegate>

@property (nonatomic, weak) IBOutlet LockView *lockView;

@end
