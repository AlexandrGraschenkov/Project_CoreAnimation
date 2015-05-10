//
//  ViewController.m
//  TestAnimation22222
//
//  Created by Alexander on 07.05.15.
//  Copyright (c) 2015 Alexander. All rights reserved.
//

#import "ViewController.h"
#import "MyLayer.h"

@interface ViewController ()
{
    MyLayer *layer;
}
@property (nonatomic, weak) IBOutlet UIView *animView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [UIView animateWithDuration:40.0 delay:0.0 usingSpringWithDamping:0.5 initialSpringVelocity:0 options:UIViewAnimationOptionAllowUserInteraction animations:^{
        self.animView.center = CGPointMake(self.animView.center.x, self.animView.center.y + 300);
    } completion:nil];
    
    layer = [MyLayer new];
    layer.frame = CGRectMake(150, 100, 100, 100);
    layer.backgroundColor = [UIColor greenColor].CGColor;
    [self.view.layer addSublayer:layer];
}

- (IBAction)butt2Pressed:(UIButton *)sender {
    NSLog(@"%@", NSStringFromCGRect(sender.frame));
}

- (IBAction)buttPressed:(id)sender {
    layer.val += 0.3;
    return;
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    anim.path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(100, 100, 200, 200)].CGPath;
    anim.duration = 1.0;
//    anim.repeatCount = 10000000;
    anim.calculationMode = kCAAnimationCubicPaced;
    anim.rotationMode = kCAAnimationRotateAuto;
    [layer addAnimation:anim forKey:@"sdfsdf"];
    
//    layer.position = CGPointMake(layer.position.x, layer.position.y + 100.0);
    
//    CABasicAnimation *animation = [CABasicAnimation animation];
//    animation.keyPath = @"position.y";
//    CGFloat y = layer.position.y;
//    animation.fromValue = @(y);
//    animation.toValue = @(y+100);
//    animation.duration = 1;
//    [layer addAnimation:animation forKey:@"sfdsdfsd"];
//    
//    layer.position = CGPointMake(layer.position.x, y + 100);
//
//    return;
//    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"position.y"];
//    anim.byValue = @100;
////    anim.additive = YES;
//    anim.duration = 1.0;
////    anim.fillMode = kCAFillModeForwards;
////    anim.removedOnCompletion = NO;
//    [layer addAnimation:anim forKey:@"pos"];
////    layer.position = CGPointMake(layer.position.x, layer.position.y + 100);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
