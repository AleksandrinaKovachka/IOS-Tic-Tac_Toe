//
//  GameOverViewController.h
//  Tic-Tac-Toe
//
//  Created by A-Team Intern on 29.04.21.
//

#import "ViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface GameOverViewController : ViewController
@property (weak, nonatomic) IBOutlet UILabel *winnerNameLabel;

//id delegate

+(instancetype)gameOverViewControllerWithWinnerName:(NSString*)name; // and delegate

@end

NS_ASSUME_NONNULL_END
