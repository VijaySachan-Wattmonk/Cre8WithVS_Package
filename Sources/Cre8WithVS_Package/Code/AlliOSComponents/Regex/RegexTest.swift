//
//  RegexTest.swift
//  iOS
//
//  Created by Vijay Sachan on 14/09/23.
//
import Foundation
class RegexTest{
    private func links(){
        let _="https://www3.ntu.edu.sg/home/ehchua/programming/howto/Regexe.html"
    }
    func introduction(){
        // How to define pattern
        /**
                  1. Regexes are case-sensitive by default
         */
        let type1="[]"
        /**
         [a-z]  - means char can be any alphabet of lower case
         [A-Z]  - means char can be any alphabet of upper case
         [a-zA-Z] - means char can be any alphabet of lower or upper case
         [a-m]  - means char can be any alphabet of lower case between a to m
         [apkm] - means we can specific about the letters so char can ony be alphabet a, p, k, m
         [0-9] - means char can be any number between 0-9
         [A-Za-z0-9]  means char can be any alphabet of lower or upper case or char can be any number between 0-9
         let pattern = "[a-z]at"  - means (1).Word should be of 3 chars, (2) 1st char can be [a-z] any alphabet of lower case (3). 2nd char should be "a" & 3rd char should be "t"
         */
        let type2="{}"
        /**
         [a-z]{3}  means Word should be of 3 chars in length and each char can be any alphabet of lower case
         [a-z]{1,3} means Word can be of 1,2 or 3 chars in length and each char can be any alphabet of lower case
         [a-z]{3,} means Word should be of min 3 chars or more chars in length   and each char can be any alphabet of lower case
         */
        
        let zero_or_more_Quantifier="*"
        /**
         let regex = "ca[a-z]*d"  - That looks for “ca”, then zero or more characters from “a” through “z”, then “d” – it matches “cad”, “card”, “camped”, and more.
         */
        let one_or_more_Quantifier="+"
        /**
         
         */
        let zero_or_one_Quantifier="?"
        /**
         
         */
        let period="."
        /**
                  
         */
        let todo=""
        /**
         \d means digit
         */
        
    }
    private func Position_Anchors(){
        let _="The leading ^ and the trailing $ are known as position anchors"
        /**
         The leading ^ and the trailing $ are known as position anchors, which match the start and end positions of the line, respectively. As the result, the entire input string shall be matched fully, instead of a portion of the input string (substring).
         This regex matches any non-empty numeric strings (comprising of digits 0 to 9), e.g., "0" and "12345". It does not match with "" (empty string), "abc", "a123", "abc123xyz", etc. However, it also matches "000", "0123" and "0001" with leading zeros.
         */
    }
    private func capturingGroup(){
        let _="() denotes a capturing group"
        /**
         [] denotes a character class. () denotes a capturing group.

         [a-z0-9] -- One character that is in the range of a-z OR 0-9

         (a-z0-9) -- Explicit capture of a-z0-9. No ranges.

         a -- Can be captured by [a-z0-9].

         a-z0-9 -- Can be captured by (a-z0-9) and then can be referenced in a replacement and/or later in the expression.
         */
    }
    
    func example_1(){
        // Example 1 - Here we are checking that whether this pattern exist in text or not
        let text = "A1234567890123" // Test by changing text value
        /**
        Here we have defined pattern that text :
        1. Length should be 14
        2. 1st char can be [a-zA-Z] any alphabet lower or upper case
        3. Rest 13 chars can be [0-9] any number between 0-9
         */
        let pattern="[a-zA-Z][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]"
        if #available(iOS 16.0, *) {
            let patternRegex = try! Regex(pattern)
            let result:Bool=text.contains(patternRegex)
            if result{
                // text contains this pattern
            }else{
                // text doesn't contains this pattern
            }
        } else {
            // Fallback on earlier versions
            let result=text.range(of: pattern,options: .regularExpression)
            if let result=result{
                // text contains this pattern
            }else{
                // text doesn't contains this pattern
            }
        }
      }
    func example_2(){
        // Example 2 - Here we want to search any 3 letter word that ends with "at"
        // Pattern definition for search to be successful
        //1.Word should be of 3 chars
        //2. 1st char can be [a-z] any alphabet of lower case
        //3. 2nd char should be "a" & 3rd char should be "t"
        let pattern="[a-z]at"
        let text="cat fkdfk hat lfdlfl zat"
    }
}
