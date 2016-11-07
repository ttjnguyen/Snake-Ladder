//
//  Snake.m
//  Snake&Ladder
//
//  Created by Jenny Nguyen on 2016-11-07.
//  Copyright © 2016 LightHouseLabs. All rights reserved.
//

#import "Snake.h"

@implementation Snake

- (instancetype)initWithBoardSize:(int)boardSize andLocation:(int)location
{
    self = [super init];
    if (self) {
        _location = location;
        _returnTo = arc4random_uniform(_location);
    }
    return self;
}
@end
