//
//  DBJTile.h
//  AwesomeGame
//
//  Created by David Jordan on 6/18/14.
//  Copyright (c) 2014 dbjAppIndustries. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    mystery,
    monster,
    village,
    cave,
    empty,
    tileTypeCount,
    boss
} TileType;

typedef enum{
    left,
    right,
    up,
    down
} Direction;

@interface DBJTile : NSObject

- (id)initWithTileType:(TileType)type;
- (id)init;

//- (DBJTile *)moveInDirection:(Direction d);

@property TileType type;
@property UIImage *bigBackground;
@property NSString *storyText;
@property NSString *actionText;
@property BOOL canPerformAction;
@property BOOL canMove;

@property DBJTile *leftTile;
@property DBJTile *rightTile;
@property DBJTile *upTile;
@property DBJTile *downTile;



@end
