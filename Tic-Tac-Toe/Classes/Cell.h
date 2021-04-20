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

@property (nonatomic) EnumCellState state;
@property (nonatomic) NSUInteger cordX;
@property (nonatomic) NSUInteger cordY;

-(instancetype)initWithcordX:(NSUInteger)cordX andCordY:(NSUInteger)cordY;
-(NSUInteger)getCordX;
-(NSUInteger)getCordY;
-(EnumCellState)getState;
-(void)setCordX:(NSUInteger)cordX cordY:(NSUInteger)cordY andState:(EnumCellState)state;

@end

NS_ASSUME_NONNULL_END
