//
//  GameController.h
//  Snake&Ladder
//
//  Created by Jenny Nguyen on 2016-11-07.
//  Copyright © 2016 LightHouseLabs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameController : NSObject

@class Player;

typedef enum {
    Easy,
    Medium,
    Hard,
    Unknown
} GameDifficulty;

@interface GameController : NSObject

@property (nonatomic, strong) NSMutableDictionary *gameObjects;
@property (nonatomic, strong) Player *playerOne;
@property (nonatomic, strong) Player *playerTwo;
@property (nonatomic, strong) Player *currentPlayer;
@property (nonatomic) int boardSize;

- (instancetype)initWithGameBoardSize:(int)boardSize;
- (void) setDifficultyAndCreateObjects:(GameDifficulty)difficulty;
- (GameDifficulty) stringToGameDifficulty:(NSString *)string;
- (void) move:(int)spaces;
- (void) switchPlayer;

@end
