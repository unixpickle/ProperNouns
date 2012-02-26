//
//  ANWord.m
//  ProperNouns
//
//  Created by Alex Nichol on 2/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ANWord.h"
#import "ANShortWord.h"
#import "ANPunctuation.h"

@implementation ANWord

@synthesize word;

+ (BOOL)isWordNamePrefix:(NSString *)word {
    NSArray * prefixes = [NSArray arrayWithObjects:@"Mr.", @"Dr.", @"Mrs.", @"Ms.", nil];
    return [prefixes containsObject:word];
}

+ (ANWord *)wordWithString:(NSString *)string {
    NSArray * array = [NSArray arrayWithObjects:@"in", @"the", @"of", nil];
    if ([string length] == 1) {
        unichar theChar = [string characterAtIndex:0];
        if ([ANPunctuation isPunctuationCharacter:theChar]) {
            return [[ANPunctuation alloc] initWithWord:string];
        }
    }
    if ([array containsObject:[string lowercaseString]]) {
        return [[ANShortWord alloc] initWithWord:string];
    }
    return [[ANWord alloc] initWithWord:string];
}

- (id)initWithWord:(NSString *)aWord {
    if ((self = [super init])) {
        word = aWord;
    }
    return self;
}

- (BOOL)isSignificant {
    return YES;
}

- (BOOL)isPunctuation {
    return NO;
}

- (BOOL)isCapitalized {
    if ([self isPunctuation]) return NO;
    if ([self isSignificant]) {
        if ([word isEqualToString:@"I"]) return NO; // special case
        if ([word length] > 0) {
            if (isupper([word characterAtIndex:0])) return YES;
        }
    }
    return NO;
}

@end
