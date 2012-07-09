//
//  AppDelegate.h
//  tainted_planet_v2
//
//  Created by Gonzalo Rey on 7/9/12.
//  Copyright OLX 2012. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RootViewController;

@interface AppDelegate : NSObject <UIApplicationDelegate> {
	UIWindow			*window;
	RootViewController	*viewController;
}

@property (nonatomic, retain) UIWindow *window;

@end
