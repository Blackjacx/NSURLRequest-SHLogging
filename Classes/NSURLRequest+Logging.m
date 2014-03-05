//
//  NSURLRequest+Logging.m
//  NSURLRequestLogger
//
//  Created by Stefan Herold on 05/03/14.
//  Copyright (c) 2014 blackjacx. All rights reserved.
//

#import "NSURLRequest+Logging.h"

@implementation NSURLRequest (Logging)

- (NSString *)extendedDescription {
	NSMutableString * const mutableResult = [NSMutableString stringWithFormat:@"%@\n", [self description]];
	
	// Add header fields.
	NSDictionary * const HTTPHeaderFields = [self allHTTPHeaderFields];
	NSArray * const fieldNames = [HTTPHeaderFields allKeys];
	
	for ( NSString *fieldName in fieldNames ) {
		[mutableResult appendFormat:@"%@ = %@\n", fieldName, HTTPHeaderFields[fieldName]];
	}
	
	[mutableResult appendFormat:@"\n HTTP Method is %@", [self HTTPMethod]];
	
	if( [self HTTPBody] ) {
		NSString *sBody = [[NSString alloc] initWithData:[self HTTPBody] encoding:NSASCIIStringEncoding];
		[mutableResult appendFormat:@"\n HTTP Body is %@", sBody];
	}
	
	NSString *result = [NSString stringWithFormat:@"-[%@ %@]: Request is %@",
						NSStringFromClass( [self class] ),
						NSStringFromSelector( _cmd ),
						mutableResult];
	return result;
}

- (NSString *)debugDescription {
	return [self extendedDescription];
}

@end
