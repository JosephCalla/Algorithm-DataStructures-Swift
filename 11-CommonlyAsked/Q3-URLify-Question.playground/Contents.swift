import UIKit

/*
 _   _ ___ _    _  __
| | | | _ \ |  (_)/ _|_  _
| |_| |   / |__| |  _| || |
 \___/|_|_\____|_|_|  \_, |
                      |__/

  Challenge: See if you can replace all the spaces in a a string with the
  ASCII symbol for space '%20'. Assume you are given the length of the final
  string. Hint: Use array of char[].

 */

func urlify1(_ url: String, length: Int) -> String {
    var result = Array<Character>(repeating: " ", count: length)
    
    var urlformatted = url.trimmingCharacters(in: .whitespaces)
    var urlChars = Array(urlformatted)
    
    var pointer = 0
    
    for i in 0..<urlChars.count {
        if urlChars[i] != " " {
            result[pointer] = urlChars[i]
            pointer += 1
        } else {
            result[pointer] = "%"
            result[pointer+1] = "2"
            result[pointer+2] = "0"
            pointer += 3
        }
    }
    print(result)
    return String(result)
}
urlify1("My Home Page    ", length: 16) // "My%20Home%20Page"

//
//
//
//
//
//func urlify(_ url: String, length: Int) -> String {
//    // Create bucket to hold our final result
//    var result = Array<Character>(repeating: " ", count: length)
//    print("result =  \(result)")
//    // Strip off any space at beginning or end
//    let url = url.trimmingCharacters(in: .whitespacesAndNewlines)
//    print("url = \(url)")
//    // loop through url, and insert an ASCII space '%20' whenever we hit a space
//    let urlChars = Array(url)
//    print("URLChars = \(urlChars)")
//
//    // Also create a pinter to keep track of where we are in our results array
//    var pointer = 0
//
//    for i in 0..<urlChars.count {
//        if urlChars[i] != " " {
//            result[pointer] = urlChars[i]
//            print("RESULT in Loop -> \(result)")
//            pointer += 1
//        } else {
//            result[pointer] = "%"
//            result[pointer+1] = "2"
//            result[pointer+2] = "0"
//            print("RESULT in Loop (ELSE)-> \(result)")
//
//            pointer = pointer + 3
//        }
//    }
//    return String(result)
//}
//
//urlify("My Home Page    ", length: 16) // "My%20Home%20Page"
//
