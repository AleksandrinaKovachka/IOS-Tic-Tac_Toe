//
//  Board.m
//  Tic-Tac-Toe
//
//  Created by A-Team Intern on 16.04.21.
//

#import "Board.h"
#import "NotificationNames.h"

@interface Board ()

@property (strong, nonatomic) NSMutableArray<Cell *> *cells;
@property (assign) int rows;
@property (assign) int columns;

@end

@implementation Board

-(instancetype)initWithRows:(int)rows andColumns:(int)columns
{
    if ([super init])
    {
        self.rows = rows;
        self.columns = columns;
        self.cells = [[NSMutableArray alloc] init];
        
        for (int i = 0; i < rows; ++i)
        {
            
            for (int j = 0; j < columns; ++j)
            {
                [self.cells addObject:[[Cell alloc] initWithX:i andY:j]];
            }
        }
        
    }
    
    return self;
}

-(NSString *)description
{
    NSMutableString* boardToString = [[NSMutableString alloc] init];
    int count = 0;
    for (int i = 0; i < self.cells.count; ++i)
    {
        if (count == self.columns)
        {
            [boardToString appendString:@"\n"];
            count = 0;
        }
        [boardToString appendString:[NSString stringWithFormat:@"%d ", self.cells[i].state]];
        ++count;
    }
    NSLog(@"%@", [NSString stringWithString:boardToString]);
    return [NSString stringWithString:boardToString];
}

-(NSArray<NSNumber*>*)stateDescription
{
    NSMutableArray<NSNumber*>* boardStates = [[NSMutableArray alloc] init];
    for (int i = 0; i < self.cells.count; ++i) {
        [boardStates addObject:@(self.cells[i].state)];
    }
    
    return [NSArray arrayWithArray:boardStates];
}

-(void)setMoveWithCordX:(int)cordX cordY:(int)cordY andState:(EnumCellState)state
{
    Cell *cell = [self cellAtX:cordX andY:cordY];
    cell.state = state;
}

-(void)setMoveCoordinates:(NSArray<NSNumber*>*)coordinates andState:(EnumCellState)state
{
    [self setMoveWithCordX:coordinates[0].intValue cordY:coordinates[1].intValue andState:state];
}

-(BOOL)hasNoGapsRow
{
    BOOL hasNoGaps = YES;
    
    for (int i = 0; i < self.rows; ++i)
    {
        hasNoGaps = YES;
        for (int j = 0; j < self.columns - 1; ++j)
        {
            if ([self cellAtX:i andY:j].state != [self cellAtX:i andY:j + 1].state)
            {
                hasNoGaps = NO;
            }
        }
        if (hasNoGaps && [self cellAtX:i andY:i].state != EnumCellStateEmpty)
        {
            return YES;
        }
    }
    
    return NO;
}

-(BOOL)hasNoGapsColumn
{
    BOOL hasNoGaps = YES;
    
    for (int j = 0; j < self.columns; ++j)
    {
        hasNoGaps = YES;
        for (int i = 0; i < self.rows - 1; ++i) {
            if ([self cellAtX:i andY:j].state != [self cellAtX:i + 1 andY:j].state)
            {
                hasNoGaps = NO;
            }
        }
        
        if (hasNoGaps && [self cellAtX:j andY:j].state != EnumCellStateEmpty)
        {
            return YES;
        }
    }
    
    return NO;
}

-(BOOL)hasNoGapsDiagonal
{
    BOOL hasNoGaps = YES;
    int count = self.columns;
    
    for (int i = 0; i < self.rows - 1; ++i)
    {
        if ([self cellAtX:i andY:i].state != [self cellAtX:i + 1 andY:i + 1].state)
        {
            hasNoGaps = NO;
        }
    }
    
    if (hasNoGaps && [self cellAtX:0 andY:0].state != EnumCellStateEmpty)
    {
        return  YES;
    }
    
    hasNoGaps = YES;
    for (int i = 0; i < self.rows - 1; ++i)
    {
        --count;
        if ([self cellAtX:i andY:count].state != [self cellAtX:i + 1 andY: count - 1].state)
        {
            hasNoGaps = NO;
        }
    }
    
    if (hasNoGaps && [self cellAtX:0 andY:self.columns - 1].state != EnumCellStateEmpty)
    {
        return  YES;
    }
    
    return NO;
}


-(Cell *)cellAtX:(int)x andY:(int)y
{
    int index = x * self.columns + y;
    Cell *cell = self.cells[index];
    
    return cell;
}

-(BOOL)isFull {
    for (int i = 0; i < self.cells.count; ++i) {
        if (self.cells[i].state == EnumCellStateEmpty || self.cells[i].state == EnumCellStateGreen || self.cells[i].state == EnumCellStateYellow) {
            return NO;
        }
    }
    
    return YES;
}

-(BOOL)isCorrectMove:(NSArray<NSArray<NSNumber *> *> *)coords
{
    NSArray<NSNumber *> *coordinates = coords.firstObject;
    
    EnumCellState state = [self currentCellState:coordinates];
    
    if (state != EnumCellStateRed && state != EnumCellStateX && state != EnumCellStateO)
    {
        return YES;
    }
    
    return NO;
}

-(NSArray<NSArray<NSNumber *> *> *)moveCoordinates
{
    return self.freeCellCoordinates;
}

-(NSArray<NSArray<NSNumber *> *> *)freeCellCoordinates {
    NSMutableArray<NSArray<NSNumber *> *> *coordinates = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < self.cells.count; ++i) {
        if (self.cells[i].state == EnumCellStateEmpty || self.cells[i].state == EnumCellStateGreen || self.cells[i].state == EnumCellStateYellow) {
            [coordinates addObject:self.cells[i].coordinates];
        }
    }
    
    return coordinates;
}

-(int)columnsCount
{
    return self.columns;
}

-(int)boardCount
{
    return (int) self.cells.count;
}

-(void)clearBoard
{
    for (int i = 0; i < self.cells.count; ++i)
    {
        self.cells[i].state = EnumCellStateEmpty;
    }
}

-(EnumCellState)currentCellState:(NSArray<NSNumber*>*)coordinates
{
    Cell *cell = [self cellAtX:coordinates[0].intValue andY:coordinates[1].intValue];
    
    return cell.state;
}

-(EnumCellState)changeCellState:(NSArray<NSNumber*>*)coordinates
{
    Cell *cell = [self cellAtX:coordinates[0].intValue andY:coordinates[1].intValue];
    [cell changeState];
    
    return cell.state;
}

@end
