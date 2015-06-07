//
//  AGTWalletTableViewController.h
//  Wallet
//
//  Created by Agustín on 04/06/2015.
//  Copyright (c) 2015 Agustin. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AGTWallet;

@interface AGTWalletTableViewController : UITableViewController

-(id) initWithModel:(AGTWallet *) model;
@end
