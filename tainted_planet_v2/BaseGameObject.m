//
//  BaseGameObject.m
//  tainted_planet_v2
//
//  Created by David Grandes on 7/9/12.
//  Copyright (c) 2012 OLX. All rights reserved.
//

#import "BaseGameObject.h"
#import "TrackManager.h"
#import "BaseScene.h"
#import "GameManager.h"


@implementation BaseGameObject

@synthesize mass,filename, relativeScale, direction;

-(id)initWithMass:(float)m scale:(float)s pos:(CGPoint)p file:(NSString *)afilename
{
    [super initWithFile:afilename];
    TrackManager* trackManager = [TrackManager getInstance];
    self.mass = m;
    self.relativeScale = s;
    self.scale = [trackManager scale:self withScale:s];
    self.position =  [trackManager position:self inPos:p];
    return self;
}

-(id)initWithMass:(float)m scale:(float)s track:(int)track angle:(float)angle
             file:(NSString *)afilename planets:(NSMutableArray*)planets direction:(Directions)dir{
    [super initWithFile:afilename];
    TrackManager* trackManager = [TrackManager getInstance];
    self.mass = m;
    self.relativeScale = s;
    self.direction = dir;
    self.scale = [trackManager scale:self withScale:s];
    [trackManager position:self inTrack:track angle:angle fromPlanet:[planets objectAtIndex:0]];

    return self;
}

-(CGPoint)getPosition
{
    return self.position;
}



@end
