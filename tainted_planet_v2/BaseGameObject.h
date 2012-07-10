//
//  BaseGameObject.h
//  tainted_planet_v2
//
//  Created by David Grandes on 7/9/12.
//  Copyright (c) 2012 OLX. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Constants.h"

@interface BaseGameObject : CCSprite{
    float mass;
    NSString* filename;
    CGFloat relativeScale;
    Directions direction;
    int track;
    float angle;
    CGPoint origin;
}


@property (nonatomic, assign) float mass;
@property (nonatomic, retain) NSString* filename;
@property (nonatomic, assign) CGFloat relativeScale;
@property (nonatomic, assign) Directions direction;
@property (nonatomic, assign) int track;
@property (nonatomic, assign) float angle;
@property (nonatomic, assign) CGPoint origin;

-(id)initWithMass:(float)m scale:(float)s pos:(CGPoint)p file:(NSString *)afilename;
-(id)initWithMass:(float)m scale:(float)s track:(int)track angle:(float)angle
             file:(NSString *)afilename planets:(NSMutableArray*)planets direction:(Directions)dir;
-(CGPoint)getPosition;
@end
