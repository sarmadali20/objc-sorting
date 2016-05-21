//
//  Sort.h
//  Sorting
//
//  Created by Ali, Sarmad on 5/15/16.
//  Copyright © 2016 Pxlim. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Sort : NSObject
@property(nonatomic,strong) NSMutableArray<NSNumber*>* sortedArray;
@property(nonatomic,assign) BOOL isSorted;

-(instancetype)init:(NSMutableArray<NSNumber*>*)array;
-(void) sort;
-(void) printSorted;
@end
