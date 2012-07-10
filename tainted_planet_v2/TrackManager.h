//
//  TrackManager.h
//  tainted_planet_v2
//
//  Created by David Grandes on 7/9/12.
//  Copyright (c) 2012 OLX. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "BaseGameObject.h"
#import "BaseShip.h"

@interface TrackManager : CCLayer

+(TrackManager*)getInstance;
-(void)drawTrackLines:(NSMutableArray*)planets;
-(void)position:(BaseGameObject*)obj inTrack:(int)t angle:(float)a fromPlanet:(BaseGameObject*)planet;
-(CGPoint)position:(BaseGameObject *)object inPos:(CGPoint)point;
-(CGFloat)scale:(BaseGameObject*)object withScale:(CGFloat)scale;
-(CGFloat)getSpeedForTrack:(int)track;
-(void)updateShip:(BaseShip*)ship dt:(ccTime)dt;
@end
