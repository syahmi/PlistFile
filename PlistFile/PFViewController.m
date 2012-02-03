//
//  PFViewController.m
//  PlistFile
//
//  Created by Muhammad Syahmi Ismail on 2/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PFViewController.h"
#import "StatesTableViewController.h"

@implementation PFViewController

@synthesize titleLabel;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

- (id)readPlist:(NSString *)fileName 
{
    NSData *plistData;
    NSString *error;
    NSPropertyListFormat format;
    id plist;
    
    NSString *localizedPath = [[NSBundle mainBundle] pathForResource:fileName ofType:@"plist"];
    plistData = [NSData dataWithContentsOfFile:localizedPath]; 
    
    plist = [NSPropertyListSerialization propertyListFromData:plistData mutabilityOption:NSPropertyListImmutable format:&format errorDescription:&error];
    if (!plist) {
        NSLog(@"Error reading plist from file '%s', error = '%s'", [localizedPath UTF8String], [error UTF8String]);
        [error release];
    }
    
    return plist;
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [titleLabel setText:[[self readPlist:@"sample"] objectForKey:@"Title"]];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)statesBtnPressed:(id)sender
{
    StatesTableViewController *statesTableViewController = [[[StatesTableViewController alloc] initWithNibName:@"StatesTableViewController" bundle:nil] autorelease];
    
    UINavigationController *navigationController = [[[UINavigationController alloc] initWithRootViewController:statesTableViewController] autorelease];
    
    [self presentModalViewController:navigationController animated:YES];
    
}

- (void) dealloc
{
    [titleLabel release];
    [super dealloc];
}

@end
