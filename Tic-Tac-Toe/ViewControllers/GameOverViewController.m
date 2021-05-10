//
//  GameOverViewController.m
//  Tic-Tac-Toe
//
//  Created by A-Team Intern on 29.04.21.
//

#import "GameOverViewController.h"

@interface GameOverViewController ()

@property (strong, nonatomic) NSString* winnerName;

@end

@implementation GameOverViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if ([self.winnerName isEqual:@"Bot"])
    {
        self.winnerNameLabel.text = @"Bot is the winner!";
    }
    else if ([self.winnerName isEqual:@"Full"])
    {
        self.winnerNameLabel.text = @"Equality!";
    }
    else
    {
        self.winnerNameLabel.text = [NSString stringWithFormat:@"Player %@ is winner!", self.winnerName];
    }
}

+(instancetype)gameOverViewControllerWithWinnerName:(NSString*)name
{
    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    GameOverViewController* gameOverController = [storyboard instantiateViewControllerWithIdentifier:@"GameOverID"];
    
    gameOverController.winnerName = name;
    
    return gameOverController;
}

- (IBAction)onClickStartGame:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
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
