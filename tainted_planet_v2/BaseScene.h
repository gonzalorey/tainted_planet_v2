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

@interface BaseScene : CCScene{
    
    BaseBackground* backgroundLayer;
    BaseHUD* hudLayer;
}

@property (nonatomic, retain) BaseBackground* background;
@property (nonatomic, retain) BaseHUD* hud;

-(BaseBackground*)getBackground;
-(BaseHUD*)getHUD;
@end
