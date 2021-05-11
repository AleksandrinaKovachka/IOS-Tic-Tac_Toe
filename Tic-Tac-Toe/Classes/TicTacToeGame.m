//
//  TicTacToeGame.m
//  Tic-Tac-Toe
//
//  Created by A-Team Intern on 11.05.21.
//

#import "TicTacToeGame.h"

@implementation TicTacToeGame

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
    
    [self pushMoveInUndo:[[Move alloc] initWithCoordinates:coords andCurrentState:state andPreviousState:EnumCellStateEmpty]];
    [self clearRedoStack];

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

@end
