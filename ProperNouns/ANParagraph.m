//
//  ANParagraph.m
//  ProperNouns
//
//  Created by Alex Nichol on 2/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ANParagraph.h"

@implementation ANParagraph

@synthesize sentences;

- (id)initWithSentences:(NSArray *)array {
    if ((self = [super init])) {
        sentences = array;
    }
    return self;
}

- (id)initWithString:(NSString *)paragraph {
    if ((self = [super init])) {
        NSCharacterSet * whitespace = [NSCharacterSet whitespaceAndNewlineCharacterSet];
        NSArray * tokens = [paragraph componentsSeparatedByCharactersInSet:whitespace];
        NSMutableArray * mSentence = [NSMutableArray array];
        NSMutableArray * mSentences = [NSMutableArray array];
        
        for (NSString * token in tokens) {
            ANWord * mainToken, * suffixToken = nil;
            unichar lastChar;
            
            if ([token length] == 0) continue;
            lastChar = [token characterAtIndex:([token length] - 1)];
            
            if ([ANPunctuation isPunctuationCharacter:lastChar]) {
                NSString * puncWord = [NSString stringWithFormat:@"%C", lastChar];
                NSString * word = [token substringWithRange:NSMakeRange(0, [token length] - 1)];
                mainToken = [ANWord wordWithString:word];
                [mSentence addObject:mainToken];
                if (lastChar == '.') {
                    ANSentence * sentence = [[ANSentence alloc] initWithWords:[mSentence copy]];
                    [mSentences addObject:sentence];
                    [mSentence removeAllObjects];
                } else {
                    suffixToken = [[ANPunctuation alloc] initWithWord:puncWord];
                    [mSentence addObject:suffixToken];
                }
            }
        }
        
        if ([mSentence count] > 0) {
            ANSentence * sentence = [[ANSentence alloc] initWithWords:[mSentence copy]];
            [mSentences addObject:sentence];
        }
        
        sentences = [mSentences copy];
    }
    return self;
}

@end
