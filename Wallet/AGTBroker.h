//
//  AGTBroker.h
//  Wallet
//
//  Created by Agustín on 04/06/2015.
//  Copyright (c) 2015 Agustin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AGTMoney.h"

@interface AGTBroker : NSObject

@property (nonatomic, strong) NSMutableDictionary *rates;

-(AGTMoney *) reduced: (id<AGTMoney>)money toCurrency:(NSString *) currency;

-(void) addRate: (double) rate
   fromCurrency: (NSString *) fromCurrency
     toCurrency: (NSString *) toCurrency;

-(NSString *) keyFromCurrecy: (NSString *) fromCurrency toCurrency:(NSString *) toCurrency;

-(void) parseJSONRates: (NSData *) json;

@end
