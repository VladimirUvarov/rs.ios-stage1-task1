#import "PalindromeSolver.h"

@implementation PalindromeSolver

- (NSString *) highestValuePalindrome:(NSString *)s n:(NSNumber *)n k:(NSNumber *)k {
    NSMutableArray *tArray = [[NSArray array] mutableCopy];
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    int allOps = [k intValue];
    int needOps = 0;
    for (int i = 0; i < s.length; i++) {
        NSString *s1 = [s substringWithRange:NSMakeRange(i, 1)];
        [tArray addObject:[formatter numberFromString:s1]];
    }
    for (int i = 0; i < (tArray.count / 2); i++) {
        if (tArray[i] != tArray[tArray.count - 1 - i]) {
            needOps++;
        }
    }
    if (needOps > allOps) {
        return @"-1";
    }
    for (int i = 0; i < (tArray.count / 2); i++) {
        Boolean inEqual = ([tArray[i] intValue] != [tArray[tArray.count - 1 - i] intValue]);
        if ((allOps > needOps + 1 || (inEqual && allOps > needOps)) && [tArray[i] intValue] != 9) {
            tArray[i] = [NSNumber numberWithInt:9];
            allOps--;
            tArray[tArray.count - 1 - i] = [NSNumber numberWithInt:9];
            allOps--;
            if (inEqual)
            {
                needOps--;
            }
        } else if ([tArray[i] intValue] > [tArray[tArray.count - 1 - i] intValue]) {
            tArray[tArray.count - 1 - i] = tArray[i];
            allOps--;
            needOps--;
        } else if ([tArray[i] intValue] < [tArray[tArray.count - 1 - i] intValue]) {
            tArray[i] = tArray[tArray.count - 1 - i];
            allOps--;
            needOps--;
        }
    }
    if (tArray.count % 2 && allOps > 0) {
        tArray[(tArray.count / 2)] = [NSNumber numberWithInt:9];
    }
    NSMutableString * res = [NSMutableString new];
    for (int i = 0; i < tArray.count; i++) {
        [res appendString: [tArray[i] stringValue]];
    }
    return res;
}

@end
