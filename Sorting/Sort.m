//
//  Sort.m
//  Sorting
//
//  Created by Ali, Sarmad on 5/15/16.
//  Copyright © 2016 Pxlim. All rights reserved.
//

#import "Sort.h"
#import "NSMutableArray+Additions.h"
#import "Utils.h"
@implementation Sort
-(instancetype)initWithSize:(NSUInteger)size {
    
    if(self = [super init]) {
        
        NSMutableArray<NSNumber*>* usArray =[[NSMutableArray alloc] init];
        [Utils fillUsArray:usArray withSize:size];
        
        _sortedArray = usArray;
        _isSorted = false;
        return self;
    }
    
    return nil;
    
}

-(instancetype)initWithArray:(NSMutableArray<NSNumber *> *)array{
    
    if(self = [super init]) {
        
        _sortedArray = array;
        _isSorted = false;
        return self;
    }
    
    return nil;
    
}

-(void) sort {

    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:[NSString stringWithFormat:@"You must override %@ in a subclass", NSStringFromSelector(_cmd)]
                                 userInfo:nil];
}


-(void)printSorted {
    if(!self.isSorted) {
        NSLog(@"Not yet sorted please send a sort message to this instance");
    }
    
    [_sortedArray print];
    
}

-(void)dealloc {
    NSLog(@"dealloc");
    _sortedArray = nil;
}

@end
