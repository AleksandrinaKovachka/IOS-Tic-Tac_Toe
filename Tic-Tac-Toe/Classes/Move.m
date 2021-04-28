//
//  Move.m
//  Tic-Tac-Toe
//
//  Created by A-Team Intern on 27.04.21.
//

#import "Move.h"

@implementation Move


-(instancetype)initWithCoordinates:(NSArray<NSNumber *> *)coordinates andCurrentState:(EnumCellState)currentState andPreviousState:(EnumCellState)previousState
{
    if ([super init])
    {
        self.coordinates = coordinates;
        self.currentState = currentState;
        self.previousState = previousState;
    }
    
    return self;
}

-(Move*)opposite
{
    Move* oppositeMove = [[Move alloc] initWithCoordinates:self.coordinates andCurrentState:self.previousState andPreviousState:self.currentState];
    
    return oppositeMove;
}

@end
