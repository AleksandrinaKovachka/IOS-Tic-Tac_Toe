//
//  Board.h
//  Tic-Tac-Toe
//
//  Created by A-Team Intern on 16.04.21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Board : NSObject

@property (nonatomic) NSUInteger rows;
@property (nonatomic) NSUInteger columns;

-(instancetype)initWithRows:(NSUInteger)rows andColumns:(NSUInteger)columns;
-(NSMutableString*)display;
-(void)setMoveWithCordX:(NSUInteger)cordX cordT:(NSUInteger)cordY andSymbol:(NSUInteger)symbol;
-(BOOL)haveWin;
-(BOOL)checkHorizontal;
-(BOOL)checkVertical;
-(BOOL)checkDiagonal;
-(BOOL)checkIsFull;


@end

NS_ASSUME_NONNULL_END
