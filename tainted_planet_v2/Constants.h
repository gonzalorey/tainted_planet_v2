//
//  Constants.h
//  tainted_planet_v2
//
//  Created by David Grandes on 7/9/12.
//  Copyright (c) 2012 OLX. All rights reserved.
//

#ifndef tainted_planet_v2_Constants_h
#define tainted_planet_v2_Constants_h

#define kMainMenuTagValue 10
#define kSceneMenuTagValue 20

#define PTM_RATIO 32

#define GRAVITIC_DRIVE 100.0f

#define PLANET_TAG 1
#define OBJECT_TAG 2
#define POWERUP_TAG 3

#define TRACK_LINES 5
#define TRACK_OFFSET 20
#define TRACK_STARTING_DIST 50
#define TRACK_THETA  12

//Vector goes from a to b
#define CGPOINT_SUB(a,b) CGPointMake(b.x - a.x, b.y - a.y)

typedef enum {
    kBaseTestWorld=-1,
    kNoSceneUninitialized=0,
    kMainMenuScene=1,
    kGameLevel1=101,
} SceneTypes;

typedef enum {
    CLOCKWISE=0,
    COUNTER_CLOCKWISE = 1,
} Directions;

#define DEGREES_TO_RADIANS(__ANGLE__)((__ANGLE__)/180.0 * M_PI)

#endif
