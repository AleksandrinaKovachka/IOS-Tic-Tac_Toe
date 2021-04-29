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
    
    self.winnerNameLabel.text = self.winnerName;
}

+(instancetype)gameOverViewControllerWithWinnerName:(NSString*)name
{
    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    GameOverViewController* gameOverController = [storyboard instantiateViewControllerWithIdentifier:@"GameOverID"];
    
    gameOverController.winnerName = name;
    //id delegate
    
    return gameOverController;
}

- (IBAction)onClickStartGame:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)onClickExit:(id)sender
{
    exit(0);
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