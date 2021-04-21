//
//  Cell.m
//  Tic-Tac-Toe
//
//  Created by A-Team Intern on 20.04.21.
//

#import "Cell.h"

// Code Review: always prefer automatically synthesized properties to manually creating
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

// Code Review: always prefer explicitly typed collections to generic
-(NSArray<NSNumber *> *)coordinates {
    // Code Review: always name your variables properly
    NSMutableArray<NSNumber *> *coordinatesArray = [[NSMutableArray alloc] init];
    [coordinatesArray addObject:@(self.x)];
    [coordinatesArray addObject:@(self.y)];
    
    return coordinatesArray;
}


@end
