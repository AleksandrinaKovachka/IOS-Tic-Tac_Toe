//
//  TemplatePageViewController.m
//  Tic-Tac-Toe
//
//  Created by A-Team Intern on 12.05.21.
//

#import "TemplatePageViewController.h"

@interface TemplatePageViewController ()

@end

@implementation TemplatePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.gameImage.image = [UIImage imageNamed:self.imageName];
    self.gameNameLabel.text = self.gameNameText;
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
