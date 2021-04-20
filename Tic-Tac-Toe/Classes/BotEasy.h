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
-(void)computerChoiceWithBoard:(Board*)board andState:(EnumCellState)state;

@end

NS_ASSUME_NONNULL_END
