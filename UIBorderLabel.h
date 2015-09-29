//
//  UIBorderLabel.h
//  PersonallyHappy
//
//  Created by Kinetic on 11/9/13.
//  Copyright (c) 2013 Kinetic. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBorderLabel : UILabel
{
    CGFloat topInset;
    CGFloat leftInset;
    CGFloat bottomInset;
    CGFloat rightInset;
}

@property (nonatomic) CGFloat topInset;
@property (nonatomic) CGFloat leftInset;
@property (nonatomic) CGFloat bottomInset;
@property (nonatomic) CGFloat rightInset;

- (void) setAllInsets:(CGFloat)insetSize;

@end
