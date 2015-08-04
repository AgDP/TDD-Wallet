//
//  AGTMoney.h
//  Wallet
//
//  Created by Agustín on 01/06/2015.
//  Copyright (c) 2015 Agustin. All rights reserved.
//

#import <Foundation/Foundation.h>
@class AGTMoney;
@class AGTBroker;

@protocol AGTMoney <NSObject>

-(id) initWithAmount: (NSUInteger) amount currency: (NSString *) currency;

-(id<AGTMoney>) times: (NSUInteger) multiplier;

-(id<AGTMoney>) plus: (AGTMoney *) other;

-(id<AGTMoney>) reduceToCurrency:(NSString *) currency withBroker: (AGTBroker *) broker;

@end

@interface AGTMoney : NSObject<AGTMoney>

@property (copy, readonly) NSString *currency;
@property (nonatomic, strong, readonly) NSNumber *amount;

+(instancetype) dollarWithAmount: (NSUInteger) amount;
+(instancetype) euroWithAmount: (NSUInteger) amount;



@end
