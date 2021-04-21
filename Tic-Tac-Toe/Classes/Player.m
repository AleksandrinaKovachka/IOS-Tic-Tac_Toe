//
//  Player.m
//  Tic-Tac-Toe
//
//  Created by A-Team Intern on 16.04.21.
//

#import "Player.h"

@implementation Player

-(instancetype)initWithName:(NSString*)playerName {
    if ([super init]) {
        self.playerName = playerName;
    }
    
    return self;
}

-(void)makeMoveWithCordX:(int)cordX cordY:(int)cordY board:(Board*)board andState:(EnumCellState)state {
    [board setMoveWithCordX:cordX cordY:cordY andState:state];
}

@end
