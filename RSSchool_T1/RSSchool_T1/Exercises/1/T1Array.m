#import "T1Array.h"

@implementation T1Array

- (NSArray *)convertToHappy:(NSArray *)sadArray {
    NSMutableArray *happyArray = [sadArray mutableCopy];
    int i = 0;
    while (i < happyArray.count) {
        if (i == 0 || i == happyArray.count - 1){
            i = i + 1;
        }
        else if ([happyArray[i] intValue] > ([happyArray[i - 1] intValue] + [happyArray[i + 1] intValue])){
            [happyArray removeObjectAtIndex:i];
            i = i - 1;
        }
        else {
            i = i + 1;
        }
    }
    return happyArray;
}

@end
