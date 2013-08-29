//
//  BNRExecutor.h
//  Blocky
//
//  Created by Erin Parker on 8/28/13.
//  Copyright (c) 2013 Erin Parker. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BNRExecutor : NSObject

@property (nonatomic, copy) int (^block)(int, int);

- (int)computeWithValue: (int)value1 andValue: (int)value2;

@end
