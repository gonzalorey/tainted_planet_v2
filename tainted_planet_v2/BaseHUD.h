//
//  BaseHUD.h
//  tainted_planet_v2
//
//  Created by David Grandes on 7/9/12.
//  Copyright (c) 2012 OLX. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface BaseHUD : CCLayer {
        CCMenu* HUD;
}

@property (nonatomic, retain) CCMenu* HUD;

-(void)initHUD;
-(CCMenu*)allocHUD;

@end
