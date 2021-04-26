//
//  Board.m
//  Tic-Tac-Toe
//
//  Created by A-Team Intern on 16.04.21.
//

#import "Board.h"

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

/*-(NSArray<NSString*>*)stateDescription
{
    NSMutableArray<NSString*>* boardStates = [[NSMutableArray alloc] init];
    //NSMutableString* imageName = [[NSMutableString alloc] init];
    for (int i = 0; i < self.cells.count; ++i) {
        if (self.cells[i].state == EnumCellStateX)
        {
            [boardStates addObject: @"X"];
        }
        else if (self.cells[i].state == EnumCellStateO)
        {
            [boardStates addObject: @"O"];
        }
        else
        {
            [boardStates addObject: @"None"];
        }
    }
    
    return [NSArray arrayWithArray:boardStates];
}*/

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

-(BOOL)hasNoGapsRow
{
    int count = 1;
    for (int i = 0; i < self.cells.count; ++i)
    {
        if (count == self.columns)
        {
            if (self.cells[i].state != EnumCellStateEmpty)
            {
                return YES;
            }
            count = 1;
            continue;
        }
        
        if (self.cells[i].state != self.cells[i + 1].state)
        {
            i += self.columns - count;
            count = 1;
            continue;
        }
        ++count;
    }
    
    return NO;
}

-(BOOL)hasNoGapsColumn
{
    BOOL hasNoGaps = YES;
    int count = self.columns - 1;
    for (int i = 0; i < self.columns; ++i)
    {
        
        for (int j = i; j < self.cells.count - count - 1; j += self.columns)
        {
            if (self.cells[j].state != self.cells[j + self.columns].state)
            {
                hasNoGaps = NO;
                break;
            }
        }
        
        if (hasNoGaps && self.cells[i].state != EnumCellStateEmpty)
        {
            return YES;
        }
        --count;
    }
    
    return NO;
}

-(BOOL)hasNoGapsDiagonal
{
    BOOL hasNoGaps = YES;
    for (int i = 0; i < self.cells.count - 1; i += self.columns + 1)
    {
        if (self.cells[i].state != self.cells[i + self.columns + 1].state)
        {
            hasNoGaps = NO;
            break;
        }
    }
    if (hasNoGaps && self.cells[0].state != EnumCellStateEmpty) {
        return YES;
    }
    hasNoGaps = YES;
    for (int i = self.columns - 1; i < self.cells.count - self.columns; i += self.columns - 1) {
        if (self.cells[i].state != self.cells[i + self.columns - 1].state) {
            hasNoGaps = NO;
            break;
        }
    }
    
    if (hasNoGaps && self.cells[self.cells.count - 1].state != EnumCellStateEmpty) {
        return YES;
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
        if (self.cells[i].state == EnumCellStateEmpty) {
            return NO;
        }
    }
    
    return YES;
}

-(NSArray<NSArray<NSNumber *> *> *)moveCoordinates
{
    return self.freeCellCoordinates;
}

-(NSArray<NSArray<NSNumber *> *> *)freeCellCoordinates {
    NSMutableArray<NSArray<NSNumber *> *> *coordinates = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < self.cells.count; ++i) {
        if (self.cells[i].state == EnumCellStateEmpty) {
            [coordinates addObject:self.cells[i].coordinates];
        }
    }
    
    return coordinates;
}

-(BOOL)isFreeCellWithX:(int)x andY:(int)y
{
    if ([self cellAtX:x andY:y].state == EnumCellStateEmpty) {
        return YES;
    }
    
    return NO;
}

-(int)columnsCount
{
    return self.columns;
}

@end
