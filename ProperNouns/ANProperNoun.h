//
//  ANProperNoun.h
//  ProperNouns
//
//  Created by Alex Nichol on 2/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ANWord.h"
#import "ANSentence.h"

@interface ANProperNoun : ANWord {
    NSRange wordRange;
    NSArray * words;
}

@property (readonly) NSRange wordRange;
@property (readonly) NSArray * words;

- (id)initWithRange:(NSRange)range ofSentence:(ANSentence *)sentence;

@end
