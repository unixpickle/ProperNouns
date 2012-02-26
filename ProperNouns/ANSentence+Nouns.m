//
//  ANSentence+Nouns.m
//  ProperNouns
//
//  Created by Alex Nichol on 2/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ANSentence+Nouns.h"

@implementation ANSentence (Nouns)

- (NSArray *)properNouns:(id<NameChecker>)checker {
    NSMutableArray * mProper = [NSMutableArray array];
    for (NSUInteger i = 0; i < [words count]; i++) {
        ANWord * word = [words objectAtIndex:i];
        BOOL requiresCont = NO;
        
        if (i == 0) {
            if (checker) requiresCont = ![checker wordIsName:word.word];
            else requiresCont = YES;
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
                i = lastSig;
            }
        }
    }
    return [mProper copy];
}

- (ANSentence *)sentenceWithProperNouns:(id<NameChecker>)checker {
    NSMutableArray * mWords = [NSMutableArray array];
    NSArray * properNouns = [self properNouns:checker];
    NSUInteger endIndex = 0;
    
    for (NSUInteger i = 0; i < [properNouns count]; i++) {
        ANProperNoun * noun = [properNouns objectAtIndex:i];
        
        // add regular words between the previous proper noun and this one.
        for (NSUInteger j = endIndex; j < noun.wordRange.location; j++) {
            [mWords addObject:[words objectAtIndex:j]];
        }
        
        [mWords addObject:noun];
        endIndex = noun.wordRange.location + noun.wordRange.length;
    }
    
    // add trailing words
    for (NSUInteger i = endIndex; i < [words count]; i++) {
        [mWords addObject:[words objectAtIndex:i]];
    }
    
    return [[ANSentence alloc] initWithWords:[mWords copy]];
}

@end
