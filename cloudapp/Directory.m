//
//  Directory.m
//  cloudapp
//
//  Created by Echo Yu on 2012-10-03.
//  Copyright (c) 2012 Echo Yu. All rights reserved.
//

#import "Directory.h"

static NSMutableArray *sharedList = nil;
static NSMutableDictionary *sharedPairs = nil;
static Directory *sharedDirectory = nil;

@implementation Directory

@synthesize number;
@synthesize category;


+(Directory *)sharedDirectory
{
    if (sharedDirectory==nil) {
        sharedDirectory = [[super allocWithZone:NULL] init];
    }
    return sharedDirectory;
}

+(NSMutableArray *)sharedList
{
    if (sharedList == nil) {
        sharedList = [[NSMutableArray alloc] initWithCapacity:20];
    }
    
    return sharedList;
}

+(NSMutableDictionary *)sharedPairs
{
    if (sharedPairs == nil) {
        sharedPairs = [[NSMutableDictionary alloc] initWithCapacity:20];
    }
    
    return sharedPairs;
}
@end
