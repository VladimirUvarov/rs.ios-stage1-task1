#import "MiniMaxArrayConverter.h"

@implementation MiniMaxArrayConverter

- (NSArray<NSNumber*>*)convertFromArray:(NSArray<NSNumber*>*)array {
    int min = 0;
    int max = 0;
    id mySorter = ^(NSNumber * obj1, NSNumber * obj2){
        return [obj1 compare:obj2];
    };
    NSArray * sortedMyObjects = [array sortedArrayUsingComparator:mySorter];
    for (int i= 0; i < sortedMyObjects.count; i++) {
        max = max + (i == 0 ? 0 : [sortedMyObjects[i] intValue]);
        min = min + ((i == sortedMyObjects.count - 1 ) ? 0 : [sortedMyObjects[i] intValue]);
    }
    return @[ @(min), @(max) ];
}

@end
