//
//  AGTMoney.m
//  Wallet
//
//  Created by Agustín on 01/06/2015.
//  Copyright (c) 2015 Agustin. All rights reserved.
//

#import "AGTMoney.h"
#import "AGTBroker.h"

@interface AGTMoney ()
@property (nonatomic, strong) NSNumber *amount;
@end

@implementation AGTMoney

+(instancetype) dollarWithAmount: (NSUInteger) amount{

    AGTMoney *dollar = [[AGTMoney alloc] initWithAmount:amount currency:@"USD"];
    
    return dollar;
}

+(instancetype) euroWithAmount: (NSUInteger) amount{
    
    AGTMoney *euro = [[AGTMoney alloc] initWithAmount:amount currency:@"EUR"];
    
    return euro;
}

-(id) initWithAmount: (NSUInteger) amount currency: (NSString *) currency{
    if (self = [super init]) {
        _amount = @(amount);
        _currency = currency;
    }
    
    return self;
}

-(id<AGTMoney>) times: (NSUInteger) multiplier{
    return [[AGTMoney alloc] initWithAmount:[self.amount integerValue] * multiplier currency:self.currency];
    
}

-(id<AGTMoney>) plus: (AGTMoney *) other{
    
    NSInteger totalAmount = [self.amount integerValue] + [other.amount integerValue];
    AGTMoney *total = [[AGTMoney alloc] initWithAmount:totalAmount currency:self.currency];
    
    return total;
}

-(id<AGTMoney>) reduceToCurrency:(NSString *) currency withBroker: (AGTBroker *) broker{
    
    AGTMoney *result;
    double rate = [[broker.rates objectForKey:[broker keyFromCurrecy:self.currency toCurrency:currency]] doubleValue];
    
    //Comprobamos que divisa de origen y de destino son las mismas
    if ([self.currency isEqual:currency]) {
        result = self;
    }else if (rate == 0){
        // No hay tasa de conversion, exception que te crió
        [NSException raise:@"NoconversionRateException" format:@"Must have a conversion from %@ to %@", self.currency, currency];
    }else{
        
        NSInteger newAmount = [self.amount integerValue] * rate;
        
        result = [[AGTMoney alloc] initWithAmount:newAmount currency:currency];
    }
    
    
    
    return result;
}

#pragma mark - Equality

-(NSString *) description{
    
    return [NSString stringWithFormat:@"<%@: %@ %@>",[self class], self.currency, self.amount];
}

-(BOOL) isEqual:(id)object{
    
    if ([self.currency isEqual:[object currency]]) {
        return [self amount] == [object amount];
    }else{
        return NO;
    }
    
}

-(NSUInteger) hash{
    return [self.amount integerValue];
}

@end
