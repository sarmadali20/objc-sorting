//
//  MergeSort.h
//  Sorting
//
//  Created by Ali, Sarmad on 5/20/16.
//  Copyright © 2016 Pxlim. All rights reserved.
//

#import "Sort.h"

@interface MergeSortParallelism : Sort
@property (assign) NSUInteger *temp;
@property (assign) int mergeSortCount;
@property (assign) int mergeCount;
@property (retain) dispatch_group_t mergesortGroup;

@end
