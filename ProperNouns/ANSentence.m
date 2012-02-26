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

- (NSString *)stringValue {
    NSMutableString * mString = [NSMutableString string];
    
    for (NSUInteger i = 0; i < [words count]; i++) {
        ANWord * word = [words objectAtIndex:i];
        
        if (![word isPunctuation] && i != 0) {
            [mString appendString:@" "];
        }
        
        [mString appendString:word.word];
    }
    
    [mString appendString:@"."];
    return [mString copy];
}

@end
