//
//  BasePlanets.h
//  tainted_planet_v2
//
//  Created by David Grandes on 7/9/12.
//  Copyright (c) 2012 OLX. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface BasePlanetaryLayer : CCLayer{
    NSMutableArray* planets;
}
@property (nonatomic, retain) NSMutableArray* planets;

-(NSMutableArray*)createPlanets;
-(NSMutableArray*)getPlanets;
@end
