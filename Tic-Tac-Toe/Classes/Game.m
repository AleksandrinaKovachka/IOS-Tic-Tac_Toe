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
        self.player = [[Player alloc] initWithName:playerName];
        self.board = [[Board alloc] initWithRows:3 andColumns:3];
        self.bot = [[BotEasy alloc] initWithName:@"Bot"];
        self.playerState = [symbol isEqual: @"O"] ? EnumCellStateO : EnumCellStateX;
        self.botState = self.playerState == EnumCellStateX ? EnumCellStateO : EnumCellStateX;
    }
    
    return self;
}

-(NSString*)playWithUserChoice:(NSString*)userChoice {
    [self makeMoveByPlayer:userChoice];
    
    if (self.checkWin) {
        return self.getWinner;
    }
    else if (self.board.isFull){
        return @"The game is over!";
    }
    
    [self makeMoveByBot];
    
    if (self.checkWin) {
        return self.getWinner;
    }
    else if (self.board.isFull){
        return @"The game is over!";
    }
    
    return self.board.description;
}

-(BOOL)checkWin {
    if (self.board.haveWin != EnumCellStateEmpty) {
        return YES;
    }
    
    return NO;
}

-(NSString*)getWinner {
    EnumCellState winState = self.board.haveWin;
    if (winState == self.playerState) {
        return self.player.playerName;
    }
    
    return self.bot.playerName;
}

-(void)makeMoveByPlayer:(NSString*)coordinatesString
{
    NSArray<NSString *> *coordinates = [coordinatesString componentsSeparatedByString:@" "];
    [self.player makeMoveWithCordX:[coordinates[0] intValue] cordY:[coordinates[1] intValue] board:self.board andState:self.playerState];
}

// Code Review: No.
-(void)makeMoveByBot {
    [self.bot computerChoiceWithBoard:self.board andState:self.botState];
}

@end
