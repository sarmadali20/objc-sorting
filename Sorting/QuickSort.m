//
//  QuickSort.m
//  Sorting
//
//  Created by Ali, Sarmad on 5/21/16.
//  Copyright © 2016 Pxlim. All rights reserved.
//

#import "QuickSort.h"

@implementation QuickSort

-(void) sort {
    
    NSUInteger size = self.sortedArray.count;
    [self quickSort:0 andRight:(size-1)];
    self.isSorted = YES;
    
}

-(void)quickSort:(NSUInteger)left andRight:(NSUInteger)right {
    
    NSUInteger index = [self partition:left andRight:right];
    
    if(left < index - 1) {
        [self quickSort:left andRight:index - 1];
    }
    
    if(index < right) {
        [self quickSort:index andRight:right];
    }
    
    
}

-(NSUInteger)partition:(NSUInteger)left andRight:(NSUInteger)right {
    
    NSUInteger i=left;
    NSUInteger j=right;
    NSNumber* temp;
    
    NSUInteger pivot = self.sortedArray[(NSUInteger)(left+right)/2].unsignedIntegerValue;
    
    while(i<=j) {
        
        while(self.sortedArray[i].unsignedIntegerValue < pivot) {
            i++;
        }
        
        while (self.sortedArray[j].unsignedIntegerValue > pivot) {
            j--;
        }
        
        if(i<=j) {
            temp = self.sortedArray[i];
            self.sortedArray[i] = self.sortedArray[j];
            self.sortedArray[j] = temp;
            i++;
            j--;
        }
    }
    
    return i;
}

@end
