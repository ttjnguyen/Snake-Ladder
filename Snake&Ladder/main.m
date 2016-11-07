//
//  main.m
//  Snake&Ladder
//
//  Created by Jenny Nguyen on 2016-11-05.
//  Copyright © 2016 LightHouseLabs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "InputCollector.h"
#import "GameController.h"
#import "Player.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
            
            InputCollector *inputCollector = [InputCollector new];
            NSString *boardSize;
            NSString *difficulty;
            GameController *gameController;
            NSString *dice;
            
            while (1) {
                boardSize = [inputCollector inputForPrompt:@"\n\nSnakes & Ladders\n\nEnter Board Size. (X) x (X)\n> "];
                
                if ([boardSize intValue]) {
                    gameController = [[GameController alloc] initWithGameBoardSize:[boardSize intValue]];
                    difficulty = [inputCollector inputForPrompt:@"\nEnter Game Difficulty.  (e)asy, (m)edium, (h)ard\n> "];
                    [gameController setDifficultyAndCreateObjects:[gameController stringToGameDifficulty:difficulty]];
                    while (1) {
                        Player *cPlayer = gameController.currentPlayer;
                        printf("\n%s's turn\nPosition: %i\n",[[gameController.currentPlayer name] UTF8String], [cPlayer position]);
                        dice = [inputCollector inputForPrompt:@"Roll a die and input the number.\n>"];
                        
                        if ([dice intValue]) {
                            [gameController move:[dice intValue]];
                            
                            if ([gameController.currentPlayer position] > (gameController.boardSize-1)) {
                                printf("\nGameOver!!! %s wins!", [[gameController.currentPlayer name] UTF8String]);
                                break;
                            }
                            
                            [gameController switchPlayer];
                            
                        }
                    }
                    
                }
            }
        }
            
            
            
            
            
            
            
            
            
        }
        
        
        
    }
    return 0;
}
