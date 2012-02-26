//
//  ANParagraph+Nouns.m
//  ProperNouns
//
//  Created by Alex Nichol on 2/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ANParagraph+Nouns.h"

@implementation ANParagraph (Nouns)

- (ANParagraph *)paragraphWithProperNouns:(id<NameChecker>)checker {
    NSMutableArray * mSentences = [NSMutableArray array];
    
    for (ANSentence * sentence in sentences) {
        [mSentences addObject:[sentence sentenceWithProperNouns:checker]];
    }
    
    return [[ANParagraph alloc] initWithSentences:[mSentences copy]];
}

@end
