//
//  AGTNSNotificationCenterTests.m
//  Wallet
//
//  Created by Agustín on 04/06/2015.
//  Copyright (c) 2015 Agustin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "AGTFakeNotificationCenter.h"
#import "AGTWallet.h"

@interface AGTNSNotificationCenterTests : XCTestCase

@end

@implementation AGTNSNotificationCenterTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

-(void) testThatSubscribesToMemoryWarning{
    
    //NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    AGTFakeNotificationCenter *fake = [AGTFakeNotificationCenter new];
    
    AGTWallet *w = [AGTWallet new];
    
    [w subscribeToMemorywarning:(NSNotificationCenter *)fake];
    
    NSDictionary *obs = [fake oberservers];
    id observer = [obs objectForKey:UIApplicationDidReceiveMemoryWarningNotification];
    
    XCTAssertEqualObjects(observer, w, @"Fat object must subscribe to UIApplicationDidReceiveMemoryWarningNotification");
}

@end
