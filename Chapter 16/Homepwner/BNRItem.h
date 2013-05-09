//
//  BNRItem.h
//  Homepwner
//
//  Created by Erin Parker on 5/7/13.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface BNRItem : NSManagedObject

@property (nonatomic, retain) NSString * itemName;
@property (nonatomic, retain) NSString * serialNumber;
@property (nonatomic, retain) NSNumber * valueInDollars;
@property (nonatomic, retain) NSDate * dateCreated;
@property (nonatomic, retain) NSString * imageKey;
@property (nonatomic, retain) NSData * thumbnailData;
@property (nonatomic, strong) UIImage *thumbnail;
@property (nonatomic) double orderingValue;
@property (nonatomic, retain) NSManagedObject *assetType;

- (void)setThumbnailDataFromImage: (UIImage *)image;

@end
