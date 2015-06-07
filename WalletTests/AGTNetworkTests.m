//
//  AGTNetworkTests.m
//  Wallet
//
//  Created by Agustín on 04/06/2015.
//  Copyright (c) 2015 Agustin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "AGTBroker.h"

@interface AGTNetworkTests : XCTestCase

@end

@implementation AGTNetworkTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
}

-(void) testThatEmptyratesDefaultsToOneToOne{
    
}

-(void) testThatEmptyRatesRaisesException{
    AGTBroker *broker = [AGTBroker new];

    NSData *jsonData = nil;
    
    XCTAssertThrows([broker parseJSONRates: jsonData], @"An empty JSON should raise exception");
    
    
}

@end
