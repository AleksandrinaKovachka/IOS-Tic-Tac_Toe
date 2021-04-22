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
    EnumCellStateO
} EnumCellState;

@interface Cell : NSObject

@property (assign) EnumCellState state;
// Code Review: no need to be extra specific with names when the context can be guessed by the class name
@property (readonly) int x;
@property (readonly) int y;

// Code Review: use 'long' only when absolutely necessary
-(instancetype)initWithX:(int)x andY:(int)y;

// Code Review: always prefer explicitly typed collections to generic ones
// Code Review: do not prefix methods and properties with 'get'
-(NSArray<NSNumber *> *)coordinates;

@end

NS_ASSUME_NONNULL_END
