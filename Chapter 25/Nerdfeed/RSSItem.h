//
//  RSSItem.h
//  Nerdfeed
//
//  Created by Erin Parker on 5/8/13.
//  Copyright (c) 2013 Spitfire Athlete. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RSSItem : NSObject <NSXMLParserDelegate> {
    NSMutableString *currentString;
}

@property (nonatomic, weak) id parentParserDelegate;

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *link;

@end
