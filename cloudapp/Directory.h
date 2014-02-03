//
//  Directory.h
//  cloudapp
//
//  Created by Echo Yu on 2012-10-03.
//  Copyright (c) 2012 Echo Yu. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface Directory :NSObject {
    NSInteger number;
    NSString *category;
         
}


@property(nonatomic, assign) NSInteger number;
@property(nonatomic, retain) NSString *category;


+(Directory *)sharedDirectory;
+(NSMutableArray *) sharedList;
+(NSMutableDictionary *) sharedPairs;

@end
