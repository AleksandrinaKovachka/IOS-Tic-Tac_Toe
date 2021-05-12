//
//  TemplatePageViewController.h
//  Tic-Tac-Toe
//
//  Created by A-Team Intern on 12.05.21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TemplatePageViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *gameImage;
@property (weak, nonatomic) IBOutlet UILabel *gameNameLabel;

@property (nonatomic) NSUInteger pageIndex;
@property (strong, nonatomic) NSString* gameNameText;
@property (strong, nonatomic) NSString* imageName;

@end

NS_ASSUME_NONNULL_END
