//
//  SocialViewController.m
//  RoanokeOutsideProject
//
//  Created by K Alnajar on 8/15/15.
//
//

#import "SocialViewController.h"
#import "UIHelper.h"

@interface SocialViewController ()

@end

@implementation SocialViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"Social";
    
    [self.view setBackgroundColor:[UIHelper getAppBackgroundColor]];
    
    UIButton *twitterPost = [UIHelper createFlatButtonWithRect:CGRectMake(20.0, self.view.frame.size.width/2 + 20.0, self.view.frame.size.width - 40.0, 40.0) andTitle:@"Twitter Tweet"];
    [twitterPost addTarget:self action:@selector(postTwitterTweet) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:twitterPost];
    
    UIButton *facebookPost = [UIHelper createFlatButtonWithRect:CGRectMake(20.0, self.view.frame.size.width/2 + 80.0, self.view.frame.size.width - 40.0, 40.0) andTitle:@"Facebook Post"];
    [facebookPost addTarget:self action:@selector(postFacebookStatus) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:facebookPost];
}

- (void)postTwitterTweet {
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter])
    {
        SLComposeViewController *tweetSheetOBJ = [SLComposeViewController
                                                  composeViewControllerForServiceType:SLServiceTypeTwitter];
        [tweetSheetOBJ addImage:[UIImage imageNamed:@"roanoke_outside.jpeg"]];
        [tweetSheetOBJ setInitialText:@"Having fun at #DragonsTooth!"];
        [self presentViewController:tweetSheetOBJ animated:YES completion:nil];
    }
}

- (void)postFacebookStatus {
    if([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]) {
        SLComposeViewController *fbSheetOBJ = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
        
        NSString *message = @"Posting from #DragonsTooth!";
        [fbSheetOBJ setInitialText:[NSString stringWithFormat:@"%@\n\r", message]];
        [fbSheetOBJ addURL:[NSURL URLWithString:@"www.roanokeoutside.com/dragons-tooth-trail"]];
        [fbSheetOBJ addImage:[UIImage imageNamed:@"roanoke_outside.jpeg"]];
        [self presentViewController:fbSheetOBJ animated:YES completion:Nil];
    }
}

@end
