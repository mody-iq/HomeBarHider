#import <UIKit/UIKit.h>

@interface SBHomeGrabberView : UIView
@end

@interface MTLumaDodgePillView : UIView
@end

%hook SBHomeGrabberView

- (void)didMoveToWindow {
    %orig;
    self.hidden = YES;
}

- (void)layoutSubviews {
    %orig;
    self.hidden = YES;
}

- (void)setHidden:(BOOL)hidden {
    %orig(YES);
}

- (void)setAlpha:(CGFloat)alpha {
    %orig(0.0);
}

%end

%hook MTLumaDodgePillView

- (void)didMoveToWindow {
    %orig;
    NSString *parentName = NSStringFromClass([self.superview class]);
    if ([parentName containsString:@"HomeGrabber"]) {
        self.hidden = YES;
    }
}

- (void)layoutSubviews {
    %orig;
    NSString *parentName = NSStringFromClass([self.superview class]);
    if ([parentName containsString:@"HomeGrabber"]) {
        self.hidden = YES;
    }
}

%end
