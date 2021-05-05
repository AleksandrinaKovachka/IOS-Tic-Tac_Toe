//
//  UserInfoViewController.m
//  Tic-Tac-Toe
//
//  Created by A-Team Intern on 27.04.21.
//

#import "UserInfoViewController.h"

@interface UserInfoViewController ()

@property (weak, nonatomic) IBOutlet UILabel *anotherPlayerLabel;
@property (weak, nonatomic) IBOutlet UISwitch *anotherPlayerSwitchState;



@end

@implementation UserInfoViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)onClickPlayGame:(id)sender
{
    NSString* anotherPlayer = [[NSString alloc] initWithString: self.anotherPlayerSwitchState.on == YES ? self.anotherPlayerNameTextField.text : @"Bot"];
    
    [self.nameDelegate getPlayerName:self.userNameTextField.text andAnotherPlayerName:anotherPlayer];
    [self dismissViewControllerAnimated:YES completion:nil];
}

+(instancetype)viewControllerFromStoryboardWithNameDelegate:(id<UserNameDelegate>)nameDelegate
{
    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UserInfoViewController* userInfoController = [storyboard instantiateViewControllerWithIdentifier:@"UserInfoControllerID"];
    userInfoController.nameDelegate = nameDelegate;
    
    return userInfoController;
}

- (IBAction)onSwitchAnotherUser:(id)sender
{
    if (self.anotherPlayerSwitchState.on == YES)
    {
        self.anotherPlayerLabel.hidden = NO;
        self.anotherPlayerNameTextField.hidden = NO;
    }
    else
    {
        self.anotherPlayerLabel.hidden = YES;
        self.anotherPlayerNameTextField.hidden = YES;
    }
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
