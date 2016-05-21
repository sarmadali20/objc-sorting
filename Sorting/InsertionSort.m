//
//  InsertionSort.m
//  Sorting
//
//  Created by Ali, Sarmad on 5/15/16.
//  Copyright © 2016 Pxlim. All rights reserved.
//

#import "InsertionSort.h"

@implementation InsertionSort
-(void) sort {
    
    NSUInteger size = self.sortedArray.count;
    for(NSUInteger i=1;i<size;i++) {
        NSNumber *currentValue = self.sortedArray[i];
        NSUInteger j = i;
        while (j > 0 && self.sortedArray[j-1].unsignedIntegerValue > currentValue.unsignedIntegerValue) {
            self.sortedArray[j] = self.sortedArray[j-1];
            j--;
        }
        
        self.sortedArray[j] = currentValue;
        
    }
    
    self.isSorted = YES;
    
}
@end
