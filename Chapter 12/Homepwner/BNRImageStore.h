//
//  BNRImageStore.h
//  Homepwner
//
//  Created by Erin Parker on 8/26/13.
//  Copyright (c) 2013 Erin Parker. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface BNRImageStore : NSObject
{
    NSMutableDictionary *dictionary;
}

+ (BNRImageStore *)sharedStore;

- (void)setImage:(UIImage *)i forKey:(NSString *)s;
- (UIImage *)imageforKey: (NSString *)s;
- (void)deleteImageForKey: (NSString *)s;

@end
