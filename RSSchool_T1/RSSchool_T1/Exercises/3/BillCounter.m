#import "BillCounter.h"

@implementation BillCounter

- (NSString*)compareResultForBill:(NSArray<NSNumber*>*)bill notIncludingElementWithIndex:(NSInteger)index withGivenSum:(NSNumber*)sum {
    int realSum = 0;
    for (int i = 0; i < bill.count; i++) {
        realSum = realSum + (i == index ? 0 : [bill[i] intValue]);
    }
    realSum = realSum / 2;
    if (realSum == [sum intValue]) {
        return @"Bon Appetit";
    }
    else {
        return  @([sum intValue] - realSum).stringValue;;
    }
}

@end
