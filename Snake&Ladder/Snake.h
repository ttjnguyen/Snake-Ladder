//
//  Snake.h
//  Snake&Ladder
//
//  Created by Jenny Nguyen on 2016-11-07.
//  Copyright © 2016 LightHouseLabs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Snake : NSObject

@property (nonatomic) int returnTo;
@property (nonatomic) int location;

- (instancetype)initWithBoardSize:(int)boardSize andLocation:(int)location;
@end
