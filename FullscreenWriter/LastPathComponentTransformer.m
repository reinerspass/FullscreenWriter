//
//  LastPathComponentTransformer.m
//  FullscreenWriter
//
//  Created by Markus Teufel on 8/15/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "LastPathComponentTransformer.h"

@implementation LastPathComponentTransformer

+ (Class)transformedValueClass {
    return [NSString class];
}
+ (BOOL)allowsReverseTransformation {
    return NO;
}
- (id)transformedValue:(id)value {
	if (value != nil)
	{
		NSString *fullPath = value;
		NSString *lastComponent = [fullPath lastPathComponent];
		return lastComponent;
	}
	return @"No Selection";
}


@end
