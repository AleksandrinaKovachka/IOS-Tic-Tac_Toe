//
//  Game.m
//  Tic-Tac-Toe
//
//  Created by A-Team Intern on 16.04.21.
//

#import "Game.h"

@implementation Game

-(instancetype)initWithPlayerName:(NSString*)playerName andPlayerSymbol:(NSString*)symbol {
    if ([super init]) {
        self.player = [self.player initWithName:playerName]; //andSymbol:symbol];
        self.board = [self.board initWithRows:3 andColumns:3];
        self.computer = [self.computer initWithName:@"Bot"]; //andSymbol: [symbol isEqual: @"O"] ? @"X" : @"O"];
        self.playerState = [symbol isEqual: @"O"] ? EnumCellStateO : EnumCellStateX;
        self.botState = self.playerState == EnumCellStateX ? EnumCellStateO : EnumCellStateX;
    }
    
    return self;
}


//-(void)play;


-(BOOL)checkWin {
    return self.board.haveWin;
}


-(void)makeMoveByPlayer:(NSString*)coordinates {
    //"1 0"
    //NSUInteger cordX = [coordinates substringWithRange:1];
    
}

-(void)makeMoveByBot {
    //[self.computer computerChoiceWithBoard:self.board];
}

@end
