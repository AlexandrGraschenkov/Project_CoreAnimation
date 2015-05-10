//
//  MyButton.m
//  TestAnimation22222
//
//  Created by Alexander on 07.05.15.
//  Copyright (c) 2015 Alexander. All rights reserved.
//

#import "MyButton.h"

@implementation MyButton

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    CALayer *layer = self.layer.presentationLayer;
//    NSLog(@"%@", NSStringFromCGRect(layer.frame));
    if (layer) {
        point = [self convertPoint:point toView:self.superview];
        return CGRectContainsPoint(layer.frame, point)? self : nil;
    }
    return [super hitTest:point withEvent:event];
}

@end
