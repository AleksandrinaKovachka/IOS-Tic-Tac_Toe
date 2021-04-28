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
//-(void)drawErrorState;

@end

@protocol UserNameDelegate <NSObject>

-(void)userWithName:(NSString*)name;

@end

@protocol UndoAndRedoDelegate <NSObject>

-(void)undo;
-(void)redo;

@end


#endif /* Protocols_h */
