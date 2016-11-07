//
//  Player.h
//  Snake&Ladder
//
//  Created by Jenny Nguyen on 2016-11-05.
//  Copyright © 2016 LightHouseLabs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Player : NSObject
@property (nonatomic) int position;

@property (nonatomic) NSString *name;

- (instancetype)initWithName:(NSString *)name;

@end
