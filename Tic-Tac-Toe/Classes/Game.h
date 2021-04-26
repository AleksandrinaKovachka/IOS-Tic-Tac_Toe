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
#import "Protocols.h"

NS_ASSUME_NONNULL_BEGIN

@interface Game : NSObject

@property (strong, nonatomic) Board *board;

-(instancetype)initWithPlayerName:(NSString*)playerName inputDelegate:(id<InputDelegate>)iDelegate andOutputDelegate:(id<OutputDelegate>)oDelegate;

-(void)makeMove;
-(BOOL)checkWin;
//-(NSString*)gameOver;


@end

NS_ASSUME_NONNULL_END
