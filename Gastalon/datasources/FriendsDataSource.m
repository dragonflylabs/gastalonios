//
//  FriendsDataSource.m
//  Gastalon
//
//  Created by Daniel García Alvarado on 5/17/15.
//  Copyright (c) 2015 Dragonfly Labs. All rights reserved.
//

#import "FriendsDataSource.h"

@implementation FriendsDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.friends.count;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * identifier = @"CellFriend";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    return cell;
}

@end
