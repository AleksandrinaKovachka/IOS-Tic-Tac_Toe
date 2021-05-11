//
//  Game.h
//  Tic-Tac-Toe
//
//  Created by A-Team Intern on 16.04.21.
//

#import <Foundation/Foundation.h>
#import "GameContainerViewController.h"
#import "Player.h"
#import "Board.h"
#import "BotEasy.h"
#import "Protocols.h"
#import "Move.h"
#import "NotificationNames.h"

NS_ASSUME_NONNULL_BEGIN

@interface Game : NSObject

@property (strong, nonatomic) Board *board;

@property (strong, nonatomic) Player *playerOne;
@property (strong, nonatomic) Player *playerTwo;
@property (strong, nonatomic) Player *currentPlayer;
@property (strong, nonatomic) Player *botPlayer;
@property (strong, nonatomic) NSMutableArray<Move*>* undoStack;
@property (strong, nonatomic) NSMutableArray<Move*>* redoStack;

@property (weak, nonatomic) id<OutputDelegate> outputDelegate;

-(instancetype)initWithInputDelegate:(id<InputDelegate>)iDelegate andOutputDelegate:(id<OutputDelegate>)oDelegate;

-(void)makeMove;
-(BOOL)checkWin;
-(NSString*)gameOver;
-(void)undo;
-(void)redo;

-(void)changePlayerNameWith:(NSString*)name andAnotherPlayerName:(NSString*)anotherName;
-(void)resetPlayers;

//new
-(void)changePlayer;

-(void)pushMoveInUndo:(Move*)move;

-(void)pushMoveInRedo:(Move*)undoMove;

-(Move*)popFromUndo;

-(Move*)popFromRedo;

-(void)clearUndoStack;

-(void)clearRedoStack;


@end

NS_ASSUME_NONNULL_END
