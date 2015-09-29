//
//  UIBorderLabel.m
//  PersonallyHappy
//
//  Created by Kinetic on 11/9/13.
//  Copyright (c) 2013 Kinetic. All rights reserved.
//

#import "UIBorderLabel.h"

@implementation UIBorderLabel

@synthesize topInset, leftInset, bottomInset, rightInset;

- (void)drawTextInRect:(CGRect)rect
{
    UIEdgeInsets insets = {self.topInset, self.leftInset,
        self.bottomInset, self.rightInset};
    
    return [super drawTextInRect:UIEdgeInsetsInsetRect(rect, insets)];
}

- (void) setAllInsets:(CGFloat)insetSize
{
    self.topInset = insetSize;
    self.bottomInset = insetSize;
    self.rightInset = insetSize;
    self.leftInset = insetSize;
}

@end
