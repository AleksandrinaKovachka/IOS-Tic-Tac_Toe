//
//  AI.h
//  Tic-Tac-Toe
//
//  Created by A-Team Intern on 19.04.21.
//

#import "Player.h"

NS_ASSUME_NONNULL_BEGIN

@interface BotEasy : Player

-(instancetype)initWithName:(NSString*)playerName andSymbol:(NSString*)symbol;
-(void)makeMoveWithCordX:(NSUInteger)cordX cordY:(NSUInteger)cordY andBoard:(Board*)board;
-(void)computerChoiceWithBoard:(Board*)board;

@end

NS_ASSUME_NONNULL_END
