//
//  RSSItem.m
//  Nerdfeed
//
//  Created by Erin Parker on 8/28/13.
//  Copyright (c) 2013 Erin Parker. All rights reserved.
//

#import "RSSItem.h"

@implementation RSSItem
@synthesize title, link, parentParserDelegate;

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    NSLog(@"\t\t%@ found a %@ element", self, elementName);
    
    if ([elementName isEqual:@"title"]) {
        currentString = [[NSMutableString alloc] init];
        [self setTitle:currentString];
    }
    else if ([elementName isEqual:@"link"]) {
        currentString = [[NSMutableString alloc] init];
        [self setLink:currentString];
    }
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    [currentString appendString:string];
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    currentString = nil;
    if ([elementName isEqual:@"item"])
        [parser setDelegate:parentParserDelegate];
}

- (void)readFromJSONDictionary:(NSDictionary *)d
{
    [self setTitle:[[d objectForKey:@"title"] objectForKey:@"label"]];
    NSArray *links = [d objectForKey:@"link"];
    
    if ([links count] > 1) {
        NSDictionary *sampleDict = [[links objectAtIndex:1] objectForKey:@"attributes"];
        
        [self setLink:[sampleDict objectForKey:@"href"]];
    }
}
@end
