//
//  Board.m
//  Tic-Tac-Toe
//
//  Created by A-Team Intern on 16.04.21.
//

#import "Board.h"

@interface Board ()

@property (strong, nonatomic) NSMutableArray<Cell *> *board;

@end

@implementation Board

-(instancetype)initWithRows:(int)rows andColumns:(int)columns {
    if ([super init]) {
        self.rows = rows;
        self.columns = columns;
        self.board = [[NSMutableArray alloc] init];
        
        for (int i = 0; i < rows; ++i) {
            
            for (int j = 0; j < columns; ++j) {
                [self.board addObject:[[Cell alloc] initWithX:i andY:j]];
            }
        }
        
    }
    
    return self;
}

-(NSString *)description {
    NSMutableString* boardToString = [[NSMutableString alloc] init];
    int count = 0;
    for (int i = 0; i < self.board.count; ++i) {
        if(count == self.columns) {
            [boardToString appendString:@"\n"];
            count = 0;
        }
        [boardToString appendString:[NSString stringWithFormat:@"%d ", self.board[i].state]];
        ++count;
    }
    NSLog(@"%@", [NSString stringWithString:boardToString]);
    return [NSString stringWithString:boardToString];
}

-(void)setMoveWithCordX:(int)cordX cordY:(int)cordY andState:(EnumCellState)state {
    int index = (cordX * self.columns) + cordY;
    Cell *cell = self.board[index];
    cell.state = state;
}

// Code Review: why return EnumCellState?!
-(EnumCellState)haveWin {
    if (self.checkHorizontal != EnumCellStateEmpty) {
        return self.checkHorizontal;
    } else if (self.checkVertical != EnumCellStateEmpty){
        return self.checkVertical;
    } else if (self.checkDiagonal != EnumCellStateEmpty) {
        return self.checkDiagonal;
    }
    
    return EnumCellStateEmpty;
}

// Code Review: why return EnumCellState?!
-(EnumCellState)checkHorizontal {
    int count = 1;
    for (int i = 0; i < self.board.count; ++i) {
        if (count == self.columns) { // && self.board[i].state != EnumCellStateEmpty
            if (self.board[i].state != EnumCellStateEmpty) {
                return self.board[i].state;
            }
            count = 1;
            continue;
        }
        
        if (self.board[i].state != self.board[i + 1].state) {
            i += self.columns - count; //correct
            count = 1;
            continue;
        }
        ++count;
    }
    
    return EnumCellStateEmpty;
}

// Code Review: why return EnumCellState?!
-(EnumCellState)checkVertical {
    BOOL haveWin = YES;
    int count = self.columns - 1;
    for (int i = 0; i < self.columns; ++i) {
        
        for (int j = i; j < self.board.count - count - 1; j += self.columns) {
            if (self.board[j].state != self.board[j + self.columns].state) {
                haveWin = NO;
                break;
            }
        }
        
        if (haveWin && self.board[i].state != EnumCellStateEmpty) {
            return self.board[i].state;
        }
        --count;
    }
    
    return EnumCellStateEmpty;
}

// Code Review: why return EnumCellState?!
-(EnumCellState)checkDiagonal {
    BOOL haveWin = YES;
    for (int i = 0; i < self.board.count - 1; i += self.columns + 1) {
        if (self.board[i].state != self.board[i + self.columns + 1].state) {
            haveWin = NO;
            break;
        }
    }
    if (haveWin && self.board[0].state != EnumCellStateEmpty) {
        return self.board[0].state;
    }
    haveWin = YES;
    for (int i = self.columns - 1; i < self.board.count - self.columns; i += self.columns - 1) {
        if (self.board[i].state != self.board[i + self.columns - 1].state) {
            haveWin = NO;
            break;
        }
    }
    
    if (haveWin && self.board[self.board.count - 1].state != EnumCellStateEmpty) {
        return self.board[self.board.count - 1].state;
    }
    
    return EnumCellStateEmpty;
}


-(BOOL)isFull {
    for (int i = 0; i < self.board.count; ++i) {
        if(self.board[i].state == EnumCellStateEmpty) {
            return NO;
        }
    }
    
    return YES;
}

-(NSArray<NSArray<NSNumber *> *> *)freeCellCoordinates {
    NSMutableArray<NSArray<NSNumber *> *> *coordinates = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < self.board.count; ++i) {
        if (self.board[i].state == EnumCellStateEmpty) {
            [coordinates addObject:self.board[i].coordinates];
        }
    }
    
    return coordinates;
}

@end
