//
//  Cell.m
//  Tic-Tac-Toe
//
//  Created by A-Team Intern on 20.04.21.
//

#import "Cell.h"

@interface Cell ()

@property (assign) int x;
@property (assign) int y;

@end


@implementation Cell

-(instancetype)initWithX:(int)x andY:(int)y {
    if ([super init]) {
        self.state = EnumCellStateEmpty;
        self.x = x;
        self.y = y;
    }
    
    return self;
}

-(NSArray<NSNumber *> *)coordinates
{
    NSMutableArray<NSNumber *> *coordinatesArray = [[NSMutableArray alloc] init];
    [coordinatesArray addObject:@(self.x)];
    [coordinatesArray addObject:@(self.y)];
    
    return coordinatesArray;
}

-(void)changeState
{
    if (self.state == EnumCellStateEmpty)
    {
        self.state = EnumCellStateGreen;
    }
    else if(self.state == EnumCellStateGreen)
    {
        self.state = EnumCellStateYellow;
    }
    else if(self.state == EnumCellStateYellow)
    {
        self.state = EnumCellStateRed;
    }
}


@end
