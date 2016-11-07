//
//  Player.m
//  Snake&Ladder
//
//  Created by Jenny Nguyen on 2016-11-05.
//  Copyright © 2016 LightHouseLabs. All rights reserved.
//

#import "Player.h"

@implementation Player

-(instancetype)initWithName:(NSString *)name {
    
    self = [super init];
    if (self) {
        _position = 0;
        _name = name;
    }
    return self;
}


@end
