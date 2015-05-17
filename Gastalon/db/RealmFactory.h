//
//  RealmFactory.h
//  Gastalon
//
//  Created by Daniel García Alvarado on 5/17/15.
//  Copyright (c) 2015 Dragonfly Labs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseModel.h"
#import "Account.h"
#import "Expense.h"
#import "Transaction.h"
#import "Friend.h"
#import "CategoryExpense.h"
#import "CategoryIncome.h"
#import "AlarmLocalExpense.h"
#import "AlarmLocalIncome.h"
#import "User.h"

@interface RealmFactory : NSObject

/*
 * Simple create or update methods for each model
 */
+(void)insertOrUpdateAccount:(Account*)account;
+(void)insertOrUpdateAlarmLocalExpense:(AlarmLocalExpense*)alarmExpense;
+(void)insertOrUpdateAlarmLocalIncome:(AlarmLocalIncome*)alarmIncome;
+(void)insertOrUpdateCategoryExpense:(CategoryExpense*)categoryExpense;
+(void)insertOrUpdateCategoryIncome:(CategoryIncome*)categoryIncome;
+(void)insertOrUpdateExpense:(Expense*)expense;
+(void)insertOrUpdateFriend:(Friend*)friendModel;
+(void)insertOrUpdateIncome:(Income*)income;
+(void)insertOrUpdateTransaction:(Transaction*)transaction;
+(void)insertOrUpdateUser:(User*)user;
/*
 *  Queries for Single objects based on their ID's or Guid's
 */
+(Account*)accountForID:(NSString*)idAccount;
+(Account*)accountForGuid:(NSString*)guid;
+(AlarmLocalExpense*)alarmExpenseForID:(NSString*)idAlarm;
+(AlarmLocalIncome*)alarmIncomeForID:(NSString*)idAlarm;
+(CategoryExpense*)categoryExpenseForID:(NSString*)idCategory;
+(CategoryIncome*)categoryIncomeForID:(NSString*)idCategory;
+(Expense*)expenseForID:(NSString*)idExpense;
+(Friend*)friendForID:(NSString*)idFriend;
+(Income*)incomeForID:(NSString*)idIncome;
+(Transaction*)transactionForID:(NSString*)idTransaction;

/*
 *  Delete Queries
 */
+(void)deleteObject:(BaseModel*)object;
+(void)clean;

/*
 * Retrieve Queries
 */
+(RLMArray<Account>*)getAccountWithOffset:(int)offset andCount:(int)numberOfItems;
+(RLMArray<Account>*)getSharedAccountWithOffset:(int)offset andCount:(int)numberOfItems;
+(RLMArray<AlarmLocalExpense>*)getExpenseAlarmsWithOffset:(int)offset andCount:(int)numberOfItems;
+(RLMArray<AlarmLocalIncome>*)getIncomeAlarmsWithOffset:(int)offset andCount:(int)numberOfItems;
+(RLMArray<CategoryExpense>*)getExpenseCategoriesWithOffset:(int)offset andCount:(int)numberOfItems;
+(RLMArray<CategoryIncome>*)getIncomeCategoriesWithOffset:(int)offset andCount:(int)numberOfItems;
+(RLMArray<Expense>*)getExpensesWithOffset:(int)offset andCount:(int)numberOfItems;
+(RLMArray<Friend>*)getFriendsWithOffset:(int)offset andCount:(int)numberOfItems;
+(RLMArray<Income>*)getIncomesWithOffset:(int)offset andCount:(int)numberOfItems;
+(RLMArray<Transaction>*)getTransactionsWithOffset:(int)offset andCount:(int)numberOfItems;
@end
