//
//  UIHelper.h
//  PersonallyHappy
//
//  Created by Kinetic on 11/9/13.
//  Copyright (c) 2013 Kinetic. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "UIColor+FlatUI.h"
#import "UIFont+FlatUI.h"

@interface UIHelper : NSObject
+(UIColor *) getAppBackgroundColor;
+(UIButton *)createFlatButtonWithRect:(CGRect)rect andTitle:(NSString *)title;
+(UIButton *)createFlatButtonWithRect:(CGRect)rect andTitle:(NSString *)title andBackgroundColor:(UIColor *)backgroundColor andTextColor:(UIColor *)textColor;
+(UIImageView *)createProfilePictureWithRect:(CGRect)rect andImage:(NSURL *)imageURL;
+(UITextField *)createCommonTextFieldWithRect:(CGRect)rect andPlaceholder:(NSString *)placeholder;
+(UITextField *)createPasswordFieldWithRect:(CGRect)rect andPlaceholder:(NSString *)placeholder;
@end
