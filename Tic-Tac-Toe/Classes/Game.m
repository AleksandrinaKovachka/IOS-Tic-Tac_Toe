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
        
    }
    
    return self;
}

//TODO: new class Move - save moves in stack(undo and redo) and make move
-(void)makeMove
{
    EnumCellState state = EnumCellStateEmpty;
    NSArray<NSNumber *> *coords = [self.currentPlayer makeMove];
    
    /*if (self.currentPlayer != self.botPlayer && ![self.board isFreeCellWithX:coords[0].intValue andY:coords[1].intValue])
    {
        [self.outputDelegate drawErrorState];
        return;
    }*/
    
    //only state of current player
    if (self.currentPlayer == self.playerOne)
    {
        state = EnumCellStateX;
    }
    else
    {
        state = EnumCellStateO;
    }
    
    [self.board setMoveWithCordX:coords[0].intValue cordY:coords[1].intValue andState:state];
    
    //isFull haveWinner
    if (self.board.isFull || self.checkWin)
    {
        [self.outputDelegate draw];
        [self.outputDelegate drawGameOver];
        return;
    }
    
    //if the game is not win change the player
    if (self.currentPlayer == self.playerOne)
    {
        self.currentPlayer = self.playerTwo;
    }
    else
    {
        self.currentPlayer = self.playerOne;
    }
    
    //if another player is bot
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
    return self.currentPlayer.playerName; //error
}


@end
