Detecting Valid Latitude and Longitude Pairs
Given a line of text which may or may not contain the latitude and longitude of a point, can you use string pattern matching (e.g. with regular expressions) to identify the latitude and longitude referred to (if any)?
 
A valid representation will adhere to following points
The latitude and longitude, if present, will always appear in the form of (X, Y) where X and Y are decimal numbers, and the '(', ')' and ',' are exactly copied.
For a valid (latitude, longitude) pair:
-90 ≤ X ≤ +90
-180 ≤ Y ≤ 180
They will not contain any symbols for degrees or radians or N/S/E/W.
There may or may not be a +/- sign preceding X or Y.
There will be comma followed by a space between X and Y as shown here (X, Y).
There will be no space
between X and the preceding left-bracket, or
between Y and the following right-bracket, or
between X and the following comma, or
before the initial '('.
There will be no unnecessary zeros (0) before X or Y, and no decimal point that is not followed by a non-zero value.

Constraints
1 ≤ N ≤ 100
 
Input Format
The first line contains an integer N, the number of tests.
This is followed by N lines of text, each of which contains a pair of co-ordinates which may indicate the latitude and longitude of a place.
 
Output Format
One line of text per test case, with the string "Valid" if  X and Y are a valid (latitude,longitude) pair, or "Invalid" if the given pair of numbers are not a valid (latitude,longitude) pair. (Omit the quotation marks in your  output.)

Sample Input #00
12
(75, 180)
(+90.0, -147.45)
(77.11112223331, 149.99999999)
(+90, +180)
(90, 180)
(-90.00000, -180.0000)
(75, 280)
(+190.0, -147.45)
(77.11112223331, 249.99999999)
(+90, +180.2)
(90., 180.)
(-090.00000, -180.0000)
 
Sample Output #00
Valid
Valid
Valid
Valid
Valid
Valid
Invalid
Invalid
Invalid
Invalid
Invalid
Invalid
 
Explanation #00
The first six pairs are valid because X and Y satisfy the criteria for numerical values and formats. The next six pairs are all invalid because:  Four have numbers outside the numerical ranges for X and Y. (90., 180.) is invalid because of an extra decimal point (.) after 90 and 180.
(-090.0000, -180.0000) is invalid because of the leading 0 before 90.
YOUR ANSWER
Java 7


1
import ↔;
6
​
7
public class Solution {
8
  

9
/*
10
 * Complete the function below.
11
 */
12
​
13
    static void isValid_LatLong(String[] arr) {
14
​
15
​
16
    }
17
​
18
​

19
    public static void main(String[] args){↔}
38
}
