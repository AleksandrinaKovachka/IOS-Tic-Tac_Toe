//
//  GameContainerViewController.h
//  Tic-Tac-Toe
//
//  Created by A-Team Intern on 27.04.21.
//

#import <UIKit/UIKit.h>
#import "UserInfoViewController.h"
#import "Protocols.h"

NS_ASSUME_NONNULL_BEGIN

@interface GameContainerViewController : UIViewController<UserNameDelegate>
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) id<UndoAndRedoDelegate> undoAndRedoDelegate;


@end

NS_ASSUME_NONNULL_END
