//
//  DetailViewController.m
//  cloudapp
//
//  Created by Echo Yu on 2012-10-09.
//  Copyright (c) 2012 Echo Yu. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController
@synthesize imageView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSString *urlString = [NSString stringWithFormat:@"http://ielmo.xtreemhost.com/array.php"];
    
    NSURL *url = [NSURL URLWithString:urlString];
    
    NSData *data = [NSData dataWithContentsOfURL:url];
    
    NSError *error;
    
    NSMutableArray *json = (NSMutableArray*)[NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    
    
    
    NSLog(@"%@", [json objectAtIndex:0]);
    
    NSString *imageString = [NSString stringWithFormat:@"%@", [json objectAtIndex:1]];
    
    NSURL *urlOne = [NSURL URLWithString:imageString];
    
    NSData *newData = [NSData dataWithContentsOfURL:urlOne];
        
    [imageView setImage:[UIImage imageWithData:newData]];
    
    [self.view addSubview:imageView];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
