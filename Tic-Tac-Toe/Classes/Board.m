//
//  Board.m
//  Tic-Tac-Toe
//
//  Created by A-Team Intern on 16.04.21.
//

#import "Board.h"

@interface Board ()

@property (strong, nonatomic) NSMutableArray<Cell*>* board;

@end

@implementation Board

-(instancetype)initWithRows:(NSUInteger)rows andColumns:(NSUInteger)columns {
    if ([super init]) {
        self.rows = rows;
        self.columns = columns;
        self.board = [[NSMutableArray alloc] init];
        
        for (NSUInteger i = 0; i < rows; ++i) {
            
            for (NSUInteger j = 0; j < columns; ++j) {
                [self.board addObject:[[Cell alloc] initWithcordX:i andCordY:j]];
            }
        }
        
    }
    
    return self;
}

-(NSString*)description {
    NSMutableString* boardToString = [[NSMutableString alloc] init];
    NSUInteger count = 1;
    for (NSUInteger i = 0; i < self.board.count; ++i) {
        if(count == self.columns) {
            [boardToString appendString:@"\n"];
            count = 0;
        }
        [boardToString appendString:[NSString stringWithFormat:@"%d ", self.board[i].getState]];
        ++count;
    }
    NSLog(@"%@", [NSString stringWithString:boardToString]);
    return [NSString stringWithString:boardToString];
}

-(void)setMoveWithCordX:(NSUInteger)cordX cordY:(NSUInteger)cordY andState:(EnumCellState)state {
    NSUInteger index = (cordX * self.columns) + cordY;
    [self.board[index] setCordX:cordX cordY:cordY andState:state];
}

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

-(EnumCellState)checkHorizontal {
    NSUInteger count = 1;
    for (NSUInteger i = 0; i < self.board.count; ++i) {
        if (count == self.columns) { // && self.board[i].getState != EnumCellStateEmpty
            if (self.board[i].getState != EnumCellStateEmpty) {
                return self.board[i].getState;
            }
            count = 1;
            continue;
        }
        
        if (self.board[i].getState != self.board[i + 1].getState) {
            i += self.columns - count;
            count = 1;
            continue;
        }
        ++count;
    }
    
    return EnumCellStateEmpty;
}

-(EnumCellState)checkVertical {
    BOOL haveWin = YES;
    NSUInteger count = self.columns - 1;
    for (NSUInteger i = 0; i < self.columns; ++i) {
        
        for (NSUInteger j = i; j < self.board.count - count; j += self.columns) {
            if (self.board[j].getState != self.board[j + self.columns].getState) {
                haveWin = NO;
                break;
            }
        }
        
        if (haveWin && self.board[i].getState != EnumCellStateEmpty) {
            return self.board[i].getState;
        }
        --count;
    }
    
    return EnumCellStateEmpty;
}


-(EnumCellState)checkDiagonal {
    BOOL haveWin = YES;
    for (NSUInteger i = 0; i < self.board.count; i += self.columns + 1) {
        if (self.board[i].getState != self.board[i + self.columns + 1].getState) {
            haveWin = NO;
            break;
        }
    }
    if (haveWin && self.board[0].getState != EnumCellStateEmpty) {
        return self.board[0].getState;
    }
    haveWin = YES;
    for (NSUInteger i = self.columns - 1; i < self.board.count; i += self.columns - 1) {
        if (self.board[i].getState != self.board[i + self.columns - 1].getState) {
            haveWin = NO;
            break;
        }
    }
    
    if (haveWin && self.board[self.board.count].getState != EnumCellStateEmpty) {
        return self.board[self.board.count].getState;
    }
    
    return EnumCellStateEmpty;
}


-(BOOL)checkIsFull {
    for (NSUInteger i = 0; i < self.board.count; ++i) {
        if(self.board[i].getState == EnumCellStateEmpty) {
            return NO;
        }
    }
    
    return YES;
}

-(NSArray*)freeCells {
    NSMutableArray* freeCells = [[NSMutableArray alloc] init];
    
    for (NSUInteger i = 0; i < self.board.count; ++i) {
        [freeCells addObject:self.board[i].getCordArray];
    }
    
    return freeCells;
}

@end
