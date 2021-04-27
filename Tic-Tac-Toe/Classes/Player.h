//
//  Player.h
//  Tic-Tac-Toe
//
//  Created by A-Team Intern on 16.04.21.
//

#import <Foundation/Foundation.h>
#import "Protocols.h"

NS_ASSUME_NONNULL_BEGIN

@interface Player : NSObject

@property (strong, nonatomic) NSString* playerName;
//TODO: count of move(but if is undo and redo)
@property (readonly) int score;
@property (weak, nonatomic) id<InputDelegate> inputDelegate;

-(instancetype)initWithName:(NSString*)playerName sigil:(NSString *)sigil andDelegate:(id<InputDelegate>)delegate;
-(NSArray<NSNumber *> *)makeMove;

@end

NS_ASSUME_NONNULL_END
