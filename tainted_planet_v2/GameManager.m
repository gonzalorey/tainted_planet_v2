//
//  GameManager.m
//  tainted_planet_v2
//
//  Created by David Grandes on 7/9/12.
//  Copyright (c) 2012 OLX. All rights reserved.
//

#import "GameManager.h"
#import "MainMenu.h"

@implementation GameManager

// singleton instance
static GameManager* _sharedGameManager = nil;

+(GameManager*) sharedGameManager
{
    @synchronized([GameManager class])
    {
        if(!_sharedGameManager)
            [[self alloc] init];
        return _sharedGameManager;
    }
    return nil;
}

+(id) alloc
{
    @synchronized ([GameManager class])
    {
        NSAssert(_sharedGameManager == nil, 
                 @"Attempted to allocate a second instance of the Game Manager singleton");
        _sharedGameManager = [super alloc];
        return _sharedGameManager;
    }
    return nil;
}

+(void)releaseSharedGameManager
{
    @synchronized ([GameManager class])
    {
        [_sharedGameManager release];
        _sharedGameManager = nil;
    }
}

-(id) init
{
    self = [super init];
    if (self) {
        // Game Manager initialized
        CCLOG(@"Game Manager Singleton, init");
        currentScene = kNoSceneUninitialized;
    }
    
    return self;
}

-(void) runSceneWithID:(SceneTypes)sceneID 
{
    SceneTypes oldScene = currentScene;
    currentScene = sceneID;
    
    id sceneToRun = nil;
    switch (sceneID) {
        case kMainMenuScene:
            sceneToRun = [MainMenu node];
            break;
        case kGameLevel1:
            //sceneToRun = [Lvl1World node];
            break;
        default:
            CCLOG(@"Unknown ID, cannot switch scenes");
            return;
            break;
    }

    
    if (sceneToRun == nil) {
        // Revert back, since no new scene was found
        currentScene = oldScene;
        return;
    }
    
    // Menu Scenes have a value of < 100
    if (sceneID < 100) {
        if (UI_USER_INTERFACE_IDIOM() != UIUserInterfaceIdiomPad) { CGSize screenSize =
            [CCDirector sharedDirector].winSizeInPixels;
            if (screenSize.width == 960.0f) {
                // iPhone 4 Retina
                [sceneToRun setScaleX:0.9375f];
                [sceneToRun setScaleY:0.8333f];
                CCLOG(@"GM:Scaling for iPhone 4 (retina)");
            } else {
                [sceneToRun setScaleX:0.4688f];
                [sceneToRun setScaleY:0.4166f];
                CCLOG(@"GM:Scaling for iPhone 3G(non-retina)");
            }
        }
    }
    
    
    if ([[CCDirector sharedDirector] runningScene] == nil) {
        [[CCDirector sharedDirector] runWithScene:sceneToRun];
    } else {
        [[CCDirector sharedDirector] replaceScene:sceneToRun];
    }
    return;
    
}



-(BaseScene*)getRunningScene
{
    return (BaseScene*)[[CCDirector sharedDirector] runningScene];
}

@end
