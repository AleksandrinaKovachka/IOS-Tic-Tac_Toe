//
//  Board.h
//  Tic-Tac-Toe
//
//  Created by A-Team Intern on 16.04.21.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

NS_ASSUME_NONNULL_BEGIN

@interface Board : NSObject

// Code Review: use 'assign' for non-pointer properties
@property (assign) int rows;
@property (assign) int columns;

-(instancetype)initWithRows:(int)rows andColumns:(int)columns;
-(NSString*)description;
-(void)setMoveWithCordX:(int)cordX cordY:(int)cordY andState:(EnumCellState)state;
-(EnumCellState)haveWin; // Code Review: this is not for the 'Board' to decide
-(EnumCellState)checkHorizontal; // Code Review: check what exactly?
-(EnumCellState)checkVertical;
-(EnumCellState)checkDiagonal;
-(BOOL)isFull;
-(NSArray*)freeCellCoordinates;


@end

NS_ASSUME_NONNULL_END
