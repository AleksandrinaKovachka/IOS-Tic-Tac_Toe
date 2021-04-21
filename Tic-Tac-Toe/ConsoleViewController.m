//
//  ConsoleViewController.m
//  Tic-Tac-Toe
//
//  Created by A-Team Intern on 19.04.21.
//

#import "ConsoleViewController.h"
#import "Game.h"

@interface ConsoleViewController ()

@property (strong, nonatomic) Game* game;

@end

@implementation ConsoleViewController

/*-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.boardConsoleLabel.text = self.game.board.description;
}*/

- (void)viewDidLoad {
    [super viewDidLoad];
    self.game = [[Game alloc] initWithPlayerName:@"Pesho" andPlayerSymbol:@"X"];
    self.boardConsoleLabel.text = self.game.board.description;
}

- (IBAction)onClickSubmit:(id)sender {
    self.boardConsoleLabel.text = [self.game playWithUserChoice:self.userChoice.text];
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
