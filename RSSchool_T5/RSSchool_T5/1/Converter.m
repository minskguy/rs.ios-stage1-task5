#import "Converter.h"

// Do not change
NSString *KeyPhoneNumber = @"phoneNumber";
NSString *KeyCountry = @"country";

@implementation PNConverter
- (NSDictionary*)converToPhoneNumberNextString:(NSString*)string; {
    NSMutableString *countryCode = [[NSMutableString alloc] init];
    NSMutableString *numberFormated = [[NSMutableString alloc] init];
    

    NSMutableString *number = [NSMutableString stringWithString:string];
    if ([number characterAtIndex:0] == '+') [number deleteCharactersInRange:NSMakeRange(0, 1)];
    if ([number length] > 12) [number deleteCharactersInRange:NSMakeRange(12, [number length]-12)];
    if ([number characterAtIndex:0] == '7') {
        // KZ or RU
        if ([number characterAtIndex:1] == '7') {
            countryCode = [NSMutableString stringWithString:@"KZ"];
            [numberFormated appendString:@"+7 (7"];
            [number deleteCharactersInRange:NSMakeRange(0, 2)];
        }
        // RU
        else {
            countryCode = [NSMutableString stringWithString:@"RU"];
            [numberFormated appendString:@"+7"];
            [number deleteCharactersInRange:NSMakeRange(0, 1)];
        }
    }
    // for others we will save first 3 digits of the number
    else {
        if ([number length] < 3) {
            countryCode = [NSMutableString stringWithString:@""];
            numberFormated = [NSMutableString stringWithFormat:@"+%@", number];
            return @{KeyPhoneNumber: numberFormated,
                     KeyCountry: countryCode};
        }
        NSString *temp = [number substringToIndex:3];
        if ([temp isEqualToString:@"373"]) {
            countryCode = [NSMutableString stringWithString:@"MD"];
            [numberFormated appendString:@"+373"];
            [number deleteCharactersInRange:NSMakeRange(0, 3)];
        }
        else if ([temp isEqualToString:@"374"]) {
            countryCode = [NSMutableString stringWithString:@"AM"];
            [numberFormated appendString:@"+374"];
            [number deleteCharactersInRange:NSMakeRange(0, 3)];
        }
        else if ([temp isEqualToString:@"375"]) {
            countryCode = [NSMutableString stringWithString:@"BY"];
            [numberFormated appendString:@"+375"];
            [number deleteCharactersInRange:NSMakeRange(0, 3)];
        }
        else if ([temp isEqualToString:@"380"]) {
            countryCode = [NSMutableString stringWithString:@"UA"];
            [numberFormated appendString:@"+380"];
            [number deleteCharactersInRange:NSMakeRange(0, 3)];
        }
        else if ([temp isEqualToString:@"992"]) {
            countryCode = [NSMutableString stringWithString:@"TJ"];
            [numberFormated appendString:@"+992"];
            [number deleteCharactersInRange:NSMakeRange(0, 3)];
        }
        else if ([temp isEqualToString:@"993"]) {
            countryCode = [NSMutableString stringWithString:@"TM"];
            [numberFormated appendString:@"+993"];
            [number deleteCharactersInRange:NSMakeRange(0, 3)];
        }
        else if ([temp isEqualToString:@"994"]) {
            countryCode = [NSMutableString stringWithString:@"AZ"];
            [numberFormated appendString:@"+994"];
            [number deleteCharactersInRange:NSMakeRange(0, 3)];
        }
        else if ([temp isEqualToString:@"996"]) {
            countryCode = [NSMutableString stringWithString:@"KG"];
            [numberFormated appendString:@"+996"];
            [number deleteCharactersInRange:NSMakeRange(0, 3)];
        }
        else if ([temp isEqualToString:@"998"]) {
            countryCode = [NSMutableString stringWithString:@"UZ"];
            [numberFormated appendString:@"+998"];
            [number deleteCharactersInRange:NSMakeRange(0, 3)];
        }
        else {
            countryCode = [NSMutableString stringWithString:@""];
            numberFormated = [NSMutableString stringWithFormat:@"+%@", number];
            return @{KeyPhoneNumber: numberFormated,
                     KeyCountry: countryCode};
        }
    }
    
    
    return @{KeyPhoneNumber: numberFormated,
             KeyCountry: countryCode};
}
@end
