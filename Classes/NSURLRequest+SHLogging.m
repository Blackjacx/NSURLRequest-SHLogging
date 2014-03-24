//
//  NSURLRequest+Logging.m
//  NSURLRequestLogger
//
//  Created by Stefan Herold on 05/03/14.
//  Copyright (c) 2014 blackjacx. All rights reserved.
//

#import "NSURLRequest+SHLogging.h"

@implementation NSURLRequest (Logging)

- (NSString *)extendedDescription {
	NSMutableString * const mutableResult = [NSMutableString stringWithFormat:@"NSURLRequest - %@ : %@ (%.1fs)\n", self.HTTPMethod, self.URL, self.timeoutInterval];
	
	// Add header fields.
	[self.allHTTPHeaderFields enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
		[mutableResult appendFormat:@"\n%@ : %@", key, obj];
	}];
	
	if( [self HTTPBody] ) {
		NSString *sBody = [[NSString alloc] initWithData:[self HTTPBody] encoding:NSASCIIStringEncoding];
		[mutableResult appendFormat:@"\n\nHTTP BODY:\n%@", sBody];
	}
	return [mutableResult copy];
}

- (NSString *)debugDescription {
	return [self extendedDescription];
}

@end
