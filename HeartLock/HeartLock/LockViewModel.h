//
//  LockViewModel.h
//  HeartLock
//
//  Created by new on 17.04.17.
//  Copyright © 2017 Home. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LockViewModel : NSObject

-(NSString*)getInstalationLabelTextWithKey:(NSString*)string;
-(NSString*)getInstalation_LabelTextWithKey:(NSString*)string;
-(BOOL)unlocked:(NSString*)string;


@end
