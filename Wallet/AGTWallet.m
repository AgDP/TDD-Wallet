//
//  AGTWallet.m
//  Wallet
//
//  Created by Agustín on 04/06/2015.
//  Copyright (c) 2015 Agustin. All rights reserved.
//

#import "AGTWallet.h"
@import UIKit;

@interface AGTWallet ()
@property (nonatomic, strong) NSMutableArray *moneys;


@end

@implementation AGTWallet

-(NSUInteger) count{
    return [self.moneys count];
}



-(id)initWithAmount:(NSUInteger)amount currency:(NSString *)currency{

    if (self = [super init]) {
        _moneys = [NSMutableArray array];
        
        AGTMoney *money = [[AGTMoney alloc] initWithAmount:amount currency:currency];
        [_moneys addObject:money];


    }
    
    return self;

}

-(id<AGTMoney>)plus:(AGTMoney *)other{
    [self.moneys addObject:other];
    
    return self;
}

-(id<AGTMoney>)times:(NSUInteger)multiplier{
    
    NSMutableArray *newMoneys = [NSMutableArray arrayWithCapacity:self.moneys.count];
    
    for (AGTMoney *each in self.moneys) {
        AGTMoney *newMoney = [each times:multiplier];
        [newMoneys addObject:newMoney];
    }
    
    self.moneys = newMoneys;
    
    
    return self;
}

-(id<AGTMoney>)reduceToCurrency:(NSString *)currency withBroker:(AGTBroker *)broker{

    AGTMoney *result = [[AGTMoney alloc] initWithAmount:0 currency:currency];
    
    for (AGTMoney *each in self.moneys) {
        result = [[each reduceToCurrency:currency withBroker:broker] plus:result];
    }
    
    return result;
}

-(NSArray *) currencysInMoneys{
    
    NSMutableArray *currencys = [NSMutableArray array];
    
    for (AGTMoney *money in self.moneys) {
        [currencys addObject:money.currency];
    }
    
    return [[NSOrderedSet orderedSetWithArray:currencys] array];
    
    
}

-(NSInteger) countMoneysAtCurrency: (NSString *) currency{
    NSInteger count = 0;
    
    for (AGTMoney *m in self.moneys) {
        if ([m.currency isEqualToString:currency]) {
            count = count + 1;
        }
    }
    
    return count;
}

-(AGTMoney *) moneysWithCurrency: (NSString *) currency atIndex: (NSInteger) index{
    AGTMoney *money = nil;
    int count = 0;
    int totalAmount = 0;
    
    for (AGTMoney *m in self.moneys) {
        if ([m.currency isEqualToString:currency]) {
            totalAmount = totalAmount + m.amount;
            if (count == index) {
                money = m;
                break;
            }else{
                count++;
            }
        }
    }
    
    if (!money) {
        money = [[AGTMoney alloc] initWithAmount:totalAmount currency:[NSString stringWithFormat:@"%@ In Total",currency]];
    }
    
    return money;
}

#pragma mark - Notifications
-(void) subscribeToMemorywarning:(NSNotificationCenter *) nc{
    
    [nc addObserver:self
           selector:@selector(dumptoDisk:)
               name:UIApplicationDidReceiveMemoryWarningNotification
             object:nil];
}

-(void) dumptoDisk: (NSNotification *) notification{
    
    //guarda las cosas en disco cuando la cosa se ponga fea
}
@end
