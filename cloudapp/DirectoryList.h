//
//  DirectoryList.h
//  cloudapp
//
//  Created by Echo Yu on 2012-10-03.
//  Copyright (c) 2012 Echo Yu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
#import "mysql.h"


@interface DirectoryList : NSObject {
    sqlite3 *db;
    MYSQL sql;

}



-(NSMutableArray *)getDirectoryList;
-(NSMutableArray *)removeDirectory:(NSInteger) number;
-(NSMutableArray *)addDirectory;
-(NSMutableArray *)getDirectoryListMySql;

@end
