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
-(void)setMoveWithCordX:(int)cordX cordY:(int)cordY andState:(EnumCellState)state;
-(BOOL)hasNoGapsRow;
-(BOOL)hasNoGapsColumn;
-(BOOL)hasNoGapsDiagonal;
-(BOOL)isFull;

@end

NS_ASSUME_NONNULL_END
