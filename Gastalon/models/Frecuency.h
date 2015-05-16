//
//  Frecuency.h
//  Gastalon
//
//  Created by Daniel García Alvarado on 4/16/15.
//  Copyright (c) 2015 Dragonfly Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

#define FRECUENCY_DAILY 1
#define FRECUENCY_WEEKLY 2
#define FRECUENCY_EVERY_TWO_WEEKS 3
#define FRECUENCY_MONTHLY 4
#define FRECUENCY_BIMONTHLY 5
#define FRECUENCY_EACH_THREE_MONTHS 6
#define FRECUENCY_SIXTLY 7
#define FRECUENCY_EACH_YEAR 8

@interface Frecuency : NSObject

@property (nonatomic, strong) NSString * name;
@property (nonatomic, assign) int idFrecuency;

@end
