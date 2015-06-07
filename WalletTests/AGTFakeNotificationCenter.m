//
//  AGTFakeNotificationCenter.m
//  Wallet
//
//  Created by Agustín on 04/06/2015.
//  Copyright (c) 2015 Agustin. All rights reserved.
//

#import "AGTFakeNotificationCenter.h"

@implementation AGTFakeNotificationCenter

- (id)init
{
    self = [super init];
    if (self) {
        _oberservers = [NSMutableDictionary dictionary];
    }
    return self;
}

-(void)addObserver:(id)observer selector:(SEL)aSelector name:(NSString *)aName object:(id)anObject{
    
    [self.oberservers setValue:observer forKey:aName];
}

@end
