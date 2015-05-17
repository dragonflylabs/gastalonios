//
//  RealmFactory.m
//  Gastalon
//
//  Created by Daniel García Alvarado on 5/17/15.
//  Copyright (c) 2015 Dragonfly Labs. All rights reserved.
//

#import "RealmFactory.h"
#import "OperationTypes.h"

@implementation RealmFactory

#pragma mark - Insert and Update
+(void)insertOrUpdateExpense:(Expense*)expense{
    RLMRealm *realm = [RLMRealm defaultRealm];
    [realm beginWriteTransaction];
    [Expense createOrUpdateInRealm:realm withObject:expense];
    [realm commitWriteTransaction];
}

+(void)insertOrUpdateAccount:(Account*)account{
    RLMRealm *realm = [RLMRealm defaultRealm];
    [realm beginWriteTransaction];
    [Account createOrUpdateInRealm:realm withObject:account];
    [realm commitWriteTransaction];
}

+(void)insertOrUpdateTransaction:(Transaction*)transaction{
    RLMRealm *realm = [RLMRealm defaultRealm];
    [realm beginWriteTransaction];
    [Transaction createOrUpdateInRealm:realm withObject:transaction];
    [realm commitWriteTransaction];
}

+(void)insertOrUpdateUser:(User*)user{
    RLMRealm *realm = [RLMRealm defaultRealm];
    [realm beginWriteTransaction];
    [User createOrUpdateInRealm:realm withObject:user];
    [realm commitWriteTransaction];
}

+(void)insertOrUpdateFriend:(Friend*)friendModel{
    RLMRealm *realm = [RLMRealm defaultRealm];
    [realm beginWriteTransaction];
    [Friend createOrUpdateInRealm:realm withObject:friendModel];
    [realm commitWriteTransaction];
}

+(void)insertOrUpdateIncome:(Income*)income{
    RLMRealm *realm = [RLMRealm defaultRealm];
    [realm beginWriteTransaction];
    [Income createOrUpdateInRealm:realm withObject:income];
    [realm commitWriteTransaction];
}

+(void)insertOrUpdateCategoryExpense:(CategoryExpense*)categoryExpense{
    RLMRealm *realm = [RLMRealm defaultRealm];
    [realm beginWriteTransaction];
    [CategoryExpense createOrUpdateInRealm:realm withObject:categoryExpense];
    [realm commitWriteTransaction];
}

+(void)insertOrUpdateCategoryIncome:(CategoryIncome*)categoryIncome{
    RLMRealm *realm = [RLMRealm defaultRealm];
    [realm beginWriteTransaction];
    [CategoryIncome createOrUpdateInRealm:realm withObject:categoryIncome];
    [realm commitWriteTransaction];
}

+(void)insertOrUpdateAlarmLocalExpense:(AlarmLocalExpense*)alarmExpense{
    RLMRealm *realm = [RLMRealm defaultRealm];
    [realm beginWriteTransaction];
    [AlarmLocalExpense createOrUpdateInRealm:realm withObject:alarmExpense];
    [realm commitWriteTransaction];
}

+(void)insertOrUpdateAlarmLocalIncome:(AlarmLocalIncome*)alarmIncome{
    RLMRealm *realm = [RLMRealm defaultRealm];
    [realm beginWriteTransaction];
    [AlarmLocalIncome createOrUpdateInRealm:realm withObject:alarmIncome];
    [realm commitWriteTransaction];
}

#pragma mark Queries by ID

+(Account*)accountForID:(NSString*)idAccount{
    return [Account objectForPrimaryKey:idAccount];
}

+(Account*)accountForGuid:(NSString*)guid{
    return [[Account objectsWithPredicate:[NSPredicate predicateWithFormat:@"guid = %@", guid]] objectAtIndex:0];
}

+(CategoryExpense*)categoryExpenseForID:(NSString*)idCategory{
    return [CategoryExpense objectForPrimaryKey:idCategory];
}

+(CategoryIncome*)categoryIncomeForID:(NSString*)idCategory{
    return [CategoryIncome objectForPrimaryKey:idCategory];
}

+(Expense*)expenseForID:(NSString*)idExpense{
    return [Expense objectForPrimaryKey:idExpense];
}

+(Friend*)friendForID:(NSString*)idFriend{
    return [Friend objectForPrimaryKey:idFriend];
}

+(Income*)incomeForID:(NSString*)idIncome{
    return [Income objectForPrimaryKey:idIncome];
}

+(Transaction*)transactionForID:(NSString*)idTransaction{
    return [Transaction objectForPrimaryKey:idTransaction];
}

+(AlarmLocalIncome*)alarmIncomeForID:(NSString*)idAlarm{
    return [AlarmLocalIncome objectForPrimaryKey:idAlarm];
}

+(AlarmLocalExpense*)alarmExpenseForID:(NSString*)idAlarm{
    return [AlarmLocalExpense objectForPrimaryKey:idAlarm];
}

#pragma mark Delete Queries
+(void)deleteObject:(BaseModel*)object{
    RLMRealm *realm = [RLMRealm defaultRealm];
    [realm beginWriteTransaction];
    [realm deleteObject:object];
    [realm commitWriteTransaction];
}

+(void)clean{
    RLMRealm * realm = [RLMRealm defaultRealm];
    [realm beginWriteTransaction];
    [realm deleteAllObjects];
    [realm commitWriteTransaction];
}

#pragma mark Retrieve Queries

+(RLMArray<Account>*)getAccountWithOffset:(int)offset andCount:(int)numberOfItems{
    RLMResults * accounts = [Account objectsWhere:@"isShared == false"];
    if(offset*numberOfItems > accounts.count)
        return nil;
    return (RLMArray<Account>*)[self objects:accounts withOffset:offset andCount:numberOfItems andClass:[Account className]];
}

+(RLMArray<Account>*)getSharedAccountWithOffset:(int)offset andCount:(int)numberOfItems{
    RLMResults * accounts = [Account objectsWhere:@"isShared == true"];
    if(offset*numberOfItems > accounts.count)
        return nil;
    return (RLMArray<Account>*)[self objects:accounts withOffset:offset andCount:numberOfItems andClass:[Account className]];
}

+(RLMArray<AlarmLocalExpense>*)getExpenseAlarmsWithOffset:(int)offset andCount:(int)numberOfItems{
    RLMResults * accounts = [AlarmLocalExpense allObjects];
    if(offset*numberOfItems > accounts.count)
        return nil;
    return (RLMArray<AlarmLocalExpense>*)[self objects:accounts withOffset:offset andCount:numberOfItems andClass:[AlarmLocalExpense className]];
}

+(RLMArray<AlarmLocalIncome>*)getIncomeAlarmsWithOffset:(int)offset andCount:(int)numberOfItems{
    RLMResults * accounts = [AlarmLocalIncome allObjects];
    if(offset*numberOfItems > accounts.count)
        return nil;
    return (RLMArray<AlarmLocalIncome>*)[self objects:accounts withOffset:offset andCount:numberOfItems andClass:[AlarmLocalIncome className]];
}

+(RLMArray<CategoryExpense>*)getExpenseCategoriesWithOffset:(int)offset andCount:(int)numberOfItems{
    RLMResults * accounts = [CategoryExpense allObjects];
    if(offset*numberOfItems > accounts.count)
        return nil;
    return (RLMArray<CategoryExpense>*)[self objects:accounts withOffset:offset andCount:numberOfItems andClass:[CategoryExpense className]];
}

+(RLMArray<CategoryIncome>*)getIncomeCategoriesWithOffset:(int)offset andCount:(int)numberOfItems{
    RLMResults * accounts = [CategoryIncome allObjects];
    if(offset*numberOfItems > accounts.count)
        return nil;
    return (RLMArray<CategoryIncome>*)[self objects:accounts withOffset:offset andCount:numberOfItems andClass:[CategoryIncome className]];
}

+(RLMArray<Expense>*)getExpensesWithOffset:(int)offset andCount:(int)numberOfItems{
    RLMResults * accounts = [Expense allObjects];
    if(offset*numberOfItems > accounts.count)
        return nil;
    return (RLMArray<Expense>*)[self objects:accounts withOffset:offset andCount:numberOfItems andClass:[Expense className]];
}

+(RLMArray<Friend>*)getFriendsWithOffset:(int)offset andCount:(int)numberOfItems{
    RLMResults * accounts = [Friend allObjects];
    if(offset*numberOfItems > accounts.count)
        return nil;
    return (RLMArray<Friend>*)[self objects:accounts withOffset:offset andCount:numberOfItems andClass:[Friend className]];
}

+(RLMArray<Income>*)getIncomesWithOffset:(int)offset andCount:(int)numberOfItems{
    RLMResults * accounts = [Income allObjects];
    if(offset*numberOfItems > accounts.count)
        return nil;
    return (RLMArray<Income>*)[self objects:accounts withOffset:offset andCount:numberOfItems andClass:[Income className]];
}

+(RLMArray<Transaction>*)getTransactionsWithOffset:(int)offset andCount:(int)numberOfItems{
    RLMResults * accounts = [Transaction allObjects];
    if(offset*numberOfItems > accounts.count)
        return nil;
    return (RLMArray<Transaction>*)[self objects:accounts withOffset:offset andCount:numberOfItems andClass:[Transaction className]];
}

+(RLMArray*)objects:(RLMResults*)objects withOffset:(int)offset andCount:(int)count andClass:(NSString*)className{
    RLMArray * results = [[RLMArray alloc] initWithObjectClassName:className];
    int index = offset * count;
    NSInteger final = (index + count) > objects.count ? objects.count : (index + count);
    for(int i = index; i < final; i++){
        [results addObject:[objects objectAtIndex:i]];
    }
    return results;
}
@end
