//
//  ListViewController.m
//  Nerdfeed
//
//  Created by Erin Parker on 5/8/13.
//  Copyright (c) 2013 Spitfire Athlete. All rights reserved.
//

#import "ListViewController.h"
#import "RSSChannel.h"
#import "RSSItem.h"

@implementation ListViewController

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    NSLog(@"%@ found a %@ element", self, elementName);
    
    if ([elementName isEqual:@"channel"]) {
        // If parser saw a channel, create new instance and store in our ivar
        channel = [[RSSChannel alloc] init];
        
        // Give the channel object a pointer back to ourselves for later
        [channel setParentParserDelegate:self];
        
        [parser setDelegate:channel];
    }
}

- (void)fetchEntries
{
    // Create a new data container for the stuff that comes back from the service
    xmlData = [[NSMutableData alloc] init];
    
    // Construct a URL that will ask the service for what you want
    
    NSURL *url = [NSURL URLWithString:@"http://forums.bignerdranch.com/smartfeed.php?"
                  @"limit=7_DAY&sort_by=standard&feed_type=RSS2.0&feed_style=COMPACT"];
    
    NSURLRequest *req = [NSURLRequest requestWithURL:url];
    
    // Create a connection that will exchange this request for data from the URL
    connection = [[NSURLConnection alloc] initWithRequest:req delegate:self startImmediately:YES];
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    
    if (self) {
        [self fetchEntries];
    }
    
    return self;
}

- (void)connection:(NSURLConnection *)conn didReceiveData:(NSData *)data
{
    // Add the incoming chunk of data to the container we are keeping
    // The data always comes in the correct order
    [xmlData appendData:data];
}

- (void)connectionDidFinishLoading: (NSURLConnection *)connection
{
    NSXMLParser *parser = [[NSXMLParser alloc] initWithData:xmlData];
    
    // Give it a delegate
    [parser setDelegate:self];
    
    // Tell it to start parsing - the doc will be parsed and
    // the delegate of NSXMLParser will get all of its delegate messages
    // sent to it before the line finishes execution
    
    [parser parse];
    
    // Get rid of XML, we no longer need it
    xmlData = nil;
    
    // Get rid of the connection, we no longer ned it
    connection = nil;
    
    // Reload the table
    [[self tableView] reloadData];
    
    NSLog(@"%@\n %@\n %@\n", channel, [channel title], [channel infoString]);
}

- (void)connection: (NSURLConnection *)conn didFailWithError:(NSError *)error
{
    // Release the connection object, we're done with it
    connection = nil;
    
    // Release the xmlData object, we're done with it
    xmlData = nil;
    
    // Grab the description of the error object passed to us
    NSString *errorString = [NSString stringWithFormat:@"Fetch failed: %@", [error localizedDescription]];
    
    // Create and show an alert view with this errror displayed
    UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"Error" message:errorString delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                       
    [av show];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[channel items] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
    }
    
    RSSItem *item = [[channel items] objectAtIndex:[indexPath row]];
    [[cell textLabel] setText:[item title]];
    return cell;
}

@end
