//
//  AI.m
//  Tic-Tac-Toe
//
//  Created by A-Team Intern on 19.04.21.
//

#import "BotEasy.h"

@implementation BotEasy

-(instancetype)initWithName:(NSString*)playerName andDelegate:(id<InputDelegate>)delegate
{
    if ([super init]) {
        self.playerName = playerName;
        self.inputDelegate = delegate;
    }
    
    return self;
}

-(NSArray<NSNumber *> *)makeMove
{
    NSArray *freeCellCoordinates = self.inputDelegate.moveCoordinates;
    int botChoice = arc4random_uniform((uint32_t)freeCellCoordinates.count);
    NSArray<NSNumber *> *coordinates = freeCellCoordinates[botChoice];
    return coordinates;
}

@end
