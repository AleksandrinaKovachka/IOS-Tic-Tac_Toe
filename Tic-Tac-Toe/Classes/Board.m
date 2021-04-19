//
//  Board.m
//  Tic-Tac-Toe
//
//  Created by A-Team Intern on 16.04.21.
//

#import "Board.h"

@interface Board ()

@property (strong, nonatomic) NSMutableArray* board;

@end

@implementation Board

-(instancetype)initWithRows:(NSUInteger)rows andColumns:(NSUInteger)columns {
    if ([super init]) {
        self.rows = rows;
        self.columns = columns;
        self.board = [[NSMutableArray alloc] initWithCapacity:rows];
        
        for (NSUInteger i = 0; i < rows; ++i) {
            NSMutableArray* currentColumn = [NSMutableArray array];
            
            for (NSUInteger j = 0; j < columns; ++j) {
                [currentColumn addObject:nil];
            }
            [self.board addObject:currentColumn];
        }
        
    }
    
    return self;
}

-(NSMutableString*)display {
    NSMutableString* boardToString = [[NSMutableString alloc] initWithCapacity:(self.columns * self.rows)];
    for (NSUInteger i = 0; i < self.rows; ++i) {
        NSMutableString* columnToString = [[NSMutableString alloc] initWithCapacity:self.columns];
        for (NSUInteger j = 0; j < self.columns; ++j) {
            NSString* element = [NSString stringWithFormat:@"%@ ", self.board[i][j]];
            [columnToString appendString:element];
        }
        [boardToString appendString:columnToString];
    }
    
    return boardToString;
}

-(void)setMoveWithCordX:(NSUInteger)cordX cordT:(NSUInteger)cordY andSymbol:(NSUInteger)symbol {
    self.board[cordX][cordY] = @(symbol);
}

-(BOOL)haveWin {
    return self.checkHorizontal && self.checkVertical && self.checkDiagonal; //who is the winer
}

-(BOOL)checkHorizontal {
    BOOL haveWin = YES;
    for (NSUInteger i = 0; i < self.rows; ++i) {
        for (NSUInteger j = 0; j < self.columns - 1; ++j) {
            if (self.board[i][j] == nil || self.board[i][j] != self.board[i][j + 1]) {
                haveWin = NO;
            }
        }
        
        if (haveWin) {
            return YES;
        }
        haveWin = YES;
    }
    
    return haveWin;
}

-(BOOL)checkVertical {
    BOOL haveWin = YES;
    
    for (NSUInteger j = 0; j < self.columns; ++j) {
        for (NSUInteger i = 0; i < self.rows - 1; ++i) {
            if (self.board[i][j] == nil || self.board[i][j] != self.board[i + 1][j]) {
                haveWin = NO;
            }
        }
        
        if (haveWin) {
            return YES;
        }
        haveWin = YES;
    }
    
    return haveWin;
}


-(BOOL)checkDiagonal {
    BOOL haveWin = YES;
    NSUInteger count = self.columns - 1;
    
    for (NSUInteger i = 0; i < self.rows - 1; ++i) {
        if (self.board[i][i] == nil || self.board[i][i] !=  self.board[i + 1][i + 1]) {
            haveWin = NO;
            break;
        }
    }
    
    for (NSUInteger i = 0; i < self.rows - 1; ++i) {
        if (self.board[i][i] == nil || self.board[i][i] !=  self.board[i + 1][count--]) {
            haveWin = NO;
            break;
        }
    }
    
    return haveWin;
}


-(BOOL)checkIsFull {
    for (NSUInteger j = 0; j < self.columns; ++j) {
        for (NSUInteger i = 0; i < self.rows; ++i) {
            if (self.board[i][j] == nil) {
                return NO;
            }
        }
    }
    
    return YES;
}

@end
