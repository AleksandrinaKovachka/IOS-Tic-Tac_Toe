//
//  Move.h
//  Tic-Tac-Toe
//
//  Created by A-Team Intern on 27.04.21.
//

#import <Foundation/Foundation.h>
#import "Board.h"

NS_ASSUME_NONNULL_BEGIN

@interface Move : NSObject

@property (strong, nonatomic) NSArray<NSNumber *> * coordinates;
@property (assign) EnumCellState currentState;
@property (assign) EnumCellState previousState;


-(instancetype)initWithCoordinates:(NSArray<NSNumber *> *)coordinates andCurrentState:(EnumCellState)currentState andPreviousState:(EnumCellState)previousState;

-(Move*)opposite;

@end

NS_ASSUME_NONNULL_END
