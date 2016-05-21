//
//  BucketSort.m
//  Sorting
//
//  Created by Ali, Sarmad on 5/13/16.
//  Copyright © 2016 Pxlim. All rights reserved.
//

#import "BucketSort.h"
#import "NSMutableArray+Additions.h"
@implementation BucketSort

-(void)sort{
    
    if (self.isSorted || self.sortedArray.count <= 1) {
        return;
    }
    
   
    NSArray<NSNumber*>* minmax = [self.sortedArray minmax];
    NSUInteger min = [minmax objectAtIndex:0].unsignedIntegerValue;
    NSUInteger max = [minmax objectAtIndex:1].unsignedIntegerValue;
    
    NSUInteger bucketSize = max-min+1;
    NSUInteger *buckets = malloc(sizeof(NSUInteger)*bucketSize);
    
    for (NSNumber *number in self.sortedArray) {
        NSUInteger bucketIndex = number.unsignedIntegerValue - min;
        buckets[bucketIndex]++;
    }
    
    NSUInteger sortedIndex = 0;
    for (int idx = 0; idx<bucketSize; idx++) {
        NSUInteger occurances = buckets[idx];
        while (occurances > 0) {
            NSUInteger value = idx + min;
            self.sortedArray[sortedIndex] = [NSNumber numberWithUnsignedInteger:value];
            sortedIndex++;
            occurances--;
        }
    }
    
    free(buckets);
    
    self.isSorted = true;
    
}




@end
