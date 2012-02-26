//
//  ANParagraph+Nouns.h
//  ProperNouns
//
//  Created by Alex Nichol on 2/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ANParagraph.h"
#import "ANSentence+Nouns.h"

@interface ANParagraph (Nouns)

- (ANParagraph *)paragraphWithProperNouns:(id<NameChecker>)checker;

@end
