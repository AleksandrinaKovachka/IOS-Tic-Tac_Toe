//
//  Player.m
//  Tic-Tac-Toe
//
//  Created by A-Team Intern on 16.04.21.
//

#import "Player.h"

@interface Player ()

@property (assign) int score;

@end

@implementation Player

-(instancetype)initWithName:(NSString*)playerName sigil:(NSString *)sigil andDelegate:(id<InputDelegate>)delegate
{
    if ([super init])
    {
        self.playerName = playerName;
        self.inputDelegate = delegate;
        self.score = 0;
    }
    
    return self;
}

-(NSArray<NSNumber *> *)makeMove
{
    NSArray<NSNumber *> *coordinates = self.inputDelegate.moveCoordinates.firstObject;
    ++self.score;
    //TODO: delegate change score label
    return coordinates;
}

@end
