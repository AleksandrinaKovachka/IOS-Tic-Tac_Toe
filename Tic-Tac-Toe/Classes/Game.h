//
//  Game.h
//  Tic-Tac-Toe
//
//  Created by A-Team Intern on 16.04.21.
//

#import <Foundation/Foundation.h>
#import "Player.h"
#import "Board.h"
#import "BotEasy.h"

NS_ASSUME_NONNULL_BEGIN

@interface Game : NSObject

@property (strong, nonatomic) Player *player;
@property (strong, nonatomic) BotEasy* bot;
@property (strong, nonatomic) Board* board;
@property (nonatomic) EnumCellState playerState;
@property (nonatomic) EnumCellState botState;

-(instancetype)initWithPlayerName:(NSString*)playerName andPlayerSymbol:(NSString*)symbol;

-(NSString*)playWithUserChoice:(NSString*)userChoice;
-(BOOL)checkWin;
-(NSString*)getWinner;
-(void)makeMoveByPlayer:(NSString*)coordinatesString;
// Code Review: the game should not care about whether it's a real player or a bot making the move
-(void)makeMoveByBot;


@end

NS_ASSUME_NONNULL_END
