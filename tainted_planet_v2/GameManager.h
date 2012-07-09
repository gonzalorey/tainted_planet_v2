//
//  GameManager.h
//  tainted_planet_v2
//
//  Created by David Grandes on 7/9/12.
//  Copyright (c) 2012 OLX. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Foundation/Foundation.h>
#import "Constants.h"
#import "BaseScene.h"

@interface GameManager : NSObject {
    SceneTypes currentScene;
}

+(GameManager*)sharedGameManager;
+(void)releaseSharedGameManager;
-(void)runSceneWithID:(SceneTypes)sceneID;
-(BaseScene*)getRunningScene;

@end
