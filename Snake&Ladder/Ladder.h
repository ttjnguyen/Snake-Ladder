//
//  Ladder.h
//  Snake&Ladder
//
//  Created by Jenny Nguyen on 2016-11-05.
//  Copyright © 2016 LightHouseLabs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Ladder : NSObject

@property (nonatomic) int jumpTo;
@property (nonatomic) int location;

-(instancetype)initWithBoardSize:(int)boardSize andLocation:(int)location;

@end
