//
//  Player.m
//  Tic-Tac-Toe
//
//  Created by A-Team Intern on 16.04.21.
//

#import "Player.h"

@implementation Player

-(instancetype)initWithName:(NSString*)playerName sigil:(NSString *)sigil andDelegate:(id<InputDelegate>)delegate
{
    if ([super init])
    {
        self.playerName = playerName;
        self.inputDelegate = delegate;
    }
    
    return self;
}

-(NSArray<NSNumber *> *)makeMove
{
    NSArray<NSNumber *> *coordinates = self.inputDelegate.moveCoordinates.firstObject;
    return coordinates;
}

@end
