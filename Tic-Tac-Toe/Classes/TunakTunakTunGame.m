//
//  TunakTunakTunGame.m
//  Tic-Tac-Toe
//
//  Created by A-Team Intern on 11.05.21.
//

#import "TunakTunakTunGame.h"

@implementation TunakTunakTunGame

-(void)makeMove
{
    NSArray<NSNumber *> *coords = [self.currentPlayer makeMove];
    EnumCellState prevState = [self.board currentCellState:coords];
    EnumCellState curState = [self.board changeCellState:coords];
    
    [self.board setMoveCoordinates:coords andState:curState];
    
    [self pushMoveInUndo:[[Move alloc] initWithCoordinates:coords andCurrentState:curState andPreviousState:prevState]];
    [self clearRedoStack];
    
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
