//
//  Player.h
//  Tic-Tac-Toe
//
//  Created by A-Team Intern on 12.04.21.
//

#ifndef Player_h
#define Player_h

@interface Player : NSObject

@property (strong, nonatomic) NSString *playerName;
@property (readonly) NSString *symbol;

-(instancetype)intWithName:(NSString*)playerName andSymbol:(NSString*) symbol;

@end


#endif /* Player_h */
