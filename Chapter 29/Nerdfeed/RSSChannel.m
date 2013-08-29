//
//  RSSChannel.m
//  Nerdfeed
//
//  Created by Erin Parker on 8/28/13.
//  Copyright (c) 2013 Erin Parker. All rights reserved.
//

#import "RSSChannel.h"
#import "RSSItem.h"
#import "JSONSerializable.h"

@implementation RSSChannel
@synthesize items, title, infoString, parentParserDelegate;

- (id)init
{
    self = [super init];
    if (self) {
        items = [[NSMutableArray alloc] init];
    }
    
    return self;
}

- (id)copyWithZone:(NSZone *)zone
{
    RSSChannel *c = [[[self class] alloc] init];
    [c setTitle:[self title]];
    [c setInfoString:[self infoString]];
    c->items = [items mutableCopy];
    return c;
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    NSLog(@"\t%@ found a %@ element", self, elementName);
    
    if ([elementName isEqual:@"title"]) {
        currentString = [[NSMutableString alloc] init];
        [self setTitle:currentString];
    }
    
    else if ([elementName isEqual:@"description"]) {
        currentString = [[NSMutableString alloc] init];
        [self setInfoString:currentString];
    }
    
    else if ([elementName isEqual:@"item"] || [elementName isEqual:@"entry"]) {
        RSSItem *entry = [[RSSItem alloc] init];
        [entry setParentParserDelegate:self];
        [parser setDelegate:entry];
        [items addObject:entry];
    }
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    [currentString appendString:string];
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    currentString = nil;
    if ([elementName isEqual:@"channel"] || [elementName isEqual:@"entry"])
        [parser setDelegate:parentParserDelegate];
}

- (void)readFromJSONDictionary:(NSDictionary *)d
{
    NSDictionary *feed = [d objectForKey:@"feed"];
    [self setTitle:[[feed objectForKey:@"title"] objectForKey:@"label"]];
    
    NSArray *entries = [feed objectForKey:@"entry"];
    for (NSDictionary *entry in entries) {
        RSSItem *i = [[RSSItem alloc] init];
        [i readFromJSONDictionary:entry];
        [items addObject:i];
    }
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:items forKey:@"items"];
    [aCoder encodeObject:title forKey:@"title"];
    [aCoder encodeObject:infoString forKey:@"infoString"];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self) {
        items = [aDecoder decodeObjectForKey:@"items"];
                [self setInfoString:[aDecoder decodeObjectForKey:@"info String"]];
        [self setTitle:[aDecoder decodeObjectForKey:@"title"]];
    }
    return self;
}

- (void)addItemsFromChannel:(RSSChannel *)otherChannel
{
    for (RSSItem *i in [otherChannel items]) {
        // If self's items does not contain this item, add it
        
        if (![[self items] containsObject:i])
            [[self items] addObject:i];
    }
    
    [[self items] sortUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        return [[obj2 publicationDate] compare:[obj1 publicationDate]];
    }];
}
@end
