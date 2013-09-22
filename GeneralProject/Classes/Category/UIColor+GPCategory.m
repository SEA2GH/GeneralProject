//
//  UIColor+GPCategory.m
//  GeneralProject
//
//  Created by guo haiyang on 22/09/13.
//
//

#import "UIColor+GPCategory.h"


@implementation UIColor (GPCategory)


+ (UIColor *)colorFromHexString:(NSString *)hexString
{
	NSString *cString = [[hexString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
	
	// String should be 6 or 8 characters
	if ([cString length] < 6) return DEFAULT_VOID_COLOR;
    
	// strip 0X if it appears
	if ([cString hasPrefix:@"0X"]) cString = [cString substringFromIndex:2];
	
	if ([cString length] != 6) return DEFAULT_VOID_COLOR;
    
    NSRange range = NSRangeFromString(@"{0, 2}");//range.location = 0;range.length = 2;
    
	// Separate into r, g, b substrings
	NSString *rString = [cString substringWithRange:range];
	
	range.location = 2;
	NSString *gString = [cString substringWithRange:range];
	
	range.location = 4;
	NSString *bString = [cString substringWithRange:range];
	
	// Scan values
	unsigned int r, g, b;
    
	[[NSScanner scannerWithString:rString] scanHexInt:&r];
	[[NSScanner scannerWithString:gString] scanHexInt:&g];
	[[NSScanner scannerWithString:bString] scanHexInt:&b];
	
	return [UIColor colorWithRed:((float) r / 255.0f)
						   green:((float) g / 255.0f)
							blue:((float) b / 255.0f)
						   alpha:1.0f];
}


- (NSString *)hexStringWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue
{
	// Fix range if needed
	if (red < 0.0f) red = 0.0f;
	if (green < 0.0f) green = 0.0f;
	if (blue < 0.0f) blue = 0.0f;
	
	if (red > 1.0f) red = 1.0f;
	if (green > 1.0f) green = 1.0f;
	if (blue > 1.0f) blue = 1.0f;
	
	// Convert to hex string between 0x00 and 0xFF
	return [NSString stringWithFormat:@"%02X%02X%02X",
            (int)(red * 255), (int)(green * 255), (int)(blue * 255)];
}


@end
