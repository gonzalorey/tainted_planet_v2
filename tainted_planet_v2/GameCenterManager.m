//
//  GameCenterManager.m
//  tainted_planet
//
//  Created by Gonzalo Rey on 7/9/12.
//  Copyright (c) 2012 Big King. All rights reserved.
//

#import "GameCenterManager.h"

@implementation GameCenterManager

// In order to add the rest of the MatchMaking through GameCenter, follow the tutorial in
// http://www.raywenderlich.com/3276/how-to-make-a-simple-multiplayer-game-with-game-center-tutorial-part-12

static GameCenterManager* _instance = nil;

+(GameCenterManager*)getInstance{
    @synchronized([GameCenterManager class])
    {
        if(!_instance){
            _instance = [[self alloc]init];
        }
        return _instance;
    }
    return nil;
}

+(id) alloc{
    @synchronized([GameCenterManager class])
    {
        NSAssert(_instance == nil, @"Attempted to allocate a second instance of GameCenterManager");
        _instance = [super alloc];
        return _instance;
    }
    return nil;
    
}

// method taken straight from Apple’s Game Kit Programming Guide (http://developer.apple.com/library/ios/#documentation/NetworkingInternet/Conceptual/GameKit_Guide/Introduction/Introduction.html#//apple_ref/doc/uid/TP40008304-CH1-SW1).
- (BOOL)isGameCenterAvailable{
    // check for presence of GKLocalPlayer API
    Class gcClass = (NSClassFromString(@"GKLocalPlayer"));
    
    // check if the device is running iOS 4.1 or later
    NSString *reqSysVer = @"4.1";
    NSString *currSysVer = [[UIDevice currentDevice] systemVersion];
    BOOL osVersionSupported = ([currSysVer compare:reqSysVer 
                                           options:NSNumericSearch] != NSOrderedAscending);
    
    return (gcClass && osVersionSupported);
}

-(id)init{
    if(self = [super init]){
        gameCenterAvailable = [self isGameCenterAvailable];
        if(gameCenterAvailable){
            NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
            [nc addObserver:self 
                   selector:@selector(authenticationChanged) 
                       name:GKPlayerAuthenticationDidChangeNotificationName 
                     object:nil];
        }
    }
    
    return self;
}

-(void)authenticationChanged{
    if([GKLocalPlayer localPlayer].isAuthenticated && !userAuthenticated){
        NSLog(@"Authentication changed: player authenticated.");
        userAuthenticated = TRUE;
    }else if([GKLocalPlayer localPlayer].isAuthenticated && userAuthenticated){
        NSLog(@"Authentication changed: player not authenticated.");
        userAuthenticated = FALSE;
    }
}

-(void)authenticateLocalUser{
    if(!gameCenterAvailable)
        return;
    
    NSLog(@"Authenticating local user...");
    if([GKLocalPlayer localPlayer].authenticated == NO){
        // it doesn't pass a completion handler since it's already suscribed to the 
        // authentication changed event notification
        [[GKLocalPlayer localPlayer] authenticateWithCompletionHandler:nil];
    }else{
        NSLog(@"Already authenticated");
    }
}

@end
