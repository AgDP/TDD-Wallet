//
//  AGTFakeNotificationCenter.h
//  Wallet
//
//  Created by Agustín on 04/06/2015.
//  Copyright (c) 2015 Agustin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AGTFakeNotificationCenter : NSObject
@property (nonatomic, strong) NSDictionary *oberservers;

-(void) addObserver:(id) observer selector:(SEL) aSelector name:(NSString *)aName object:(id)anObject;

@end
