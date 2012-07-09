//
//  BaseBackground.m
//  tainted_planet_v2
//
//  Created by David Grandes on 7/9/12.
//  Copyright (c) 2012 OLX. All rights reserved.
//

#import "BaseBackground.h"

@implementation BaseBackground

-(id)init{
    self = [super init];
    if(self != nil){
        
        CCSprite * backgroundImage;
        NSString * backgroundImageName = [self getBackgroundImageName];
        if(backgroundImageName != nil){        
            backgroundImage = [CCSprite spriteWithFile:backgroundImageName];
            CGSize screenSize = [[CCDirector sharedDirector] winSize];
            [backgroundImage setPosition:CGPointMake(screenSize.width/2.0f, screenSize.height/2)];
            [self addChild:backgroundImage z:0  tag:0];
        }
    }
    return self;
}

-(NSString*)getBackgroundImageName
{
    return nil;
}
@end
