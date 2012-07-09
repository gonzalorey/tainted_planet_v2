//
//  BaseHUD.m
//  tainted_planet_v2
//
//  Created by David Grandes on 7/9/12.
//  Copyright (c) 2012 OLX. All rights reserved.
//

#import "BaseHUD.h"

@implementation BaseHUD

@synthesize  HUD;

-(id)init{
    self = [super init];
    if(self != nil){
        self.HUD = [self allocHUD];
        [self initHUD];
        [self addChild:self.HUD z:0 tag:-1];
        
    }
    return self;
}

-(void)initHUD
{
    return;
}

-(CCMenu*)allocHUD
{
    return nil;
}



@end
