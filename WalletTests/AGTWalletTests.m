//
//  AGTWalletTests.m
//  Wallet
//
//  Created by Agustín on 04/06/2015.
//  Copyright (c) 2015 Agustin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "AGTMoney.h"
#import "AGTBroker.h"
#import "AGTWallet.h"

@interface AGTWalletTests : XCTestCase
@property (nonatomic,strong) AGTWallet *wallet;
@end

@implementation AGTWalletTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    self.wallet = [[AGTWallet alloc] initWithAmount:1 currency:@"USD"];
    [self.wallet plus: [AGTMoney euroWithAmount:1]];
  
    [self.wallet plus: [AGTMoney euroWithAmount:10]];
    
    [self.wallet plus: [AGTMoney dollarWithAmount:20]];
    
    [self.wallet plus: [AGTMoney euroWithAmount:30]];
    
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

// €40 + $20 = $100 2:1
-(void) testAdditionWithReduction{
    
    AGTBroker *broker =[AGTBroker new];
    [broker addRate: 2 fromCurrency:@"EUR" toCurrency:@"USD"];
    
    AGTWallet *wallet = [[AGTWallet alloc] initWithAmount:40 currency:@"EUR"];
    [wallet plus: [AGTMoney dollarWithAmount:20]];
    
    AGTMoney *reduced = [broker reduced:wallet toCurrency:@"USD"];
    
    XCTAssertEqualObjects(reduced, [AGTMoney dollarWithAmount:100], @"€40 + $20 = $100 2:1");
    
}

-(void) testCurrencyInMoneys{
    
    NSArray *currencys = [self.wallet currencysInMoneys];
    NSArray *myCurrencys = @[@"USD",@"EUR"];
    
    XCTAssertEqualObjects(currencys, myCurrencys);
}

-(void) testNumberOfMoneyInCurrency{
    
    NSInteger moneys = [self.wallet countMoneysAtCurrency:@"EUR"];
    
    XCTAssertEqual(moneys, 3);
}

-(void) testTakeMoneyAtIndex{
    //Index Comienza en 0
    AGTMoney *money = [self.wallet moneysWithCurrency:@"EUR" atIndex:1];
    
    XCTAssertEqual(money.amount, 10);
}

@end
