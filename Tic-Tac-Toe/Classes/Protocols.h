//
//  Protocols.h
//  Tic-Tac-Toe
//
//  Created by A-Team Intern on 22.04.21.
//

#ifndef Protocols_h
#define Protocols_h

@protocol InputDelegate <NSObject>

-(NSArray<NSArray<NSNumber *> *> *)moveCoordinates;

@end

@protocol OutputDelegate <NSObject>

-(void)draw;
-(void)drawGameOver;

@end


#endif /* Protocols_h */
