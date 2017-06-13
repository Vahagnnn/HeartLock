//
//  LockViewModel.m
//  HeartLock
//
//  Created by new on 17.04.17.
//  Copyright © 2017 Home. All rights reserved.
//

#import "LockViewModel.h"

@implementation LockViewModel

-(NSString*)getInstalationLabelTextWithKey:(NSString*)string{
    NSString *passwordString = string;
    NSString *str = [[NSString alloc]init];
    
    str = @"set your gesture password";
    
    if (passwordString != nil) {
        str = @"Password Saved";
        NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
        [userDefault setObject:string forKey:@"gesturePassword"];
    }else{
        str = @"Password Wrong";
        
    }
    return str;
}

-(NSString*)getInstalation_LabelTextWithKey:(NSString*)string {
    NSString *str = [[NSString alloc]init];
    NSString *savedPassword = [[NSUserDefaults standardUserDefaults] objectForKey:@"gesturePassword"];
    if ([savedPassword isEqualToString:string]) {
        str = @"unloked";
        savedPassword = nil;
        
    }else{
        str = @"Password Wrong";
    }
    
    return str;
}

-(BOOL)unlocked:(NSString*)string{
    NSString *str = @"unloked";
    if ([str isEqualToString:string]) {
        return YES;
    }
    return NO;
    
}




@end
