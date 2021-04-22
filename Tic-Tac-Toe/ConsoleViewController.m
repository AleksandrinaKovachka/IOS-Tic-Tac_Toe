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
    self.game = [[Game alloc] initWithPlayerName:@"Pesho" inputDelegate:self andOutputDelegate:self];
    self.boardConsoleLabel.text = self.game.board.description;
}

- (IBAction)onClickSubmit:(id)sender {
    [self.game makeMove];
}

// MARK: - InputDelegate
- (NSArray<NSArray<NSNumber *> *> *)moveCoordinates
{
    NSArray<NSString *> *coordinatesText = [self.userChoice.text componentsSeparatedByString:@" "];
    NSArray<NSNumber *> *coordinates = @[@(coordinatesText[0].intValue), @(coordinatesText[1].intValue)];
    return @[coordinates];
}

// MARK: - OutputDelegate

-(void)draw
{
    self.boardConsoleLabel.text = [NSString stringWithFormat:@"%@", self.game.board];
}

-(void)drawGameOver
{
    self.boardConsoleLabel.text = self.game.gameOver;
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
