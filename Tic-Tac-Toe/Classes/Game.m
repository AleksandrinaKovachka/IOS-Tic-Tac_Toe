//
//  Game.m
//  Tic-Tac-Toe
//
//  Created by A-Team Intern on 16.04.21.
//

#import "Game.h"
#import "NotificationNames.h"

@interface Game()

@property (strong, nonatomic) Player *playerOne;
@property (strong, nonatomic) Player *playerTwo;
@property (strong, nonatomic) Player *currentPlayer;
@property (strong, nonatomic) Player *botPlayer;
@property (strong, nonatomic) NSMutableArray<Move*>* undoStack;
@property (strong, nonatomic) NSMutableArray<Move*>* redoStack;

//TODO: if stack is empty

@property (weak, nonatomic) id<OutputDelegate> outputDelegate;

@end

@implementation Game

-(instancetype)initWithInputDelegate:(id<InputDelegate>)iDelegate andOutputDelegate:(id<OutputDelegate>)oDelegate
{
    if ([super init]) {
        self.board = [[Board alloc] initWithRows:3 andColumns:3];
        
        self.playerOne = [[Player alloc] initWithName:@"userName" sigil:@"X" andDelegate:iDelegate];
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
    
    [self changePlayer];
    
    if (self.currentPlayer == self.botPlayer)
    {
        [self makeMove];
    }
    
    [self.outputDelegate draw];
}

-(void)changePlayer
{
    if (self.currentPlayer == self.playerOne)
    {
        self.currentPlayer = self.playerTwo;
    }
    else
    {
        self.currentPlayer = self.playerOne;
    }
    [NSNotificationCenter.defaultCenter postNotificationName:NOTIFICATION_SWITCH_PLAYER_NAME object:self.currentPlayer.playerName userInfo:nil];
    [NSNotificationCenter.defaultCenter postNotificationName:NOTIFICATION_SWITCH_PLAYER_SCORE object:[NSNumber numberWithInt:self.currentPlayer.score] userInfo:nil];
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
        return @"Full";
    }
    return self.currentPlayer.playerName;
}

-(void)pushMove:(Move*)move
{
    [self.undoStack addObject:move];
    [NSNotificationCenter.defaultCenter postNotificationName:NOTIFICATION_PUSH_IN_UNDO object:nil userInfo:nil];
}

-(void)pushInRedo:(Move*)undoMove
{
    [self.redoStack addObject:undoMove];
    [NSNotificationCenter.defaultCenter postNotificationName:NOTIFICATION_PUSH_IN_REDO object:nil userInfo:nil];
}

-(Move*)popFromUndo
{
    Move* undoMove = self.undoStack.lastObject;
    [self.undoStack removeLastObject];
    
    if (self.undoStack.count == 0) {
        [NSNotificationCenter.defaultCenter postNotificationName:NOTIFICATION_EMPTY_UNDO object:nil userInfo:nil];
    }
    
    return undoMove;
}

-(Move*)popFromRedo
{
    Move* redoMove = self.redoStack.lastObject;
    [self.redoStack removeLastObject];
    
    if (self.redoStack.count == 0) {
        [NSNotificationCenter.defaultCenter postNotificationName:NOTIFICATION_EMPTY_REDO object:nil userInfo:nil];
    }
    
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
    else
    {
        [self changePlayer];
    }
       
    Move* move = [self popFromUndo];
    Move* undoMove = move.opposite;
    [self.board setMoveCoordinates:undoMove.coordinates andState:undoMove.currentState];
    [self.currentPlayer changeScoreWith:(-1)];

    [self pushInRedo:move];
}

-(void)redo
{
    Move* move = [self popFromRedo];
    [self.board setMoveCoordinates:move.coordinates andState:move.currentState];
    [self pushMove:move];
    [self.playerOne changeScoreWith:1];

    [self changePlayer];
    
    if (self.playerTwo == self.botPlayer)
    {
        [self makeMove];
    }
}

-(void)changePlayerNameWith:(NSString*)name andAnotherPlayerName:(NSString*)anotherName
{
    if ([anotherName isEqual:@"Bot"])
    {
        self.playerTwo = [[BotEasy alloc] initWithName:@"Bot" sigil:@"O" andDelegate:self.board];
        self.botPlayer = self.playerTwo;
    }
    else
    {
        self.playerTwo = [[Player alloc] initWithName:anotherName sigil:@"O" andDelegate:self.playerOne.inputDelegate];
    }
    
    self.playerOne.playerName = name;
}

-(void)resetPlayerScore
{
    [self.playerOne changeScoreWith:0];
}

@end
