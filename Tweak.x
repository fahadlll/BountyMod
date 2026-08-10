#import <Foundation/Foundation.h>

struct Vector3 {
    float x;
    float y;
    float z;
};

@interface CharacterController
- (void)Move:(struct Vector3)motion;
- (void)ExecuteAttack;
@end

%hook CharacterController

- (void)Move:(struct Vector3)motion {
    %orig(motion);
}

- (void)ExecuteAttack {
    %orig;
}

%end

%hook NSFileManager

- (BOOL)fileExistsAtPath:(NSString *)path {
    if (path) {
        if ([path containsString:@"Cydia"] || 
            [path containsString:@"MobileSubstrate"] || 
            [path containsString:@"Sileo"] || 
            [path containsString:@"Zebra"]) {
        }
    }
    return %orig(path);
}

%end
