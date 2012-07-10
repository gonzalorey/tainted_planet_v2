//
//  BasePlanets.m
//  tainted_planet_v2
//
//  Created by David Grandes on 7/9/12.
//  Copyright (c) 2012 OLX. All rights reserved.
//

#import "BasePlanetaryLayer.h"
#import "BaseGameObject.h"

@implementation BasePlanetaryLayer

@synthesize planets;

-(id)init{
    self = [super init];
    if(self != nil){
        
        self.planets = [self createPlanets];
        for(BaseGameObject * planet in self.planets)
        {
            [self addChild:planet z:0  tag:0];
            
        }
    }
    return self;
}

-(void)dealloc
{
    [self.planets release];
    [super dealloc];
}
-(NSMutableArray*)getPlanets
{ 
    return self.planets;
}

-(NSMutableArray*)createPlanets
{
    return nil;
}



@end
