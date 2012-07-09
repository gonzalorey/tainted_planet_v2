//
//  BaseScene.m
//  tainted_planet_v2
//
//  Created by David Grandes on 7/9/12.
//  Copyright (c) 2012 OLX. All rights reserved.
//

#import "BaseScene.h"

@implementation BaseScene

@synthesize hud, background;


-(id)init {
    self = [super init]; 
    if (self != nil) {
    }
    
    self.background = [self getBackground];
    
    self.hud = [self getHUD];
    
    if(self.background)
        [self addChild:background z:-10]; 
    
    if(self.hud)
        [self addChild:self.hud z:10];
    return self;
} 


-(BaseBackground*)getBackground{
    return nil;
}

-(BaseHUD*)getHUD{
    return nil;
}
@end
