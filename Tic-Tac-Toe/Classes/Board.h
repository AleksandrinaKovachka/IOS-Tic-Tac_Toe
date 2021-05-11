//
//  Board.h
//  Tic-Tac-Toe
//
//  Created by A-Team Intern on 16.04.21.
//

#import <Foundation/Foundation.h>
#import "Cell.h"
#import "Protocols.h"
#import "Move.h"

NS_ASSUME_NONNULL_BEGIN

@interface Board : NSObject<InputDelegate>

-(instancetype)initWithRows:(int)rows andColumns:(int)columns;
-(NSString*)description;
-(NSArray<NSNumber*>*)stateDescription;
-(void)setMoveCoordinates:(NSArray<NSNumber*>*)coordinates andState:(EnumCellState)state;
//-(void)setMoveCoordinates:(NSArray<NSNumber*>*)coordinates;
-(BOOL)hasNoGapsRow;
-(BOOL)hasNoGapsColumn;
-(BOOL)hasNoGapsDiagonal;
-(BOOL)isFull;
-(BOOL)isCorrectMove:(NSArray<NSArray<NSNumber *> *> *)coords;
//-(BOOL)isFreeCellWithX:(int)x andY:(int)y;
-(int)columnsCount;
-(int)boardCount;
-(void)clearBoard;
-(EnumCellState)currentCellState:(NSArray<NSNumber*>*)coordinates;
-(EnumCellState)changeCellState:(NSArray<NSNumber*>*)coordinates;

@end

NS_ASSUME_NONNULL_END
