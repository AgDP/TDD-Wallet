//
//  AGTControllersTests.m
//  Wallet
//
//  Created by Agustín on 04/06/2015.
//  Copyright (c) 2015 Agustin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "AGTSimpleViewController.h"
#import "AGTWalletTableViewController.h"
#import "AGTWallet.h"

@interface AGTControllersTests : XCTestCase
@property (nonatomic, strong) AGTSimpleViewController *simpleVC;
@property (nonatomic,strong) UIButton *button;
@property (nonatomic,strong) UILabel *label;

@property(nonatomic, strong) AGTWalletTableViewController *walletVC;
@property (nonatomic,strong) AGTWallet *wallet;
@end

@implementation AGTControllersTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    //CREamos el entorno de laboratorio
    self.simpleVC = [[AGTSimpleViewController alloc] initWithNibName:nil bundle:nil];
    self.button = [UIButton buttonWithType: UIButtonTypeRoundedRect];
    [self.button setTitle:@"Hello" forState:UIControlStateNormal];
    
    self.label = [[UILabel alloc] initWithFrame:CGRectZero];
    self.simpleVC.displayLabel = self.label;
    
    self.wallet = [[AGTWallet alloc] initWithAmount:1 currency:@"USD"];
    [self.wallet plus: [AGTMoney euroWithAmount:1]];
    self.walletVC = [[AGTWalletTableViewController alloc] initWithModel:self.wallet];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
    
    //Lo destruimos
    self.simpleVC = nil;
    self.button = nil;
    self.label = nil;
}

-(void) testThattextOnLabelIdEqualtoTextButton{
    
    //Mandamos el mensaje
    [self.simpleVC displayText:self.button];
    
    //Comprobamos que se etiqueta y el boton tienen el mismo texto
    XCTAssertEqualObjects(self.button.titleLabel.text, self.label.text, @"Button and label should have the same text");
}

/*
-(void) testThatTableHasOneSection{
    
    NSInteger sections = [self.walletVC numberOfSectionsInTableView:nil];
    
    XCTAssertEqual(sections, 1, @"There can only be one");
}
*/

-(void) testThatNumberOfCellsIsNumberOfMoneyPlusOne{
    
    XCTAssertEqual(self.wallet.count, [self.walletVC tableView:nil numberOfRowsInSection:0], @"Number of cells is the number of moneys plus 1 (the total)");
}

-(void) testThatTableHasCurrecnyPlusOneSections{
    
    NSInteger sections = [self.walletVC numberOfSectionsInTableView:nil];
    NSInteger currencys = [[self.wallet currencysInMoneys] count]+ 1;
    
    XCTAssertEqual(sections,currencys, @"Number of sections is equal to number of currencys");
}

@end
