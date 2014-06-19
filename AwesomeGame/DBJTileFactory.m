//
//  DBJTileFactory.m
//  AwesomeGame
//
//  Created by David Jordan on 6/18/14.
//  Copyright (c) 2014 dbjAppIndustries. All rights reserved.
//



#import "DBJTileFactory.h"
#include <stdlib.h>


@implementation DBJTileFactory

+(NSArray *)generateNewTileSetForGame
{
    NSMutableArray *randomArrayOfNewTiles = [[NSMutableArray alloc]init];
    
    for(int i = 0; i < 12; i++)
    {
        DBJTile *newTile;
        //generate random tile type
        TileType newTileType;
        //hard coding for boss/hero locations
        //hero start tile
        if(i == 0)
            newTileType = empty;
        //boss start tile
        else if (i == 11){
            newTileType = boss;
        }
        else
            newTileType = arc4random() % tileTypeCount;
        
        newTile = [[DBJTile alloc] initWithTileType:newTileType];
        
        [randomArrayOfNewTiles addObject:newTile];
        
        NSLog(@"%u",newTileType);
    }
    
    //link tiles
    for(int i = 0; i < 12; i++)
    {
//        DBJTile *tileToConnect = randomArrayOfNewTiles[i];
//        
//        int upTileIndex = i-3;
//        int downTileIndex = i+3;
//        int rightTileIndex = i+1;
//        int leftTileIndex = i-1;
//        
//        if(upTileIndex < 0 || upTileIndex > 11)
//            tileToConnect.upTile = nil;
//        else
//            tileToConnect.upTile = randomArrayOfNewTiles[upTileIndex];
//        
//        if(downTileIndex < 0 || downTileIndex > 11)
//            tileToConnect.downTile = nil;
//        else
//            tileToConnect.downTile = randomArrayOfNewTiles[downTileIndex];
//        
//        if(leftTileIndex < 0 || leftTileIndex > 11)
//            tileToConnect.leftTile = nil;
//        else
//            tileToConnect.leftTile = randomArrayOfNewTiles[leftTileIndex];
//        
//        if(rightTileIndex < 0 || rightTileIndex > 11)
//            tileToConnect.rightTile = nil;
//        else
//            tileToConnect.rightTile = randomArrayOfNewTiles[rightTileIndex];
        
    }
    //removing borders
    ((DBJTile *)randomArrayOfNewTiles[3]).leftTile = nil;
    ((DBJTile *)randomArrayOfNewTiles[6]).leftTile = nil;
    ((DBJTile *)randomArrayOfNewTiles[9]).leftTile = nil;
    ((DBJTile *)randomArrayOfNewTiles[2]).rightTile = nil;
    ((DBJTile *)randomArrayOfNewTiles[5]).leftTile = nil;
    ((DBJTile *)randomArrayOfNewTiles[8]).leftTile = nil;
    
   
    NSArray *tileArrayOne = [[NSArray alloc]initWithObjects:randomArrayOfNewTiles[0],
                        randomArrayOfNewTiles[1],
                        randomArrayOfNewTiles[2],nil];
    NSArray *tileArrayTwo = [[NSArray alloc]initWithObjects:randomArrayOfNewTiles[3],
                        randomArrayOfNewTiles[4],
                        randomArrayOfNewTiles[5],nil];
    NSArray *tileArrayThree = [[NSArray alloc]initWithObjects:randomArrayOfNewTiles[6],
                        randomArrayOfNewTiles[7],
                        randomArrayOfNewTiles[8],nil];
    NSArray *tileArrayFour = [[NSArray alloc]initWithObjects:randomArrayOfNewTiles[9],
                        randomArrayOfNewTiles[10],
                        randomArrayOfNewTiles[11],nil];
    
     NSArray *arrayOfTileArrays = [[NSArray alloc]
        initWithObjects:tileArrayOne,
                        tileArrayTwo,
                        tileArrayThree,
                        tileArrayFour,nil];
    
    return arrayOfTileArrays;
}

@end
