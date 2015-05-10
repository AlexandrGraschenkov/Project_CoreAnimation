//
//  MyLayer.m
//  TestAnimation22222
//
//  Created by Alexander on 07.05.15.
//  Copyright (c) 2015 Alexander. All rights reserved.
//

#import "MyLayer.h"
#import <UIKit/UIKit.h>

@implementation MyLayer
@dynamic val;

- (instancetype)initWithLayer:(MyLayer *)layer {
    self = [super initWithLayer:layer];
    self.val = layer.val;
    static int count = 0;
    count++;
    NSLog(@"%d", count);
    return self;
}

- (id<CAAction>)actionForKey:(NSString *)event {
    CABasicAnimation *result = (id)[super actionForKey:event];
    if ([event isEqual:@"position"]) {
        result = [result mutableCopy];
        result.duration = 2.0;
    }
    if ([event isEqual:@"val"]) {
        CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"val"];
        anim.duration = 0.2;
        CGVector
        anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
        anim.fromValue = @(self.val);
        return anim;
    }
    return result;
}

+ (BOOL)needsDisplayForKey:(NSString *)key {
    BOOL result = [super needsDisplayForKey:key];
    result |= [key isEqual:@"val"];
    return result;
}

- (void)drawInContext:(CGContextRef)ctx {
    CGRect frame = self.bounds;
    frame.size.height *= self.val;
    CGContextSetFillColorWithColor(ctx, [UIColor blueColor].CGColor);
    CGContextFillRect(ctx, frame);
}

@end
