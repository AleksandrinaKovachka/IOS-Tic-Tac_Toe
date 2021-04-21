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

@property (nonatomic) NSUInteger rows;
@property (nonatomic) NSUInteger columns;

-(instancetype)initWithRows:(NSUInteger)rows andColumns:(NSUInteger)columns;
-(NSString*)description;
-(void)setMoveWithCordX:(NSUInteger)cordX cordY:(NSUInteger)cordY andState:(EnumCellState)state;
-(EnumCellState)haveWin;
-(EnumCellState)checkHorizontal;
-(EnumCellState)checkVertical;
-(EnumCellState)checkDiagonal;
-(BOOL)checkIsFull;
-(NSArray*)freeCells;


@end

NS_ASSUME_NONNULL_END
