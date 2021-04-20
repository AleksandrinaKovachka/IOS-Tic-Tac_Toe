//
//  Player.m
//  Tic-Tac-Toe
//
//  Created by A-Team Intern on 16.04.21.
//

#import "Player.h"

@implementation Player

-(instancetype)initWithName:(NSString*)playerName {//andSymbol:(NSString*)symbol {
    if ([super init]) {
        self.playerName = playerName;
        //self.symbol = [symbol isEqual:@"O"] ? 0 : 1;
    }
    
    return self;
}

-(void)makeMoveWithCordX:(NSUInteger)cordX cordY:(NSUInteger)cordY board:(Board*)board andState:(EnumCellState)state {
    [board setMoveWithCordX:cordX cordY:cordY andState:state];
}

@end
