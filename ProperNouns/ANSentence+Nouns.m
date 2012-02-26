//
//  ANSentence+Nouns.m
//  ProperNouns
//
//  Created by Alex Nichol on 2/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ANSentence+Nouns.h"

@implementation ANSentence (Nouns)

- (NSArray *)properNouns {
    NSMutableArray * mProper = [NSMutableArray array];
    for (NSUInteger i = 0; i < [words count]; i++) {
        ANWord * word = [words objectAtIndex:i];
        BOOL requiresCont = NO;
        
        if (i == 0) {
            // TODO: check dictionary here...
            requiresCont = YES;
        }
        
        if ([word isCapitalized] || i == 0) {
            NSRange propRange = NSMakeRange(i, 1);
            NSUInteger lastSig = i;
            
            for (NSUInteger j = i + 1; j < [words count]; j++) {
                ANWord * subWord = [words objectAtIndex:j];
                if ([subWord isCapitalized] || ![subWord isSignificant]) {
                    if ([subWord isCapitalized]) lastSig = j;
                } else break;
            }
            
            if (lastSig > i || !requiresCont) {
                propRange.length = (lastSig - i) + 1;
                ANProperNoun * noun = [[ANProperNoun alloc] initWithRange:propRange
                                                               ofSentence:self];
                [mProper addObject:noun];
            }
        }
    }
    return [mProper copy];
}

@end
