//
//  InputCollector.h
//  Snake&Ladder
//
//  Created by Jenny Nguyen on 2016-11-07.
//  Copyright © 2016 LightHouseLabs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface InputCollector : NSObject

- (id) init;

@property BOOL quit;

-(NSString *)inputForPrompt:(NSString *)promptString;

@end
