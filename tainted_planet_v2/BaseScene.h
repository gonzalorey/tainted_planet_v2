//
//  BaseScene.h
//  tainted_planet_v2
//
//  Created by David Grandes on 7/9/12.
//  Copyright (c) 2012 OLX. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "BaseHUD.h"
#import "BaseBackground.h"
#import "BasePlanetaryLayer.h"
#import "BaseStarshipLayer.h"

@interface BaseScene : CCScene{
    
    BaseBackground* backgroundLayer;
    BaseHUD* hudLayer;
    BasePlanetaryLayer * planetaryLayer;
    BaseStarshipLayer* starshipLayer;
}

@property (nonatomic, retain) BaseBackground* background;
@property (nonatomic, retain) BaseHUD* hud;
@property (nonatomic, retain) BasePlanetaryLayer* planetaryLayer;
@property (nonatomic, retain) BaseStarshipLayer* starshipLayer;

-(BaseBackground*)getBackground;
-(BaseHUD*)getHUD;
-(BasePlanetaryLayer*)getPlanetaryLayer;
-(BaseStarshipLayer*)getStarshipLayer;
@end
