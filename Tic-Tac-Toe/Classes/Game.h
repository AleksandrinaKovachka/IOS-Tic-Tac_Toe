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
@property (strong, nonatomic) BotEasy* computer;
@property (strong, nonatomic) Board* board;

-(instancetype)initWithPlayerName:(NSString*)playerName andPlayerSymbol:(NSString*)symbol;

-(void)play;
-(BOOL)checkWin;
-(void)makeMoveByPlayer:(NSString*)coordinates; //text by textField - call player makeMove
-(void)makeMoveByBot;



@end

NS_ASSUME_NONNULL_END
