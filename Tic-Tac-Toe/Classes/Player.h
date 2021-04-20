//
//  Player.h
//  Tic-Tac-Toe
//
//  Created by A-Team Intern on 16.04.21.
//

#import <Foundation/Foundation.h>
#import "Board.h"

NS_ASSUME_NONNULL_BEGIN

@interface Player : NSObject

@property (strong, nonatomic) NSString* playerName;
//@property (nonatomic) NSUInteger symbol; //1 = X, 0 = O

-(instancetype)initWithName:(NSString*)playerName; // andSymbol:(NSString*)symbol;
-(void)makeMoveWithCordX:(NSUInteger)cordX cordY:(NSUInteger)cordY board:(Board*)board andState:(EnumCellState)state;

@end

NS_ASSUME_NONNULL_END
