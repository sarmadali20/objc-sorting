//
//  MergeSort.m
//  Sorting
//
//  Created by Ali, Sarmad on 5/20/16.
//  Copyright © 2016 Pxlim. All rights reserved.
//

#import "MergeSortParallelism.h"
#import "NSMutableArray+Additions.h"
@implementation MergeSortParallelism
@synthesize temp,mergeCount,mergeSortCount,mergesortGroup;

-(void) sort {
    
    NSUInteger size = self.sortedArray.count;
    NSUInteger mid = (size-1)/2;
    temp = malloc(sizeof(NSUInteger)*size);
    mergeSortCount = 0;
    mergeCount = 0;
    
    __block NSMutableArray<NSNumber*>* left = [[self.sortedArray subarrayWithRange:NSMakeRange(0, mid+1)] mutableCopy];
    
    __block NSMutableArray<NSNumber*>* right = [[self.sortedArray subarrayWithRange:NSMakeRange(mid+1, mid+1)] mutableCopy];
    
    __block MergeSortParallelism * leftSorter = [[MergeSortParallelism alloc] init:left];
    
    __block MergeSortParallelism * rightSorter = [[MergeSortParallelism alloc] init:right];
    
    self.mergesortGroup = dispatch_group_create();
    dispatch_group_async(self.mergesortGroup, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        
        [leftSorter sort];
    
    });

    
    dispatch_group_async(self.mergesortGroup, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        
        [rightSorter sort];
        
    });

    
    MergeSortParallelism* __weak weakSelf = self;

    dispatch_group_notify(self.mergesortGroup,dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^ {
        weakSelf.sortedArray = [[leftSorter.sortedArray arrayByAddingObjectsFromArray:rightSorter.sortedArray] mutableCopy];
        [weakSelf merge:0 andMid:mid andHigh:size-1];
        weakSelf.isSorted = YES;
        free(weakSelf.temp);
        
    });
    
}

-(void) mergeSort:(NSUInteger)low andHigh:(NSUInteger)high {
    
   
    if(low < high) {
        
        NSUInteger mid = (low+high)/2;
        self.mergeSortCount++;
       // NSLog(@"mergeSort = %d, low = %lu , mid=%lu , high=%lu",weakSelf.mergeSortCount,low,mid,high);
        // Left half
        [self mergeSort:low andHigh:mid];
        // Right half
        [self mergeSort:mid+1 andHigh:high];
        
        // Merge every thing
        [self merge:low andMid:mid andHigh:high];
        
        
    }

    
}

-(void) merge:(NSUInteger)low andMid:(NSUInteger)mid andHigh:(NSUInteger)high {
    
    self.mergeCount++;
    //NSLog(@"merge = %d, low = %lu , mid=%lu , high=%lu",self.mergeCount,low,mid,high);

    
    NSUInteger i = low,j=mid+1,index = low,k;
    
    while (i<=mid && j<= high) {
        if(self.sortedArray[i].unsignedIntegerValue <= self.sortedArray[j].unsignedIntegerValue) {
            self.temp[index] = self.sortedArray[i].unsignedIntegerValue;
            i++;
        } else {
            self.temp[index] = self.sortedArray[j].unsignedIntegerValue;
            j++;
        }
        index++;
    }
    
    // TODO : Understand the extra loops
    if(i>mid) {
        
        for (k=j; k<=high; k++) {
            self.temp[index] = self.sortedArray[k].unsignedIntegerValue;
            index++;
        }
        
    } else {
        
        for(k=i;k<=mid;k++)  {
            self.temp[index] = self.sortedArray[k].unsignedIntegerValue;
            index++;
        }
    }
    
    for (NSUInteger k=low; k<=high; k++) {
        self.sortedArray[k] = [NSNumber numberWithUnsignedInteger:self.temp[k]];
         NSLog(@"Index = %lu , Value=%lu",k,self.temp[k]);
    }
}

-(void) dealloc {
    mergesortGroup = nil;
    
    
}

@end
