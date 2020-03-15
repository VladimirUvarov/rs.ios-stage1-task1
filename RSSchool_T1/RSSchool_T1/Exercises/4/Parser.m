#import "Parser.h"

@implementation Parser

void addRange(NSMutableArray * rArr, NSMutableArray * arr, int j){
    if ([arr count] > 0) {
        int start = [[arr lastObject] intValue];
        [rArr addObject:[NSValue valueWithRange: NSMakeRange(start, j - start)]];
        [arr removeLastObject];
    }
}

- (NSArray <NSString*>*)parseString:(NSString*)string {
    NSMutableArray *rangeArray = [[NSArray array] mutableCopy];
    NSMutableArray *tArray = [[NSArray array] mutableCopy];
    NSMutableArray *sArray = [[NSArray array] mutableCopy];
    NSMutableArray *qArray = [[NSArray array] mutableCopy];
    for (int i = 0; i < string.length; i++) {
        NSString *s = [string substringWithRange:NSMakeRange(i, 1)];
        if ([s isEqualToString: @"<"]){
            [tArray addObject: [NSNumber numberWithInt: i + 1]];
        } else if ([s isEqualToString: @"("]){
            [sArray addObject: [NSNumber numberWithInt: i + 1]];
        } else if ([s isEqualToString: @"["]){
            [qArray addObject: [NSNumber numberWithInt: i + 1]];
        }
        else if ([s isEqualToString: @">"]){
            addRange(rangeArray, tArray, i);
        } else if ([s isEqualToString: @")"]){
            addRange(rangeArray, sArray, i);
        } else if ([s isEqualToString: @"]"]){
            addRange(rangeArray, qArray, i);
        }
    }
    NSComparator sorter = ^NSComparisonResult(NSValue *value1, NSValue *value2) {
        NSComparisonResult result = NSOrderedSame;
        if (value1.rangeValue.location < value2.rangeValue.location) {
            result = NSOrderedAscending;
        } else if (value1.rangeValue.location > value2.rangeValue.location) {
            result = NSOrderedDescending;
        }
        return result;
    };
    NSMutableArray *resultArray = [[NSArray array] mutableCopy];
    for (NSValue *val in [rangeArray sortedArrayUsingComparator:sorter]) {
        [resultArray addObject:[string substringWithRange:[val rangeValue]]];
    }
    return resultArray;
}

@end


    
