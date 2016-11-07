//
//  InputCollector.m
//  Snake&Ladder
//
//  Created by Jenny Nguyen on 2016-11-07.
//  Copyright © 2016 LightHouseLabs. All rights reserved.
//

#import "InputCollector.h"

@implementation InputCollector

- (id) init {
    self = [super init];
    if (self) {
        self.quit = NO;
    }
    return self;
}

-(NSString *)inputForPrompt:(NSString *)promptString {
    printf("%s",[promptString UTF8String]);
    
    char inputChars[255];
    
    fgets(inputChars, 255, stdin);
    
    NSString *inputString = [NSString stringWithUTF8String:inputChars];
    inputString = [inputString stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    
    return inputString;
}

@end
