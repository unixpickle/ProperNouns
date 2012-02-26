//
//  ANProperNoun.m
//  ProperNouns
//
//  Created by Alex Nichol on 2/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ANProperNoun.h"

@implementation ANProperNoun

@synthesize wordRange;
@synthesize words;

- (id)initWithRange:(NSRange)range ofSentence:(ANSentence *)sentence {
    if ((self = [super init])) {
        wordRange = range;
        NSMutableArray * mWords = [NSMutableArray array];
        for (NSUInteger i = range.location; i < range.location + range.length; i++) {
            ANWord * _word = [[sentence words] objectAtIndex:i];
            [mWords addObject:_word];
        }
        words = [mWords copy];
    }
    return self;
}

- (NSString *)stringValue {
    NSMutableString * mString = [NSMutableString string];
    
    for (NSUInteger i = 0; i < [words count]; i++) {
        [mString appendString:[[words objectAtIndex:i] word]];
        if (i + 1 < [words count]) {
            [mString appendString:@" "];
        }
    }
    
    return [mString copy];
}

- (NSString *)word {
    return [NSString stringWithFormat:@"*%@*", [self stringValue]];
}

@end
