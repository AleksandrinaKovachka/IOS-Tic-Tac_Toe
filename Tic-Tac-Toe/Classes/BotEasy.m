//
//  AI.m
//  Tic-Tac-Toe
//
//  Created by A-Team Intern on 19.04.21.
//

#import "BotEasy.h"

@implementation BotEasy

-(instancetype)initWithName:(NSString*)playerName andSymbol:(NSString*)symbol {
    if ([super init]) {
        self.playerName = playerName;
    }
    
    return self;
}

-(void)computerChoiceWithBoard:(Board*)board andState:(EnumCellState)state{
    NSArray* freeCellCoordinates = board.freeCellCoordinates;
    int botChoice = arc4random_uniform(freeCellCoordinates.count);
    NSArray* cell = freeCellCoordinates[botChoice];
    [super makeMoveWithCordX:[cell[0] intValue] cordY:[cell[1] intValue] board:board andState:state];
}

@end
