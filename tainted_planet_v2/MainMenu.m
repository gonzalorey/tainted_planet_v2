//
//  MainMenu.m
//  tainted_planet_v2
//
//  Created by David Grandes on 7/9/12.
//  Copyright (c) 2012 OLX. All rights reserved.
//

#import "MainMenu.h"
#import "MainMenuBackground.h"
#import "MainMenuHUD.h"

@implementation MainMenu

-(BaseBackground*)getBackground
{
    MainMenuBackground * layer = [MainMenuBackground node]; 
    return [layer autorelease];
}

-(BaseHUD *)getHUD
{
    return [MainMenuHUD node];
}

@end
