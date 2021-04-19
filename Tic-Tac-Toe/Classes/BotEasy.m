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
        self.symbol = [symbol isEqual:@"O"] ? 0 : 1;
    }
    
    return self;
}


-(void)makeMoveWithCordX:(NSUInteger)cordX cordY:(NSUInteger)cordY andBoard:(Board*)board {
    //need?
}


-(void)computerChoiceWithBoard:(Board*)board {
    //int randPosition; // how to know for the free cells
    
}

@end
