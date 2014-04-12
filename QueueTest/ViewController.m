//
//  ViewController.m
//  QueueTest
//
//  Created by Jay Versluis on 12/04/2014.
//  Copyright (c) 2014 Pinkstone Pictures LLC. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

- (IBAction)mainQueue:(id)sender;
- (IBAction)backgroundQueue:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)mainQueue:(id)sender {
    
    // call this on the main thread
    [NSThread sleepForTimeInterval:3];
    int i = arc4random() % 100;
    self.title = [[NSString alloc]initWithFormat:@"Result: %d", i];
    
}

- (IBAction)backgroundQueue:(id)sender {
    
    // call the same method on a background thread
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        [NSThread sleepForTimeInterval:3];
        int i = arc4random() % 100;
        
        // update UI on the main thread
        dispatch_async(dispatch_get_main_queue(), ^{
            self.title = [[NSString alloc]initWithFormat:@"Result: %d", i];
        });

    });
}


@end
