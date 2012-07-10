//
//  BaseShip.h
//  tainted_planet_v2
//
//  Created by David Grandes on 7/9/12.
//  Copyright (c) 2012 OLX. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseGameObject.h"

@interface BaseShip : BaseGameObject{
    Heading heading;

}

@property (nonatomic, assign) Heading heading;

@end
