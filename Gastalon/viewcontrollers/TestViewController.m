//
//  TestViewController.m
//  Gastalon
//
//  Created by Daniel García Alvarado on 5/17/15.
//  Copyright (c) 2015 Dragonfly Labs. All rights reserved.
//

#import "TestViewController.h"
#import "Account.h"
#import "OperationTypes.h"

#define kPaginationLimit 20

@interface TestViewController ()

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"En el ambiente de prueba de Realm.io");
    
    for(int i = 0; i < 101; i++){
        Account * account = [[Account alloc] initWithIdUser:@"uuid" andType:TRANSACTION_ADD_ACCOUNT andName:[NSString stringWithFormat:@"Cuenta %d", i] andCoverPhoto:[[NSData alloc] init] andOwnerID:@"uuid" isShared:NO andBalance:1000];
        [RealmFactory insertOrUpdateAccount:account];
    }
    
    RLMArray<Account> * accounts = [RealmFactory getAccountWithOffset:5 andCount:kPaginationLimit];
    if(accounts){
        for(int i = 0; i < accounts.count; i++){
            NSLog(@"Cuenta %i: %@", i, ((Account*)[accounts objectAtIndex:i]).name);
        }
    }else{
        NSLog(@"No hay más datos que mostrar");
    }
    [self clean];
}

-(void)clean{
    [RealmFactory clean];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

@end
