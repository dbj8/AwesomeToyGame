//
//  DBJWeapon.h
//  AwesomeGame
//
//  Created by David Jordan on 6/18/14.
//  Copyright (c) 2014 dbjAppIndustries. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DBJWeapon : NSObject

@property NSString *name;
@property int attackBonus;

-(id) initWithName:(NSString *)name withDamageBonus:(int)damageBonus;


@end
