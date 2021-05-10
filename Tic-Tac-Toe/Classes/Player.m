//
//  Player.m
//  Tic-Tac-Toe
//
//  Created by A-Team Intern on 16.04.21.
//

#import "Player.h"
#import "NotificationNames.h"

@interface Player ()

@property (assign) int score;

@end

@implementation Player

-(instancetype)initWithName:(NSString*)playerName andDelegate:(id<InputDelegate>)delegate
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
    [self changeScoreWith:1];
    
    return coordinates;
}

-(void)changeScoreWith:(int)value
{
    self.score = value == 0 ? 0 : self.score + value;
    //self.score += value == 0 ? (-1) * value : value;
    [NSNotificationCenter.defaultCenter postNotificationName:NOTIFICATION_CHANGE_SCORE object:[NSNumber numberWithInt:self.score] userInfo:nil];
}

@end
