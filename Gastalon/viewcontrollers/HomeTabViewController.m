//
//  HomeTabViewController.m
//  Gastalon
//
//  Created by Mobile Developer on 1/7/15.
//  Copyright (c) 2015 Dragonfly Labs. All rights reserved.
//

#import "HomeTabViewController.h"
#import "MainDataSource.h"
#import <Realm/Realm.h>
#import "OperationTypes.h"
#import "BaseModel.h"
#import "AlarmServerExpense.h"
#import "AlarmServerIncome.h"
#define kTableViewCellHeight 100.0
#import "Colors.h"

@implementation HomeTabViewController{
    NSArray * items;
    MainDataSource * dataSource;
    NSMutableArray * transactions;
}

-(void)viewDidLoad{
    [super viewDidLoad];
    [self designView];
    transactions = [[NSMutableArray alloc] init];
    /*
    Account * account = [[Account alloc] initWithIdUser:1 andType:TRANSACTION_ADD_ACCOUNT andName:@"Home" andCoverPhoto:nil andOwnerID:1 isShared:NO andBalance:100.0];
    [transactions addObject:account];

    Account * sharedAccount = [[Account alloc] initWithIdUser:1 andType:TRANSACTION_ADD_SHARED_ACCOUNT andName:@"Parejita :3" andCoverPhoto:nil andOwnerID:1 isShared:YES andBalance:4000.0];
    [transactions addObject:sharedAccount];
    
    AlarmLocalExpense * alarmExpense = [[AlarmLocalExpense alloc] initWithIdUser:1 andType:TRANSACTION_ALARM_PAY andDateTime:[[NSDate alloc] init] isPayed:NO andAmount:13.4];
    Expense * expenseForAlarm = [[Expense alloc] initWithIdUser:1 andType:TRANSACTION_YOU_HAS_SPENT andAmount:13400 isPeriodically:YES andNote:@"Una nota" isPayed:NO andAccountID:1 andCategoryID:1];
    alarmExpense.expense = expenseForAlarm;
    [transactions addObject:alarmExpense];
    
    Expense * expenseServer = [[Expense alloc] initWithIdUser:1 andType:TRANSACTION_YOU_HAS_SPENT andAmount:13400 isPeriodically:YES andNote:@"Una nota" isPayed:NO andAccountID:1 andCategoryID:1];
    AlarmServerExpense * alarmServerExpense = [[AlarmServerExpense alloc] initWithIdUser:1 andType:TRANSACTION_ALARM_PAY_GROUPAL andDateTime:[[NSDate alloc] init] isPayed:NO andAmount:213.0 andExpense:expenseServer andAccountGuid:@"guid"];
    [transactions addObject:alarmServerExpense];
    
    Income * incomeServer = [[Income alloc] initWithIdUser:1 andType:TRANSACTION_YOU_HAS_GAINED_MONEY andAmount:12345.50 isPeriodically:NO andNote:@"Una nota" isGained:YES andAccountID:1 andCategoryID:1];
    AlarmServerIncome * alarmServerIncome = [[AlarmServerIncome alloc] initWithIdUser:1 andType:TRANSACTION_DID_YOU_GET_GROUP andDateTime:[[NSDate alloc] init] isPayed:NO andAmount:123.50 andIncome:incomeServer andAccountGuid:@"guid"];
    [transactions addObject:alarmServerIncome];
    
    AlarmLocalIncome * alarmIncome = [[AlarmLocalIncome alloc] initWithIdUser:1 andType:TRANSACTION_DID_YOU_GET_THE_MONEY andDateTime:[[NSDate alloc] init] isGained:NO andAmount:145.0];
    Income * incomeForAlarm = [[Income alloc] initWithIdUser:1 andType:TRANSACTION_YOU_HAS_SPENT andAmount:145.0 isPeriodically:NO andNote:@"Otra nota" isGained:NO andAccountID:1 andCategoryID:1];
    alarmIncome.income = incomeForAlarm;
    [transactions addObject:alarmIncome];
    */
    dataSource = [[MainDataSource alloc] initWithTableView:self.mainTableView andHeightCellSize:100.0];
    self.mainTableView.dataSource = dataSource;
    self.mainTableView.delegate = dataSource;
    [dataSource reloadData];
}


-(void)designView{
    float size = ((UIControl*)[_actionButtons objectAtIndex:0]).frame.size.height / 2;
    UIColor* color = [UIColor whiteColor];
    for(UIControl* button in self.actionButtons){
        button.layer.cornerRadius = size;
        button.layer.borderWidth = 2;
        button.layer.borderColor = color.CGColor;
    }
    self.mainTableView.layer.cornerRadius = 3;
}

#pragma mark - Events
SUBSCRIBE(EventTransactionAdded){
    [transactions insertObject:event atIndex:0];
    [self.mainTableView reloadData];
}

- (IBAction)onAddExpenseClick:(id)sender {
    [self showModalControllerWithIdentifier:@"ADDTRANSACTIONCONTROLLER"];
}

- (IBAction)onAddAccountClick:(id)sender {
    [self showModalControllerWithIdentifier:@"ADDACCOUNTCONTROLLER"];
}

- (IBAction)onAddSharedAccountClick:(id)sender {
    [self showModalControllerWithIdentifier:@"ADDSHAREDACCOUNTCONTROLLER"];
}

- (IBAction)onAddIncomeClick:(id)sender {
    [self showModalControllerWithIdentifier:@"ADDTRANSACTIONCONTROLLER"];
}
@end
