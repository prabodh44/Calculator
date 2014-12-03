//
//  main.m
//  Calculator
//
//  Created by Charles Aroutiounian on 03/12/14.
//  Copyright (c) 2014 Charles Aroutiounian. All rights reserved.
//

#import <Foundation/Foundation.h>
#include "MathOperations.h"

BOOL isAnOperator (const char value)
{
    return ((value =='+')||(value =='-')||(value =='*')||(value =='/'));
}


int main(int argc, const char * argv[]) {
   
    
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    double result = 0;
    char operator = '\0';
    
    
    
    
    NSString *equation = (char *)argv[1] ? [NSString stringWithUTF8String:
     (char *)argv[1]] : nil;

    

    equation = [equation stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];

    NSArray *eqParts = [equation componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    

    
    for (int n=0; n<[eqParts count]; n++) {
        
        
        NSString *argString = [eqParts objectAtIndex:n];
        
        char firstChar = [argString characterAtIndex:0];
        
        if (isAnOperator(firstChar)) {
            operator = firstChar;
            continue;
        }
        
        double newValue = [argString doubleValue];
        
        switch (operator) {
            case '+':
                result = add(result, newValue);
                break;
            case '-':
                result = subtract(result, newValue);
                break;
            case '*':
                result = multiply(result, newValue);
                break;
            case '/':
                result = divide(result, newValue);
                break;
            default:
                 add(result, newValue);
                break;
        }
   
        
    }
    NSLog(@"%f", result);
    [pool drain];

    return 0;
}
