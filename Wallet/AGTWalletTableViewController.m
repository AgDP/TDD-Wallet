//
//  AGTWalletTableViewController.m
//  Wallet
//
//  Created by Agustín on 04/06/2015.
//  Copyright (c) 2015 Agustin. All rights reserved.
//

#import "AGTWalletTableViewController.h"
#import "AGTWallet.h"
#import "AGTBroker.h"

@interface AGTWalletTableViewController ()
@property (nonatomic,strong) AGTWallet *model;
@end

@implementation AGTWalletTableViewController

-(id)initWithModel:(AGTWallet *)model{
    
    if (self = [super initWithStyle:UITableViewStylePlain]) {
        _model = model;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return [[self.model currencysInMoneys] count] + 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    if (section == 0) {
        return [self.model countMoneysAtCurrency:@"EUR"] + 1;
    }else if (section == 1) {
        return [self.model countMoneysAtCurrency:@"USD"] + 1;
    }else{
        return 1;
    }
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellId = @"CellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        // La tenemos que crear nosotros desde cero
        cell = [[UITableViewCell alloc]
                initWithStyle:UITableViewCellStyleSubtitle
                reuseIdentifier:cellId];
    }
    
    // Configurarla
    AGTMoney *money;
    if (indexPath.section == 0) {
        money = [self.model moneysWithCurrency:@"EUR" atIndex:indexPath.row];
    }else if (indexPath.section == 1) {
        money = [self.model moneysWithCurrency:@"USD" atIndex:indexPath.row];
    }else{
        AGTBroker *broker = [AGTBroker new];
        [broker addRate: 0.5 fromCurrency:@"USD" toCurrency:@"EUR"];
        
        
        money = [broker reduced:self.model toCurrency:@"EUR"];
    }
    

    cell.textLabel.text  = [NSString stringWithFormat:@"%d %@",money.amount, money.currency];
    
    // Devolverla
    return cell;
}

-(NSString*) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return @"EUR";
    }else if (section == 1) {
        return @"USD";
    }else{
        return @"Total Wallet";
    }
}

@end
