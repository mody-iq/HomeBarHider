#import <UIKit/UIKit.h>
#import <objc/runtime.h>

static BOOL HBH_IsGrabber(UIView *view) {
    UIView *current = view;
    for (int i = 0; i < 4 && current; i++) {
        NSString *name = NSStringFromClass([current class]);
        if ([name containsString:@"HomeGrabber"]) {
            return YES;
        }
        current = current.superview;
    }
    return NO;
}

%group GrabberHook

%hook SBHomeGrabberView

- (void)didMoveToWindow {
    %orig;
    self.hidden = YES;
}

- (void)layoutSubviews {
    %orig;
    if (!self.hidden) {
        self.hidden = YES;
    }
}

- (void)setHidden:(BOOL)hidden {
    %orig(YES);
}

- (void)setAlpha:(CGFloat)alpha {
    %orig(0.0);
}

%end

%end

%group PillHook

%hook MTLumaDodgePillView

- (void)didMoveToWindow {
    %orig;
    if (HBH_IsGrabber(self)) {
        self.hidden = YES;
    }
}

- (void)layoutSubviews {
    %orig;
    if (!self.hidden && HBH_IsGrabber(self)) {
        self.hidden = YES;
    }
}

%end

%end

%ctor {
    @autoreleasepool {
        if (objc_getClass("SBHomeGrabberView")) {
            %init(GrabberHook);
        }
        if (objc_getClass("MTLumaDodgePillView")) {
            %init(PillHook);
        }
    }
}
