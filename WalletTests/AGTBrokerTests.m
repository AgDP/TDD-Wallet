//
//  AGTBrokerTests.m
//  Wallet
//
//  Created by Agustín on 04/06/2015.
//  Copyright (c) 2015 Agustin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "AGTMoney.h"
#import "AGTBroker.h"

@interface AGTBrokerTests : XCTestCase
@property (nonatomic, strong) AGTBroker *emptyBroker;
@property (nonatomic, strong) AGTMoney *oneDollar;
@end

@implementation AGTBrokerTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    self.emptyBroker = [AGTBroker new];
    self.oneDollar = [AGTMoney dollarWithAmount:1];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
    
    self.emptyBroker = nil;
    self.oneDollar = nil;
}

-(void) testSimplereduction{
    
    AGTMoney *sum = [[AGTMoney dollarWithAmount:5] plus:[AGTMoney dollarWithAmount:5]];
    
    AGTMoney *reduced = [self.emptyBroker reduced: sum toCurrency: @"USD"];
    
    XCTAssertEqualObjects(sum, reduced, @"Conversion to same currency should be a NOP");
}

// $10 == €5 2:1
-(void) testReduction{
    
    [self.emptyBroker addRate: 2 fromCurrency: @"EUR" toCurrency: @"USD"];
    
    AGTMoney *dollars = [AGTMoney dollarWithAmount:10];
    AGTMoney *euros = [AGTMoney euroWithAmount:5];
    
    AGTMoney *converted = [self.emptyBroker reduced:dollars toCurrency:@"EUR"];
    
    XCTAssertEqualObjects(converted, euros, @"$10 == €5");
    
}

-(void) testThatNoRateRaisesException{
    
    XCTAssertThrows([self.emptyBroker reduced:self.oneDollar toCurrency:@"EUR"], @"No rates should cause esception");
}

-(void) testThatNilConversionDoesNotChangeMoney{
    
    
    XCTAssertEqualObjects(self.oneDollar, [self.emptyBroker reduced:self.oneDollar toCurrency:@"USD"], @"A nil conversion shuld have no effect");
}

@end
