//
//  APIDocumentation.swift
//  iOS
//
//  Created by VS Comp on 04/08/24.
//

import Foundation
/**
 Teach your APIs through reference documentation you create from code comments and extension files, or create detailed articles and conceptual guides.
[](https://www.swift.org/documentation/docc/api-reference-syntax)
 */
class APIDocumentation{
    /** This is summary section . DocC uses the first line of a documentation comment as the summary
     
     Discussion section - From second line comments appear on this section
     1.  /// This  is single line documentation comment
     2. /** */ This  is multiline documentation comment
     */
    ///# This is page title
    ///More Info [Click here](https://www.swift.org/documentation/docc/formatting-your-documentation-content)
    ///
    ///
    /// Insert blank lines to break text into separate paragraphs.
    /// ## - This is header
    /// To add a header for an Overview or a Discussion section, use a double hash  and a space, and then include either term in plain text
    ///
    /// ### This is section headers
    /// For all other section headers, use a triple hash  and a space, and then add the title of the header in plain text
    ///
    ///**Documentation extension link starting with a framework module name**
    ///More Info [Click here](https://www.swift.org/documentation/docc/formatting-your-documentation-content#Add-a-Page-Title-and-Section-Headers)
    ///
    /// **This is bold** : Use ** **
    ///
    /// __This is also bold__ : Use __ __
    ///
    /// *This is italic* : Use * *
    ///
    /// _This is also italic_ : Use _  _
    ///
    /// **Code voice**:Use code voice to refer to symbols inline, or to include short code fragments, such as class names or method signatures. To add code voice, wrap the text in a set of backticks .
    ///
    /// In the following example, DocC renders the words ice, fire, wind, and lightning in a monospace font:
    ///
    /// Example - If your sloth possesses one of the special powers: `ice`, `fire`, `wind`, or `lightning`.
    ///
    /// **Code listing**:To create a code listing, start a new paragraph and add three backticks, We have used "swift" word in the comments, which is  the name of the programming languages you can specify to enable syntax highlighting for a particular code listing
    /// ```swift
    ///struct Sightseeing: Activity {
    ///    func perform(with sloth: inout Sloth) -> Speed {
    ///     sloth.energyLevel -= 10
    ///      return .slow
    /// }
    ///}
    ///```
    /// **Add Bulleted, Numbered, and Term Lists**
    /// * To create a bulleted list, precede each of the list’s items with an asterisk (*) and a space. Alternatively, use a dash (-) or a plus sign (+) instead of an asterisk (*); the list markers are interchangeable.
    /// * Ice
    /// - Fire
    /// * Wind
    ///+ Lightning
    ///
    ///1. To create a numbered list, precede each of the list’s items with the number of the step, then a period (.) and a space.
    ///1. Give the sloth some food.
    ///2. Take the sloth for a walk.
    ///3. Read the sloth a story.
    ///4. Put the sloth to bed.
    ///
    /// - To create a term list, precede each term with a dash (-) and a space, the term keyword, and another space. Then add a colon (:), a space, and the definition after the term.
    /// - term Ice: Ice sloths thrive below freezing temperatures.
    /// - term Fire: Fire sloths thrive at boiling temperatures.
    /// - term Wind: Wind sloths thrive at soaring altitudes.
    /// - term Lightning: Lightning sloths thrive in stormy climates.
    ///
    /// **Adding Tables of Data** More Info [Click here](https://www.swift.org/documentation/docc/adding-tables-of-data)
    /// Sloth speed  | Description
    ///  ------------ | -------------------------------------
    ///  `slow`       | Moves slightly faster than a snail
    ///  `medium`     | Moves at an average speed
    ///  `fast`       | Moves faster than a hare
    ///  `supersonic` | Moves faster than the speed of sound
    ///
    ///**- Add Notes and Other Asides**: More Info [Click here](https://www.swift.org/documentation/docc/other-formatting-options)
    ///> Tip: This is tip
    ///
    ///**- Include Special Characters in Text**: More Info [Click here](https://www.swift.org/documentation/docc/other-formatting-options)
    ///
    ///**- Adding Images to Your Content**: More Info [Click here](https://www.swift.org/documentation/docc/adding-images)
    ///
    ///
    ///
    ///
    ///**Parameter** DocC supports two approaches for documenting the parameters of a method. You can add a Parameters section, or one or more parameter fields. Both use Markdown’s list syntax.
    ///
    /// - Parameter food: The food for the sloth to eat.
    /// - Parameter quantity: The quantity of the food for the sloth to eat.
    /// - Returns: The sloth's energy level after eating.
    /// - Throws: `SlothError.tooMuchFood` if the quantity is more than 100.
    func documentingAPI(_ food: String, quantity: Int) throws -> Int {
    
        return 0
    }
    /**
     - Parameters:
        - food: The food for the sloth to eat.
        - quantity: The quantity of the food for the sloth to eat.
     
     */
  
    func commentParametersType2(_ food: String, quantity: Int) throws -> Int {
        
        return 0
    }
    
}
