//
//  UIHelper.m
//  PersonallyHappy
//
//  Created by Kinetic on 11/9/13.
//  Copyright (c) 2013 Kinetic. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "UIHelper.h"

@implementation UIHelper

+(UIColor *) getAppBackgroundColor
{
    return [UIColor cloudsColor];
}

+(UIButton *)createFlatButtonWithRect:(CGRect)rect andTitle:(NSString *)title
{
    UIButton *flatButton = [[UIButton alloc] initWithFrame:rect];
    [flatButton setTitle:title forState:UIControlStateNormal];
    flatButton.backgroundColor = [UIColor peterRiverColor];
//    flatButton.titleLabel.font = [UIFont boldFlatFontOfSize:16];
    [flatButton setTitleColor:[UIColor cloudsColor] forState:UIControlStateNormal];
    [flatButton setTitleColor:[UIColor cloudsColor] forState:UIControlStateHighlighted];
    return flatButton;
}

+(UIButton *)createFlatButtonWithRect:(CGRect)rect andTitle:(NSString *)title andBackgroundColor:(UIColor *)backgroundColor andTextColor:(UIColor *)textColor
{
    UIButton *flatButton = [UIHelper createFlatButtonWithRect:rect andTitle:title];
    flatButton.backgroundColor = backgroundColor;
    [flatButton setTitleColor:textColor forState:UIControlStateNormal];
    [flatButton setTitleColor:textColor forState:UIControlStateHighlighted];
    return flatButton;
}

//+(FBProfilePictureView *)createFacebookProfilePictureViewWithFrame:(CGRect)frame andID:(NSString *)fb_id
//{
//    FBProfilePictureView *fbProfilePicView = [[FBProfilePictureView alloc] initWithProfileID:fb_id pictureCropping:FBProfilePictureCroppingSquare];
//    [fbProfilePicView setFrame:frame];
//    //        [self.fbProfilePicView.layer setBorderColor:[[UIColor colorWithRed:(255/255.0) green:(255/255.0) blue:(255/255.0) alpha:1.0] CGColor]];
//    [fbProfilePicView.layer setBorderColor:[[UIColor midnightBlueColor] CGColor]];
//    [fbProfilePicView.layer setBorderWidth:5.0];
//    [fbProfilePicView.layer setCornerRadius:50.0];
//    return fbProfilePicView;
//}

+(UIImageView *)createProfilePictureWithRect:(CGRect)rect andImage:(NSURL *)imageURL
{
    UIImageView *profilePicView = [[UIImageView alloc] initWithFrame:rect];
    //    self.profilePicView.contentMode = UIViewContentModeScaleAspectFit;
    profilePicView.contentMode = UIViewContentModeScaleAspectFill;
    [profilePicView setBackgroundColor:[UIColor clearColor]];
    //    [self.profilePicView.layer setBorderColor:[[UIColor colorWithRed:(255/255.0) green:(255/255.0) blue:(255/255.0) alpha:1.0] CGColor]];
    [profilePicView.layer setBorderColor:[[UIColor midnightBlueColor] CGColor]];
    [profilePicView.layer setBorderWidth:5.0];
    [profilePicView.layer setCornerRadius:8.0];
    [profilePicView.layer setMasksToBounds:YES];
//    [profilePicView setImageWithURL:imageURL];
    return profilePicView;
}

+(UITextField *)createCommonTextFieldWithRect:(CGRect)rect andPlaceholder:(NSString *)placeholder
{
    UITextField *commonTextField = [[UITextField alloc] initWithFrame:rect];
    [commonTextField setPlaceholder:placeholder];
    [commonTextField setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
    commonTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:placeholder attributes:@{NSForegroundColorAttributeName: [[UIColor midnightBlueColor] colorWithAlphaComponent:0.7]}];
    [commonTextField setAutocorrectionType:UITextAutocorrectionTypeNo];
    commonTextField.leftViewMode = UITextFieldViewModeAlways;
    UIView* leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
    commonTextField.leftView = leftView;
    commonTextField.backgroundColor = [UIColor silverColor];
    commonTextField.layer.cornerRadius = 3.0f;
    return commonTextField;
}

+(UITextField *)createPasswordFieldWithRect:(CGRect)rect andPlaceholder:(NSString *)placeholder
{
    UITextField *passwordTextField = [UIHelper createCommonTextFieldWithRect:rect andPlaceholder:placeholder];
    [passwordTextField setSecureTextEntry:YES];
    return passwordTextField;
}

@end
