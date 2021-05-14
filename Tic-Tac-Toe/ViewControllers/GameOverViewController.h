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


+(instancetype)gameOverViewControllerWithWinnerName:(NSString*)name;

@end

NS_ASSUME_NONNULL_END
