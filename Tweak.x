#import <substrate.h>

%hook NSFileManager
- (BOOL)fileExistsAtPath:(NSString *)path {
    if ([path containsString:@"Cydia"] || [path containsString:@"MobileSubstrate"] || [path containsString:@"Sileo"] || [path containsString:@"Zebra"]) {
        return NO;
    }
    return %orig;
}
%end

struct Vector3 {
    float x;
    float y;
    float z;
};

%hook CharacterController
- (void)Move:(struct Vector3)motion {
    struct Vector3 modifiedMotion;
    modifiedMotion.x = motion.x * 4.0f;
    modifiedMotion.y = motion.y;
    modifiedMotion.z = motion.z * 4.0f;
    %orig(modifiedMotion);
}
%end

%hook AttackComponent
- (void)ExecuteAttack {
    for (int i = 0; i < 20; i++) {
        %orig();
    }
}
%end
