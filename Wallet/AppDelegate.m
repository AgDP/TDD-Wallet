//
//  AppDelegate.m
//  Wallet
//
//  Created by Agustín on 01/06/2015.
//  Copyright (c) 2015 Agustin. All rights reserved.
//

#import "AppDelegate.h"
#import "AGTWalletTableViewController.h"
#import "AGTWallet.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
   
    AGTWallet *wallet = [[AGTWallet alloc] initWithAmount:2 currency:@"USD"];
    
    AGTMoney *newEur = [[AGTMoney alloc] initWithAmount:2 currency:@"EUR"];
    
    AGTMoney *newDollar = [[AGTMoney alloc] initWithAmount:22 currency:@"USD"];
    
    [wallet plus:newEur];
    [wallet plus:newDollar];
    
    AGTWalletTableViewController *walletVC = [[AGTWalletTableViewController alloc] initWithModel:wallet];

    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    self.window.backgroundColor = [UIColor whiteColor];
    
    self.window.rootViewController = walletVC;
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
