//
//  RSSChannel.h
//  Nerdfeed
//
//  Created by Erin Parker on 5/8/13.
//  Copyright (c) 2013 Spitfire Athlete. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RSSChannel : NSObject <NSXMLParserDelegate>
{
    NSMutableString *currentString;
}

@property (nonatomic, weak) id parentParserDelegate;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *infoString;
@property (nonatomic, readonly, strong) NSMutableArray *items;

@end
