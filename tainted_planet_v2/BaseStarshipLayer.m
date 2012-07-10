//
//  BaseStarshipLayer.m
//  tainted_planet_v2
//
//  Created by David Grandes on 7/9/12.
//  Copyright (c) 2012 OLX. All rights reserved.
//
#import "BaseScene.h"
#import "GameManager.h"
#import "BaseStarshipLayer.h"
#import "BasePlanetaryLayer.h"
#import "TrackManager.h"
@implementation BaseStarshipLayer

@synthesize ship1, ship2;

-(id)init:(BasePlanetaryLayer*)planetaryLayer{
    self = [super init];
    if(self != nil){
        [self createShips:[planetaryLayer getPlanets]];
        
        if(self.ship1)
            [self addChild:self.ship1 z:0  tag:0];
        if(self.ship2)
            [self addChild:self.ship2 z:0  tag:0];
        
        
    }
    return self;
}

-(void)createShips:(NSMutableArray*)planets
{
    
}

-(BaseShip*)getShip1
{
    return ship1;
}

-(BaseShip*)getShip2
{
    return ship2;
}

-(void)update:(ccTime)dt{
    TrackManager* tm = [TrackManager getInstance];
    [tm updateShip:ship1 dt:dt]; 
    [tm updateShip:ship2 dt:dt];
}

-(void)dealloc
{
    [ship1 release];
    [ship2 release];
    [super dealloc];
}

@end
