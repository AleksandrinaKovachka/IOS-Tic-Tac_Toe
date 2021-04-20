//
//  Cell.m
//  Tic-Tac-Toe
//
//  Created by A-Team Intern on 20.04.21.
//

#import "Cell.h"

@implementation Cell

-(instancetype)initWithcordX:(NSUInteger)cordX andCordY:(NSUInteger)cordY {
    if ([super init]) {
        self.state = EnumCellStateEmpty;
        self.cordX = cordX;
        self.cordY = cordY;
    }
    
    return self;
}

-(NSUInteger)getCordX {
    return self.cordX;
}

-(NSUInteger)getCordY {
    return self.cordY;
}

-(EnumCellState)getState {
    return self.state;
}

-(void)setCordX:(NSUInteger)cordX cordY:(NSUInteger)cordY andState:(EnumCellState)state {
    self.cordX = cordX;
    self.cordY = cordY;
    self.state = state;
}


@end
