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
        self.player = [self.player initWithName:playerName];
        self.board = [self.board initWithRows:3 andColumns:3];
        self.bot = [self.bot initWithName:@"Bot"];
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
    [self makeMoveByBot];
    if (self.checkWin) {
        return self.getWinner;
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
    [self.player makeMoveWithCordX:(NSUInteger)coordinates[0] cordY:(NSUInteger)coordinates[1] board:self.board andState:self.playerState];
}

-(void)makeMoveByBot {
    [self.bot computerChoiceWithBoard:self.board andState:self.botState];
}

@end
