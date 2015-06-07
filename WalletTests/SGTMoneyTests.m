//
//  SGTMoneyTests.m
//  Wallet
//
//  Created by Agustín on 01/06/2015.
//  Copyright (c) 2015 Agustin. All rights reserved.
//

@import Foundation;
#import <XCTest/XCTest.h>
#import "AGTMoney.h"

@interface SGTMoneyTests : XCTestCase

@end

@implementation SGTMoneyTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

-(void) testMultiplication{
    
    AGTMoney *five =[AGTMoney euroWithAmount:5];
    AGTMoney *product = [five times: 2];
    XCTAssertEqualObjects(product, [AGTMoney euroWithAmount:10]);
    
    AGTMoney *fiveUSD = [AGTMoney dollarWithAmount:5];
    AGTMoney *productUSD = [fiveUSD times:2];
    
    XCTAssertEqualObjects(productUSD, [AGTMoney dollarWithAmount:10]);
    
}

-(void) testEquality{
    
    AGTMoney *five = [AGTMoney euroWithAmount:5];
    AGTMoney *otherFive = [AGTMoney euroWithAmount:5];
    
    XCTAssertEqualObjects(five, otherFive);
    
    AGTMoney *seven = [AGTMoney euroWithAmount:7];
    
    XCTAssertNotEqualObjects(five, seven);
}

-(void) testHash{
    AGTMoney *a = [AGTMoney euroWithAmount:2];
    AGTMoney *b = [AGTMoney euroWithAmount:2];
    
    XCTAssertEqual([a hash], [b hash], @"Equal objects must have same hash");
    XCTAssertEqual([[AGTMoney dollarWithAmount:1] hash], [[AGTMoney dollarWithAmount:1] hash], @"Equal objects must have same hash");
}

-(void) testAmountStorage{
    AGTMoney *euro = [AGTMoney euroWithAmount:2];
    
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
    //XCTAssertEqual(2, [[euro performSelector:@selector(amount)] integerValue], @"The value retieved should be the same as the stored");
    
    //XCTAssertEqual(2, [[[AGTMoney dollarWithAmount:2]performSelector:@selector(amount)] integerValue], @"The value retieved should be the same as the stored");
#pragma clang diagnostic pop
}

-(void) testThatTInitDoesNotRaisesException{
    
    XCTAssertNoThrow([AGTMoney dollarWithAmount:3]);
}

-(void) testDifferentCurrencies{
    
    AGTMoney *euro = [AGTMoney euroWithAmount:1];
    AGTMoney *dollar = [AGTMoney dollarWithAmount:1];
    
    XCTAssertNotEqualObjects(euro, dollar, @"Different currencies should not be equal!");
}

-(void) testCurrency{
    
    AGTMoney *dollars = [AGTMoney dollarWithAmount:1];
    
    XCTAssertEqualObjects(@"USD", [dollars currency]);
    
    AGTMoney *euros = [AGTMoney euroWithAmount:1];
    
    XCTAssertEqualObjects(@"EUR", [euros currency]);
}

-(void) testSimpleAddition{
    
    XCTAssertEqualObjects([[AGTMoney dollarWithAmount:5] plus: [AGTMoney dollarWithAmount:5]], [AGTMoney dollarWithAmount:10], @"$5 + $5 = $10");
}

-(void) testThatHashIsAmount{
    
    AGTMoney *one = [AGTMoney dollarWithAmount:1];
    
    XCTAssertEqual([one hash], 1, @"The hash must be the same as the amount");
}

-(void) testDescription{
    
    AGTMoney *one = [AGTMoney dollarWithAmount:1];
    NSString *desc = @"<AGTMoney: USD 1>";
    
    XCTAssertEqualObjects(desc, [one description], @"Description must match template");
}

@end
