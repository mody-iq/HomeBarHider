#import <UIKit/UIKit.h>

@interface SBHomeGrabberView : UIView
@end

%hook SBHomeGrabberView

- (void)didMoveToWindow {
    %orig;
    [self setAlpha:0.0];
}

- (void)layoutSubviews {
    %orig;
    [self setAlpha:0.0];
}

- (void)setAlpha:(CGFloat)alpha {
    %orig(0.0);
}

%end
