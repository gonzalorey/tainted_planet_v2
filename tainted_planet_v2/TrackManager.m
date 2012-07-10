//
//  TrackManager.m
//  tainted_planet_v2
//
//  Created by David Grandes on 7/9/12.
//  Copyright (c) 2012 OLX. All rights reserved.
//

#import "TrackManager.h"
#import "Constants.h"

@implementation TrackManager

static TrackManager* _instance = nil;

+(TrackManager*)getInstance
{
    @synchronized([TrackManager class])
    {
        if(!_instance){
            [[self alloc]init];
        }
        return _instance;
    }
    return nil;
}

+(id) alloc{
    @synchronized([TrackManager class])
    {
        NSAssert(_instance == nil, @"Attempted to allocate a second instance of TrackManager");
        _instance = [super alloc];
        return _instance;
    }
    return nil;
    
}

-(void)drawTrackLines:(NSMutableArray*) planets {
    glLineWidth(0.5);
    glColor4ub(32, 32, 32, 1);
    
    for(BaseGameObject * planet in planets){
        for (int i = 0; i < TRACK_LINES; i++) {
            ccDrawCircle([planet getPosition], TRACK_STARTING_DIST + i*TRACK_OFFSET, 1, 50, NO);
        }
        
        int normal_tl_qty = 360 / TRACK_THETA;
        float x = [planet getPosition].x;
        float y = [planet getPosition].y;
        for (int i = 0; i < normal_tl_qty; i++){
            float r2 = TRACK_LINES * TRACK_OFFSET + TRACK_STARTING_DIST;
            float r1 = TRACK_STARTING_DIST - TRACK_OFFSET/2;
            float angle = DEGREES_TO_RADIANS(i*TRACK_THETA);
            float x1 = r1 * cos(angle) + x;
            float y1 = r1 * sin(angle) + y;
            float x2 = r2 * cos(angle) + x;
            float y2 = r2 * sin(angle) + y;
            
            ccDrawLine(ccp(x1,y1), ccp(x2,y2));
        }
    }
}

-(void)position:(BaseGameObject*)obj inTrack:(int)t angle:(float)a fromPlanet:(BaseGameObject*)planet;
{
    float radians = DEGREES_TO_RADIANS(a);
    CGPoint origin = [planet getPosition];
    
    float radius = TRACK_STARTING_DIST + TRACK_OFFSET * (t - 1);
    float x = radius * cos(radians) + origin.x;
    float y = radius * sin(radians) + origin.y;
    
    CGPoint pos = CGPointMake(x,y);
    [obj setPosition:pos];
    if(obj.direction == COUNTER_CLOCKWISE)
        [obj setRotation:180];
    
}

-(CGPoint)position:(BaseGameObject *)object inPos:(CGPoint)point
{
    CGRect screen = [[UIScreen mainScreen] bounds];
    CGPoint transPos = CGPointMake(screen.size.height * point.x, screen.size.width * point.y);
    return transPos;
}

-(CGFloat)scale:(BaseGameObject*)object withScale:(CGFloat)scale
{
    CGRect textRect = object.textureRect;
    CGRect screen = [[UIScreen mainScreen] bounds];
    CGFloat expectedWidth = screen.size.width * scale;
    CGFloat newScale = expectedWidth / textRect.size.width;
    return newScale;
    
}

-(CGFloat)box2Dradius:(BaseGameObject*)object
{
    CGRect screen = [[UIScreen mainScreen] bounds];
    CGFloat maxMeters = screen.size.height / PTM_RATIO / 2;
    CGFloat radius = maxMeters * object.relativeScale;
    return radius;
}

@end
