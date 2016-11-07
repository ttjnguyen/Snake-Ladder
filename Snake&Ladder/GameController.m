//
//  GameController.m
//  Snake&Ladder
//
//  Created by Jenny Nguyen on 2016-11-07.
//  Copyright © 2016 LightHouseLabs. All rights reserved.
//

#import "GameController.h"

@implementation GameController

#import "Player.h"
#import "Ladder.h"
#import "Snake.h"

@implementation GameController

- (instancetype)initWithGameBoardSize:(int)boardSize;
{
    self = [super init];
    if (self) {
        _playerOne = [[Player alloc] initWithName:@"Player 1"];
        _playerTwo = [[Player alloc] initWithName:@"Player 2"];
        _currentPlayer = _playerOne;
        _boardSize = boardSize * boardSize;
        _gameObjects = [[NSMutableDictionary alloc] init];
    }
    return self;
}

- (void) setDifficultyAndCreateObjects:(GameDifficulty)difficulty {
    int numOfObjects = (int)(self.boardSize / 3) + 1;  //say ~30% of the board will be an object
    int numOfSnakes = 0;
    int numOfLadders = 0;
    
    if (difficulty == Easy) {
        numOfLadders = (int)(numOfObjects * 0.6);
        numOfSnakes = (int)(numOfObjects * 0.4);
    } else if (difficulty == Medium) {
        numOfLadders = (int)(numOfObjects / 2.0);
        numOfSnakes = (int)(numOfObjects / 2.0);
    } else if (difficulty == Hard) {
        numOfLadders = (int)(numOfObjects * 0.4);
        numOfSnakes = (int)(numOfObjects * 0.6);
    }
    
    int newLocation;
    for (int i = 0; i < numOfLadders; i++) {
        
        newLocation = 1+arc4random_uniform(self.boardSize-3);
        while ([self.gameObjects valueForKey:[NSString stringWithFormat:@"%i",newLocation]]) {
            //if object exists in dictionary find another location at random
            newLocation = 1+arc4random_uniform(self.boardSize-3);
        }
        
        Ladder *newLadder = [[Ladder alloc] initWithBoardSize:self.boardSize andLocation:newLocation];
        [self.gameObjects setObject:newLadder forKey:[NSString stringWithFormat:@"%i",newLocation]];
    }
    
    for (int i = 0; i < numOfSnakes; i++) {
        
        newLocation = 1 + arc4random_uniform(self.boardSize-1);
        while ([self.gameObjects valueForKey:[NSString stringWithFormat:@"%i",newLocation]]) {
            //if object exists in dictionary find another location at random
            newLocation = 1 + arc4random_uniform(self.boardSize-1);;
        }
        
        Snake *newSnake = [[Snake alloc] initWithBoardSize:self.boardSize andLocation:newLocation];
        [self.gameObjects setObject:newSnake forKey:[NSString stringWithFormat:@"%i",newLocation]];
    }
}

- (GameDifficulty) stringToGameDifficulty:(NSString *)string {
    if ([string isEqualToString:@"e"]) {
        return Easy;
    } else if ([string isEqualToString:@"m"]) {
        return Medium;
    } else if ([string isEqualToString:@"h"]) {
        return Hard;
    } else {
        return Unknown;
    }
}

- (void) move:(int)spaces {
    Player *player = self.currentPlayer;
    player.position+=spaces;
    
    if ([self.gameObjects valueForKey:[NSString stringWithFormat:@"%i",player.position]]) {
        
        id gObject = [self.gameObjects valueForKey:[NSString stringWithFormat:@"%i",player.position]];
        
        if ([gObject isMemberOfClass:[Snake class]]) {
            Snake *snake = gObject;
            player.position = snake.returnTo;
            printf("\nLanded on a snake.\n");
        } else if ([gObject isMemberOfClass:[Ladder class]]) {
            Ladder *ladder = gObject;
            player.position = ladder.jumpTo;
            printf("\nClimbing a ladder.\n");
        }
    }
    
    printf("New position: %i\n", [self.currentPlayer position]);
}

- (void) switchPlayer {
    if (self.currentPlayer == self.playerOne) {
        self.currentPlayer = self.playerTwo;
    } else {
        self.currentPlayer = self.playerOne;
    }
}

@end
