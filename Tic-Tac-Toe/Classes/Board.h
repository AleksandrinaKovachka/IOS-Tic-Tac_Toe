//
//  Board.h
//  Tic-Tac-Toe
//
//  Created by A-Team Intern on 16.04.21.
//

#import <Foundation/Foundation.h>
#import "Cell.h"
#import "Protocols.h"

NS_ASSUME_NONNULL_BEGIN

@interface Board : NSObject<InputDelegate>

-(instancetype)initWithRows:(int)rows andColumns:(int)columns;
-(NSString*)description;
-(NSArray<NSString*>*)stateDescription;
-(void)setMoveWithCordX:(int)cordX cordY:(int)cordY andState:(EnumCellState)state;
-(BOOL)hasNoGapsRow;
-(BOOL)hasNoGapsColumn;
-(BOOL)hasNoGapsDiagonal;
-(BOOL)isFull;
-(BOOL)isFreeCellWithX:(int)x andY:(int)y;
-(int)columnsCount;

@end

NS_ASSUME_NONNULL_END
