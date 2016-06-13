//
//  HypnosisView.m
//  Hypnosister
//
//  Created by Ernald on 5/12/16.
//  Copyright © 2016 Big Nerd. All rights reserved.
//

#import "HypnosisView.h"

@implementation MyWindow
- (void) sendEvent:(UIEvent *)event
{
    [super sendEvent:event];
    
    NSLog(@"%@", event);
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"Window was touched!");
}
- (void)addSubview:(UIView *)view
{
    [super addSubview:view];
}

@end

@interface HypnosisView ()
@property (strong, nonatomic) UIColor *circleColor;
@end

@implementation HypnosisView

- (instancetype) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if(self)
    {
        self.backgroundColor = [UIColor clearColor];
        self.userInteractionEnabled = YES;
        _circleColor = [UIColor lightGrayColor];
    }
    
    return self;
}

-(void) setCircleColor:(UIColor *)circleColor
{
    _circleColor = circleColor;
    [self setNeedsDisplay];
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"%@ was touched", self);
    
    float red = (arc4random() % 100) / 100.0;
    float green = (arc4random() % 100) / 100.0;
    float blue = (arc4random() % 100) / 100.0;
    
    self.circleColor = [UIColor colorWithRed:red green:green blue:blue alpha:1];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    CGRect bounds = CGRectInset(self.bounds, 10, 10);
    CGPoint center;
    center.x = (bounds.origin.x + bounds.size.width) / 2.0;
    center.y = (bounds.origin.y + bounds.size.height) / 2.0;
    
    float maxRadius = hypot(bounds.size.width, bounds.size.height) / 2.0;
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    for(float currentRadius = maxRadius; currentRadius > 0; currentRadius -= 20)
    {
        [path moveToPoint:CGPointMake(center.x + currentRadius, center.y)];
        
        [path addArcWithCenter:center radius:currentRadius
                    startAngle:0 endAngle:M_PI * 2.0 clockwise:YES];
    }
    
    [self.circleColor setStroke];
    
    path.lineWidth = 10;
    
    [path stroke];
}

@end
