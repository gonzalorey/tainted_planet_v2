//
//  BaseStarshipLayer.h
//  tainted_planet_v2
//
//  Created by David Grandes on 7/9/12.
//  Copyright (c) 2012 OLX. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "BaseShip.h"

@interface BaseStarshipLayer : CCLayer{
    BaseShip * ship1;
    BaseShip * ship2;
}

@property (nonatomic, retain) BaseShip* ship1;
@property (nonatomic, retain) BaseShip* ship2;

-(id)init:(BasePlanetaryLayer*)planetaryLayer;
-(BaseShip*)getShip1;
-(BaseShip*)getShip2;
-(void)createShips:(NSMutableArray*)planets;
-(void)update:(ccTime)dt;

@end
