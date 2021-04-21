//
//  ConsoleViewController.h
//  Tic-Tac-Toe
//
//  Created by A-Team Intern on 19.04.21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ConsoleViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *boardConsoleLabel;
@property (weak, nonatomic) IBOutlet UITextField *userChoice;


@end

NS_ASSUME_NONNULL_END
