//
//  Lvl1.m
//  tainted_planet_v2
//
//  Created by David Grandes on 7/9/12.
//  Copyright (c) 2012 OLX. All rights reserved.
//

#import "Lvl1.h"
#import "TrackManager.h"
#import "BaseStarshipLayer.h"
#import "Constants.h"

#pragma mark BACKGROUND

@interface Lvl1Background : BaseBackground {
@private

}
@end

@implementation Lvl1Background

-(NSString *)getBackgroundImageName
{
    return @"background1.png";
}

@end

#pragma mark STARSHIP

@interface Lvl1StarshipLayer : BaseStarshipLayer {
@private
}
@end

@implementation Lvl1StarshipLayer

-(void)createShips:(NSMutableArray*)planets{
    self.ship1 = [[BaseShip alloc] initWithMass:1.0f scale:0.1f track:2 
                                          angle:0 file:@"ship.png" planets:planets direction:CLOCKWISE];
    self.ship2 = [[BaseShip alloc] initWithMass:1.0f scale:0.1f track:2 
                                          angle:180 file:@"spaceship.png" planets:planets direction:COUNTER_CLOCKWISE];
}

@end

#pragma mark PLANETARY
@interface Lvl1PlanetaryLayer : BasePlanetaryLayer {
@private
}
@end

@implementation Lvl1PlanetaryLayer

-(NSMutableArray *)createPlanets
{
    NSMutableArray* myplanets = [[NSMutableArray alloc]init];
    
    [myplanets addObject:[[BaseGameObject alloc] initWithMass:100 scale:0.125f pos:CGPointMake(0.5f, 0.5f)                                                               file:@"planet1.png"]];
    
    return [myplanets autorelease];
}

@end

#pragma mark LEVEL

@implementation Lvl1

-(BaseBackground*)getBackground{
    return [Lvl1Background node];
}

-(BasePlanetaryLayer*)getPlanetaryLayer{
    return [Lvl1PlanetaryLayer node];
}

-(BaseStarshipLayer*)getStarshipLayer{
    return [[[Lvl1StarshipLayer alloc] init:self.planetaryLayer] autorelease];
}
-(void)draw{
    [[TrackManager getInstance]drawTrackLines:[self.planetaryLayer getPlanets]];
}
@end
