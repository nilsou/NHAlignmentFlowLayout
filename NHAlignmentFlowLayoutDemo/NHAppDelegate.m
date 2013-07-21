//
//  NHAppDelegate.m
//  NHAlignmentFlowLayoutDemo
//
//  Created by Nils Hayat on 7/20/13.
//  Copyright (c) 2013 Nils Hayat. All rights reserved.
//

#import "NHAppDelegate.h"
#import "NHCollectionViewController.h"

@implementation NHAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    NHCollectionViewController *viewController = [[NHCollectionViewController alloc] init];
	self.window.rootViewController = viewController;
	
    [self.window makeKeyAndVisible];
    return YES;
}


@end
