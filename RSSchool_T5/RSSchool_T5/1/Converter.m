#import "Converter.h"

// Do not change
NSString *KeyPhoneNumber = @"phoneNumber";
NSString *KeyCountry = @"country";

@implementation PNConverter
- (NSDictionary*)converToPhoneNumberNextString:(NSString*)string; {
    NSMutableString *countryCode = [[NSMutableString alloc] init];
    NSMutableString *numberFormated = [[NSMutableString alloc] init];
    NSMutableArray<NSMutableString*>* parts = [[NSMutableArray alloc] init];
    

    NSMutableString *number = [NSMutableString stringWithString:string];
    if ([number characterAtIndex:0] == '+') [number deleteCharactersInRange:NSMakeRange(0, 1)];
    if ([number length] == 1 && [number characterAtIndex:0] == '7')
        return @{KeyPhoneNumber: @"+7",
                 KeyCountry: @"RU"};
    if ([number characterAtIndex:0] == '7') {
        // KZ or RU
            if ([number characterAtIndex:1] == '7') {
                countryCode = [NSMutableString stringWithString:@"KZ"];
                [numberFormated appendString:@"+7"];
                [number deleteCharactersInRange:NSMakeRange(0, 1)];
                if ([number length] > 10) [number deleteCharactersInRange:NSMakeRange(10, [number length]-10)];
                for (int i = 0; i < 4; i++) [parts addObject:[NSMutableString stringWithFormat:@""]];
                [parts[0] appendString:@"7"];
                int i = 1;
                while (i != [number length]) {
                    if (i < 3) [parts[0] appendFormat:@"%c", [number characterAtIndex:i]];
                    if (i > 2 && i < 6) [parts[1] appendFormat:@"%c", [number characterAtIndex:i]];
                    if (i > 5 && i < 8) [parts[2] appendFormat:@"%c", [number characterAtIndex:i]];
                    if (i > 7) [parts[3] appendFormat:@"%c", [number characterAtIndex:i]];
                    i++;
                }
                if ([parts[0] length] != 0) {
                    [numberFormated appendFormat:@" (%@", parts[0]];
                    if ([parts[1] length] != 0) {
                        [numberFormated appendFormat:@") %@", parts[1]];
                        if ([parts[2] length] != 0) {
                            [numberFormated appendFormat:@"-%@", parts[2]];
                            if ([parts[3] length] != 0) {
                                [numberFormated appendFormat:@"-%@", parts[3]];
                            }
                        }
                    }
                }
            }
        // RU
        else {
            int i = 0;
            for (int i = 0; i < 4; i++) [parts addObject:[NSMutableString stringWithFormat:@""]];
            countryCode = [NSMutableString stringWithString:@"RU"];
            [numberFormated appendString:@"+7"];
            [number deleteCharactersInRange:NSMakeRange(0, 1)];
            if ([number length] > 10) [number deleteCharactersInRange:NSMakeRange(10, [number length]-10)];
            while (i != [number length]) {
                if (i < 3) [parts[0] appendFormat:@"%c", [number characterAtIndex:i]];
                if (i > 2 && i < 6) [parts[1] appendFormat:@"%c", [number characterAtIndex:i]];
                if (i > 5 && i < 8) [parts[2] appendFormat:@"%c", [number characterAtIndex:i]];
                if (i > 7) [parts[3] appendFormat:@"%c", [number characterAtIndex:i]];
                i++;
            }
            if ([parts[0] length] != 0) {
                [numberFormated appendFormat:@" (%@", parts[0]];
                if ([parts[1] length] != 0) {
                    [numberFormated appendFormat:@") %@", parts[1]];
                    if ([parts[2] length] != 0) {
                        [numberFormated appendFormat:@"-%@", parts[2]];
                        if ([parts[3] length] != 0) {
                            [numberFormated appendFormat:@"-%@", parts[3]];
                        }
                    }
                }
            }
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
            if ([number length] > 8) [number deleteCharactersInRange:NSMakeRange(8, [number length]-8)];
            int i = 0;
            for (int i = 0; i < 3; i++) [parts addObject:[NSMutableString stringWithFormat:@""]];
            while (i != [number length]) {
                if (i < 2) [parts[0] appendFormat:@"%c", [number characterAtIndex:i]];
                if (i > 1 && i < 5) [parts[1] appendFormat:@"%c", [number characterAtIndex:i]];
                if (i > 4) [parts[2] appendFormat:@"%c", [number characterAtIndex:i]];
                i++;
            }
            if ([parts[0] length] != 0) {
                [numberFormated appendFormat:@" (%@", parts[0]];
                if ([parts[1] length] != 0) {
                    [numberFormated appendFormat:@") %@", parts[1]];
                    if ([parts[2] length] != 0)
                        [numberFormated appendFormat:@"-%@", parts[2]];
                }
            }
        }
        else if ([temp isEqualToString:@"374"]) {
            countryCode = [NSMutableString stringWithString:@"AM"];
            [numberFormated appendString:@"+374"];
            [number deleteCharactersInRange:NSMakeRange(0, 3)];
            if ([number length] > 8) [number deleteCharactersInRange:NSMakeRange(8, [number length]-8)];
            int i = 0;
            for (int i = 0; i < 3; i++) [parts addObject:[NSMutableString stringWithFormat:@""]];
            while (i != [number length]) {
                if (i < 2) [parts[0] appendFormat:@"%c", [number characterAtIndex:i]];
                if (i > 1 && i < 5) [parts[1] appendFormat:@"%c", [number characterAtIndex:i]];
                if (i > 4) [parts[2] appendFormat:@"%c", [number characterAtIndex:i]];
                i++;
            }
            if ([parts[0] length] != 0) {
                [numberFormated appendFormat:@" (%@", parts[0]];
                if ([parts[1] length] != 0) {
                    [numberFormated appendFormat:@") %@", parts[1]];
                    if ([parts[2] length] != 0)
                        [numberFormated appendFormat:@"-%@", parts[2]];
                }
            }
        }
        else if ([temp isEqualToString:@"375"]) {
            countryCode = [NSMutableString stringWithString:@"BY"];
            [numberFormated appendString:@"+375"];
            [number deleteCharactersInRange:NSMakeRange(0, 3)];
            if ([number length] > 9) [number deleteCharactersInRange:NSMakeRange(9, [number length]-9)];
            int i = 0;
            for (int i = 0; i < 4; i++) [parts addObject:[NSMutableString stringWithFormat:@""]];
            while (i != [number length]) {
                if (i < 2) [parts[0] appendFormat:@"%c", [number characterAtIndex:i]];
                if (i > 1 && i < 5) [parts[1] appendFormat:@"%c", [number characterAtIndex:i]];
                if (i > 4 && i < 7) [parts[2] appendFormat:@"%c", [number characterAtIndex:i]];
                if (i > 6) [parts[3] appendFormat:@"%c", [number characterAtIndex:i]];
                i++;
            }
            if ([parts[0] length] != 0) {
                [numberFormated appendFormat:@" (%@", parts[0]];
                if ([parts[1] length] != 0) {
                    [numberFormated appendFormat:@") %@", parts[1]];
                    if ([parts[2] length] != 0) {
                        [numberFormated appendFormat:@"-%@", parts[2]];
                        if ([parts[3] length] != 0) {
                            [numberFormated appendFormat:@"-%@", parts[3]];
                        }
                    }
                }
            }
        }
        else if ([temp isEqualToString:@"380"]) {
            countryCode = [NSMutableString stringWithString:@"UA"];
            [numberFormated appendString:@"+380"];
            [number deleteCharactersInRange:NSMakeRange(0, 3)];
            if ([number length] > 9) [number deleteCharactersInRange:NSMakeRange(9, [number length]-9)];
            int i = 0;
            for (int i = 0; i < 4; i++) [parts addObject:[NSMutableString stringWithFormat:@""]];
            while (i != [number length]) {
                if (i < 2) [parts[0] appendFormat:@"%c", [number characterAtIndex:i]];
                if (i > 1 && i < 5) [parts[1] appendFormat:@"%c", [number characterAtIndex:i]];
                if (i > 4 && i < 7) [parts[2] appendFormat:@"%c", [number characterAtIndex:i]];
                if (i > 6) [parts[3] appendFormat:@"%c", [number characterAtIndex:i]];
                i++;
            }
            if ([parts[0] length] != 0) {
                [numberFormated appendFormat:@" (%@", parts[0]];
                if ([parts[1] length] != 0) {
                    [numberFormated appendFormat:@") %@", parts[1]];
                    if ([parts[2] length] != 0) {
                        [numberFormated appendFormat:@"-%@", parts[2]];
                        if ([parts[3] length] != 0) {
                            [numberFormated appendFormat:@"-%@", parts[3]];
                        }
                    }
                }
            }
        }
        else if ([temp isEqualToString:@"992"]) {
            countryCode = [NSMutableString stringWithString:@"TJ"];
            [numberFormated appendString:@"+992"];
            [number deleteCharactersInRange:NSMakeRange(0, 3)];
            if ([number length] > 9) [number deleteCharactersInRange:NSMakeRange(9, [number length]-9)];
            int i = 0;
            for (int i = 0; i < 4; i++) [parts addObject:[NSMutableString stringWithFormat:@""]];
            while (i != [number length]) {
                if (i < 2) [parts[0] appendFormat:@"%c", [number characterAtIndex:i]];
                if (i > 1 && i < 5) [parts[1] appendFormat:@"%c", [number characterAtIndex:i]];
                if (i > 4 && i < 7) [parts[2] appendFormat:@"%c", [number characterAtIndex:i]];
                if (i > 6) [parts[3] appendFormat:@"%c", [number characterAtIndex:i]];
                i++;
            }
            if ([parts[0] length] != 0) {
                [numberFormated appendFormat:@" (%@", parts[0]];
                if ([parts[1] length] != 0) {
                    [numberFormated appendFormat:@") %@", parts[1]];
                    if ([parts[2] length] != 0) {
                        [numberFormated appendFormat:@"-%@", parts[2]];
                        if ([parts[3] length] != 0) {
                            [numberFormated appendFormat:@"-%@", parts[3]];
                        }
                    }
                }
            }
        }
        else if ([temp isEqualToString:@"993"]) {
            countryCode = [NSMutableString stringWithString:@"TM"];
            [numberFormated appendString:@"+993"];
            [number deleteCharactersInRange:NSMakeRange(0, 3)];
            if ([number length] > 8) [number deleteCharactersInRange:NSMakeRange(8, [number length]-8)];
            int i = 0;
            for (int i = 0; i < 4; i++) [parts addObject:[NSMutableString stringWithFormat:@""]];
            while (i != [number length]) {
                if (i < 2) [parts[0] appendFormat:@"%c", [number characterAtIndex:i]];
                if (i > 1 && i < 5) [parts[1] appendFormat:@"%c", [number characterAtIndex:i]];
                if (i > 4) [parts[2] appendFormat:@"%c", [number characterAtIndex:i]];
                i++;
            }
            if ([parts[0] length] != 0) {
                [numberFormated appendFormat:@" (%@", parts[0]];
                if ([parts[1] length] != 0) {
                    [numberFormated appendFormat:@") %@", parts[1]];
                    if ([parts[2] length] != 0)
                        [numberFormated appendFormat:@"-%@", parts[2]];
                }
            }
        }
        else if ([temp isEqualToString:@"994"]) {
            countryCode = [NSMutableString stringWithString:@"AZ"];
            [numberFormated appendString:@"+994"];
            [number deleteCharactersInRange:NSMakeRange(0, 3)];
            if ([number length] > 9) [number deleteCharactersInRange:NSMakeRange(9, [number length]-9)];
            int i = 0;
            for (int i = 0; i < 4; i++) [parts addObject:[NSMutableString stringWithFormat:@""]];
            while (i != [number length]) {
                if (i < 2) [parts[0] appendFormat:@"%c", [number characterAtIndex:i]];
                if (i > 1 && i < 5) [parts[1] appendFormat:@"%c", [number characterAtIndex:i]];
                if (i > 4 && i < 7) [parts[2] appendFormat:@"%c", [number characterAtIndex:i]];
                if (i > 6) [parts[3] appendFormat:@"%c", [number characterAtIndex:i]];
                i++;
            }
            if ([parts[0] length] != 0) {
                [numberFormated appendFormat:@" (%@", parts[0]];
                if ([parts[1] length] != 0) {
                    [numberFormated appendFormat:@") %@", parts[1]];
                    if ([parts[2] length] != 0) {
                        [numberFormated appendFormat:@"-%@", parts[2]];
                        if ([parts[3] length] != 0) {
                            [numberFormated appendFormat:@"-%@", parts[3]];
                        }
                    }
                }
            }
        }
        else if ([temp isEqualToString:@"996"]) {
            countryCode = [NSMutableString stringWithString:@"KG"];
            [numberFormated appendString:@"+996"];
            [number deleteCharactersInRange:NSMakeRange(0, 3)];
            if ([number length] > 9) [number deleteCharactersInRange:NSMakeRange(9, [number length]-9)];
            int i = 0;
            for (int i = 0; i < 4; i++) [parts addObject:[NSMutableString stringWithFormat:@""]];
            while (i != [number length]) {
                if (i < 2) [parts[0] appendFormat:@"%c", [number characterAtIndex:i]];
                if (i > 1 && i < 5) [parts[1] appendFormat:@"%c", [number characterAtIndex:i]];
                if (i > 4 && i < 7) [parts[2] appendFormat:@"%c", [number characterAtIndex:i]];
                if (i > 6) [parts[3] appendFormat:@"%c", [number characterAtIndex:i]];
                i++;
            }
            if ([parts[0] length] != 0) {
                [numberFormated appendFormat:@" (%@", parts[0]];
                if ([parts[1] length] != 0) {
                    [numberFormated appendFormat:@") %@", parts[1]];
                    if ([parts[2] length] != 0) {
                        [numberFormated appendFormat:@"-%@", parts[2]];
                        if ([parts[3] length] != 0) {
                            [numberFormated appendFormat:@"-%@", parts[3]];
                        }
                    }
                }
            }
        }
        else if ([temp isEqualToString:@"998"]) {
            countryCode = [NSMutableString stringWithString:@"UZ"];
            [numberFormated appendString:@"+998"];
            [number deleteCharactersInRange:NSMakeRange(0, 3)];
            if ([number length] > 9) [number deleteCharactersInRange:NSMakeRange(9, [number length]-9)];
            int i = 0;
            for (int i = 0; i < 4; i++) [parts addObject:[NSMutableString stringWithFormat:@""]];
            while (i != [number length]) {
                if (i < 2) [parts[0] appendFormat:@"%c", [number characterAtIndex:i]];
                if (i > 1 && i < 5) [parts[1] appendFormat:@"%c", [number characterAtIndex:i]];
                if (i > 4 && i < 7) [parts[2] appendFormat:@"%c", [number characterAtIndex:i]];
                if (i > 6) [parts[3] appendFormat:@"%c", [number characterAtIndex:i]];
                i++;
            }
            if ([parts[0] length] != 0) {
                [numberFormated appendFormat:@" (%@", parts[0]];
                if ([parts[1] length] != 0) {
                    [numberFormated appendFormat:@") %@", parts[1]];
                    if ([parts[2] length] != 0) {
                        [numberFormated appendFormat:@"-%@", parts[2]];
                        if ([parts[3] length] != 0) {
                            [numberFormated appendFormat:@"-%@", parts[3]];
                        }
                    }
                }
            }
        }
        else {
            countryCode = [NSMutableString stringWithString:@""];
            if ([number length] > 12) [number deleteCharactersInRange:NSMakeRange(12, [number length]-12)];
            numberFormated = [NSMutableString stringWithFormat:@"+%@", number];
            return @{KeyPhoneNumber: numberFormated,
                     KeyCountry: countryCode};
        }
    }
    
    
    return @{KeyPhoneNumber: numberFormated,
             KeyCountry: countryCode};
}
@end
