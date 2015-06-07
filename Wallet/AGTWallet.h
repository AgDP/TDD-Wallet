//
//  AGTWallet.h
//  Wallet
//
//  Created by Agustín on 04/06/2015.
//  Copyright (c) 2015 Agustin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AGTMoney.h"

@interface AGTWallet : NSObject<AGTMoney>
@property (nonatomic, readonly) NSUInteger count;


-(void) subscribeToMemorywarning:(NSNotificationCenter *) nc;

-(NSArray *) currencysInMoneys;

-(NSInteger) countMoneysAtCurrency: (NSString *) currency;

-(AGTMoney *) moneysWithCurrency: (NSString *) currency atIndex: (NSInteger) index;
@end
