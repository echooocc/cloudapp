//
//  DirectoryList.m
//  cloudapp
//
//  Created by Echo Yu on 2012-10-03.
//  Copyright (c) 2012 Echo Yu. All rights reserved.
//


#import "DirectoryList.h"
#import "Directory.h"
#import "mysql.h"


@implementation DirectoryList


//return an array of list from sqllite database
-(NSMutableArray *)getDirectoryList
{
    Directory *sharedirectory = [Directory sharedDirectory];

    @try {
        NSString *dbPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"test.db"];
        
        NSFileManager *filemgr = [NSFileManager defaultManager];
        BOOL success = [filemgr fileExistsAtPath:dbPath];
        if (!success) {
            NSLog(@"can not locate database file");
        }
        if (!(sqlite3_open([dbPath UTF8String],&db) == SQLITE_OK)){
            NSLog(@"error occur");
            
        }
        const char *sqlite = "SELECT number, category FROM directory";
        sqlite3_stmt *sqlStatement;
        if (sqlite3_prepare(db, sqlite, -1, &sqlStatement, NULL)!=SQLITE_OK) {
            NSLog(@"statement error");
        }
        
        while (sqlite3_step(sqlStatement)==SQLITE_ROW) {
            sharedirectory.number = sqlite3_column_int(sqlStatement, 0);
            sharedirectory.category = [NSString stringWithUTF8String:(char *)sqlite3_column_text(sqlStatement, 1)];
            NSLog(@"shared number = %d",sharedirectory.number);
            NSLog(@"shared category = %@",sharedirectory.category);
            //  [Directory.sharedList insertObject:sharedirectory.category atIndex:sharedirectory.number];
            [Directory.sharedList addObject:sharedirectory.category];
            // [Directory.sharedPairs setValue:[NSNumber numberWithInteger:sharedirectory.number] forKey:sharedirectory.category];
        }
        
    }
        
    @catch (NSException *exception) {
        NSLog(@"read list exception");
    }
    @finally {
        NSLog(@"shared list is %@",Directory.sharedList);
      //  NSLog(@"shared pairs is %@",Directory.sharedPairs);
        
        return Directory.sharedList;
        //return Directory.sharedPairs;
      
    }
}

//return data from mysql database on uitable view
-(NSMutableArray *)getDirectoryListMySql
{
    Directory *sharedirectory = [Directory sharedDirectory];
   
    @try {
        
        mysql_options(&sql, MYSQL_READ_DEFAULT_GROUP, "test");
        
        mysql_real_connect(&sql, "127.0.0.1", "root", "1234", "test", 3306, NULL, 0);
     
        if (&sql != NULL) {
            NSLog(@"database exists");

            int status = mysql_query(&sql, "SELECT id, name FROM directory");
            if (status) {
                NSLog(@"can not execute statement");
                mysql_close(&sql);
            }
           
            MYSQL_RES *result = mysql_store_result(&sql);
            MYSQL_ROW row;
            //MYSQL_FIELD *column = mysql_fetch_field(result);
        
            unsigned int rows = mysql_num_rows(result);
            NSLog(@"rows = %d",rows);
           
            unsigned int columns = mysql_num_fields(result);
            NSLog(@"columns= %d",columns);
        
            unsigned int i;
            
            while((row = mysql_fetch_row(result))!=NULL) {
                           
                for (i=0; i<columns; i++) {
                    
                    
                    sharedirectory.number = i;
                    sharedirectory.category = [NSString stringWithUTF8String:row[i]];
                    NSLog(@"row %d",sharedirectory.number);
                    NSLog(@"content is %@",sharedirectory.category);
                        
                    
                }
             [Directory.sharedList addObject:sharedirectory.category];
            }
            
            mysql_free_result(result);
        }
        else
            NSLog(@"database not exists");
        
        mysql_close(&sql);
        mysql_server_end();

    }
  
    @catch (NSException *exception) {
        NSLog(@"read list exception");
    }
    @finally {
        NSLog(@"shared list is %@",Directory.sharedList);
        //  NSLog(@"shared pairs is %@",Directory.sharedPairs);
        
        return Directory.sharedList;
        
                //return Directory.sharedPairs;
    }
}

-(NSMutableArray *)removeDirectory:(NSInteger) number
{
      
   
    @try {
        NSString *dbPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"test.db"];
        
        NSFileManager *filemgr = [NSFileManager defaultManager];
        BOOL success = [filemgr fileExistsAtPath:dbPath];
        if (!success) {
            NSLog(@"can not locate database file");
        }
        if (!(sqlite3_open([dbPath UTF8String],&db) == SQLITE_OK)){
            NSLog(@"error occur");
            
        }
        const char *sql = "DELETE FROM directory WHERE number = ?";
        sqlite3_stmt *sqlStatement;
        if (sqlite3_prepare(db, sql, -1, &sqlStatement, NULL)!=SQLITE_OK) {
           NSAssert1(0, @"Error while creating delete statement. '%s'", sqlite3_errmsg(db));
        }
        NSLog(@"number is %d",number);
        sqlite3_bind_int(sqlStatement, 1, number);
        
        
        if(SQLITE_DONE != sqlite3_step(sqlStatement)) {
            NSAssert1(0, @"Error while deleting. '%s'", sqlite3_errmsg(db));
            sqlite3_reset(sqlStatement);
        }
       sqlite3_finalize(sqlStatement);
        
    }
    @catch (NSException *exception) {
        NSLog(@"exception");
    }
    @finally {
        NSLog(@"%@",Directory.sharedList);
        return Directory.sharedList;
                
    }
}




@end
