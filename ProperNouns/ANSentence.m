//
//  ANSentence.m
//  ProperNouns
//
//  Created by Alex Nichol on 2/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ANSentence.h"

@implementation ANSentence

@synthesize words;

- (id)initWithWords:(NSArray *)array {
    if ((self = [super init])) {
        words = array;
    }
    return self;
}

@end
