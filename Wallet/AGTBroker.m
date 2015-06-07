//
//  AGTBroker.m
//  Wallet
//
//  Created by Agustín on 04/06/2015.
//  Copyright (c) 2015 Agustin. All rights reserved.
//

#import "AGTBroker.h"
#import "AGTMoney.h"

@interface AGTBroker ()

@end

@implementation AGTBroker

- (instancetype)init
{
    self = [super init];
    if (self) {
        _rates = [@{}mutableCopy];
    }
    return self;
}

-(AGTMoney *) reduced: (id<AGTMoney>)money toCurrency:(NSString *) currency{
   
    //Double dispatch
    return [money reduceToCurrency:currency withBroker:self];
    
}

-(void) addRate: (double) rate
   fromCurrency: (NSString *) fromCurrency
     toCurrency: (NSString *) toCurrency{
    
    [self.rates setObject:@(rate) forKey:[self keyFromCurrecy:fromCurrency toCurrency:toCurrency]];
    [self.rates setObject:@(1.0/rate) forKey:[self keyFromCurrecy:toCurrency toCurrency:fromCurrency]];
}

#pragma mark - Utils
-(NSString *) keyFromCurrecy: (NSString *) fromCurrency toCurrency:(NSString *) toCurrency{
    return [NSString stringWithFormat:@"%@-%@", fromCurrency,toCurrency];
}

#pragma mark - Rates

-(void)parseJSONRates:(NSData *)json{

    NSError *err;
    id obj = [NSJSONSerialization JSONObjectWithData:json options:NSJSONReadingAllowFragments error:&err];
    
    if (obj != nil) {
        //Pillamos los rates y los camos añadiendo al broker
    }else{
        //No hemos recibido nada: la cagamos
        [NSException raise:@"NoRatesInJsonException" format:@"JSON must carry some data!"];
    }
}
@end

