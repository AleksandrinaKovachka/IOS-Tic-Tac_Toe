//
//  Game.m
//  Tic-Tac-Toe
//
//  Created by A-Team Intern on 16.04.21.
//

#import "Game.h"

@interface Game()

@property (strong, nonatomic) Player *playerOne;
@property (strong, nonatomic) Player *playerTwo;
@property (strong, nonatomic) Player *currentPlayer;
@property (strong, nonatomic) Player *botPlayer;
@property (strong, nonatomic) NSMutableArray<Move*>* undoStack;
@property (strong, nonatomic) NSMutableArray<Move*>* redoStack;

@property (weak, nonatomic) id<OutputDelegate> outputDelegate;

@end

@implementation Game

-(instancetype)initWithPlayerName:(NSString*)playerName inputDelegate:(id<InputDelegate>)iDelegate andOutputDelegate:(id<OutputDelegate>)oDelegate
{
    if ([super init]) {
        self.board = [[Board alloc] initWithRows:3 andColumns:3];
        
        self.playerOne = [[Player alloc] initWithName:playerName sigil:@"X" andDelegate:iDelegate];
        self.playerTwo = [[BotEasy alloc] initWithName:@"Bot" sigil:@"O" andDelegate:self.board];
        self.botPlayer = self.playerTwo;
        self.currentPlayer = self.playerOne;
        self.outputDelegate = oDelegate;
        self.undoStack = [[NSMutableArray alloc] init];
        self.redoStack = [[NSMutableArray alloc] init];
        
        
    }
    
    return self;
}

-(void)makeMove
{
    EnumCellState state = EnumCellStateEmpty;
    NSArray<NSNumber *> *coords = [self.currentPlayer makeMove];
    
    if (self.currentPlayer == self.playerOne)
    {
        state = EnumCellStateX;
    }
    else
    {
        state = EnumCellStateO;
    }
    
    [self pushMove:[[Move alloc] initWithCoordinates:coords andCurrentState:state andPreviousState:EnumCellStateEmpty]];

    [self.board setMoveCoordinates:coords andState:state];
    
    if (self.board.isFull || self.checkWin)
    {
        [self.outputDelegate draw];
        [self.outputDelegate drawGameOver];
        return;
    }
    
    if (self.currentPlayer == self.playerOne)
    {
        self.currentPlayer = self.playerTwo;
    }
    else
    {
        self.currentPlayer = self.playerOne;
    }
    
    if (self.currentPlayer == self.botPlayer)
    {
        [self makeMove];
    }
    
    [self.outputDelegate draw];
}

-(BOOL)checkWin {
    if (self.board.hasNoGapsRow || self.board.hasNoGapsColumn || self.board.hasNoGapsDiagonal) {
        return YES;
    }
    
    return NO;
}

-(NSString*)gameOver
{
    if (self.board.isFull) {
        return @"Game is over. The board is full!";
    }
    return self.currentPlayer.playerName;
}

-(void)pushMove:(Move*)move
{
    [self.undoStack addObject:move];
}

-(void)pushInRedo:(Move*)undoMove
{
    [self.redoStack addObject:undoMove];
}

-(Move*)popFromUndo
{
    Move* undoMove = self.undoStack.lastObject;
    [self.undoStack removeLastObject];
    
    return undoMove;
}

-(Move*)popFromRedo
{
    Move* redoMove = self.redoStack.lastObject;
    [self.redoStack removeLastObject];
    
    return redoMove;
}

-(void)undo
{
    if (self.playerTwo == self.botPlayer)
    {
        Move* moveBot = [self popFromUndo];
        Move* undoMoveBot = moveBot.opposite;
        [self.board setMoveCoordinates:undoMoveBot.coordinates andState:undoMoveBot.currentState];
    }
    
    Move* move = [self popFromUndo];
    Move* undoMove = move.opposite;
    [self.board setMoveCoordinates:undoMove.coordinates andState:undoMove.currentState];
    [self.playerOne changeScoreWith:(-1)];

    [self pushInRedo:move];
}

-(void)redo
{
    Move* move = [self popFromRedo];
    [self.board setMoveCoordinates:move.coordinates andState:move.currentState];
    [self pushMove:move];
    [self.playerOne changeScoreWith:1];
    
    //change player
    if (self.currentPlayer == self.playerOne)
    {
        self.currentPlayer = self.playerTwo;
    }
    
    [self makeMove]; //for bot
}

-(void)changePlayerNameWith:(NSString*)name
{
    self.playerOne.playerName = name;
}

-(NSString*)getPlayerName
{
    return self.currentPlayer.playerName;
}

-(void)resetPlayerScore
{
    [self.playerOne changeScoreWith:0];
}

@end
