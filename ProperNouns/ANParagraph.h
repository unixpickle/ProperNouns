//
//  ANParagraph.h
//  ProperNouns
//
//  Created by Alex Nichol on 2/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ANSentence.h"

@interface ANParagraph : NSObject {
    NSArray * sentences;
}

@property (readonly) NSArray * sentences;

- (id)initWithSentences:(NSArray *)array;
- (id)initWithString:(NSString *)paragraph;

@end
