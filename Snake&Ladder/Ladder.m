//
//  Ladder.m
//  Snake&Ladder
//
//  Created by Jenny Nguyen on 2016-11-05.
//  Copyright © 2016 LightHouseLabs. All rights reserved.
//

#import "Ladder.h"

@implementation Ladder

-(instancetype)initWithBoardSize:(int)boardSize andLocation:(int)location {
    self = [super init];
    if (self) {
        _location ;
        _jumpTo = _location+1+arc4random_uniform(boardSize = _location -1);
    }
    return self;
}

@end
