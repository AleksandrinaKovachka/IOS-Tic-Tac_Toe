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
    NSArray* freeCells = board.freeCells;
    NSUInteger botChoice = arc4random_uniform(freeCells.count);
    NSArray* cell = freeCells[botChoice];
    [super makeMoveWithCordX:(NSUInteger)cell[0] cordY:(NSUInteger)cell[1] board:board andState:state];
}

@end
