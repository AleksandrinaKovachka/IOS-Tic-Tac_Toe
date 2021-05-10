//
//  Cell.h
//  Tic-Tac-Toe
//
//  Created by A-Team Intern on 20.04.21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef enum {
    EnumCellStateEmpty,
    EnumCellStateX,
    EnumCellStateO,
    EnumCellStateGreen,
    EnumCellStateYellow,
    EnumCellStateRed
} EnumCellState;

@interface Cell : NSObject

@property (assign) EnumCellState state;

@property (readonly) int x;
@property (readonly) int y;

-(instancetype)initWithX:(int)x andY:(int)y;

-(NSArray<NSNumber *> *)coordinates;
-(void)changeState;

@end

NS_ASSUME_NONNULL_END
