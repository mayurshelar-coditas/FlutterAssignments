import 'dart:collection';
import 'dart:math';

void main() {
  //Question 1.
  List<int> numbersArray = [-4, -1, 0, 3, 10];
  squareAndSortArray(numbersArray);
  print(numbersArray); //Output - [0, 1, 9, 16, 100]

  //Question 2.
  twoSum([2, 7, 11, 15], 9); //Output - [0, 1]
  twoSum([3, 2, 4], 6); //Output - [1, 2]
  twoSum([3, 3], 6); //Output - [0, 1]

  //Question 6.
  print(isAnagram("anagram", "nagaram")); //Output - true
  print(isAnagram("rat", "car")); //Output - false
  print(isAnagram("Mayur", "ruyaM")); //Output - true.

  //Question 7.
  TreeNode head = TreeNode(1, TreeNode(2, TreeNode(3), TreeNode(4)),
      TreeNode(5, TreeNode(6), TreeNode(7)));
  inorderTraversal(head);

  //Question 9.
  print(reverseWordsInAString("the sky is blue")); //Output - "blue is sky the"
  print(reverseWordsInAString("  hello world  ")); //Output - "world hello"
  print(reverseWordsInAString("a good   example")); //Output -
}

// 1.
// Given an integer array nums sorted in non-decreasing order, return an array of the squares of each number sorted in non-decreasing order.

// Example 1:
// Input: nums = [-4,-1,0,3,10]
// Output: [0,1,9,16,100]
// Explanation: After squaring, the array becomes [16,1,0,9,100].
// After sorting, it becomes [0,1,9,16,100].

// Example 2:
// Input: nums = [-7,-3,2,3,11]
// Output: [4,9,9,49,121]
// Solution -

//Appraoch.
//First I'll traverse the array, using a loop, to make the changes inplace and then make use of sort() function to return the
//array in non-decreasing order
//Note: Using an efficent algoritm like MergeSort or QuickSort is beneficial but for time being for logic illustration,
//      I'll make use of dart's inbuilt sort.

void squareAndSortArray(List<int> numbersArray) {
  for (int number = 0; number < numbersArray.length; number++) {
    numbersArray[number] = pow(numbersArray[number], 2).toInt();
  }
  numbersArray.sort();
}

// ========================================================================

// 2.

// Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.
// You may assume that each input would have exactly one solution, and you may not use the same element twice.
// You can return the answer in any order.

// Example 1:
// Input: nums = [2,7,11,15], target = 9
// Output: [0,1]
// Explanation: Because nums[0] + nums[1] == 9, we return [0, 1].

// Example 2:
// Input: nums = [3,2,4], target = 6
// Output: [1,2]

// Example 3:
// Input: nums = [3,3], target = 6
// Output: [0,1]

//Approach - First I'll sort the array/List in ascending order and then follow a two-pointer approach and do the following for the following cases: (i = 0, j = nums.length-1);
//if nums[i] + nums[j] == target return nums[i] and nums[j]
//if nums[i] + nums[j] < target then I'll increment i; as the sum is falling short
//if nums[i] + nums[j] > target then I'll increment j; as sum is exceding the target.

void twoSum(List<int> numbersArray, int target) {
  int firstPointer = 0, secondPointer = numbersArray.length - 1;

  final Map<int, int> indicesAndElements = new HashMap();

  for (int number = 0; number < numbersArray.length; number++) {
    //   if (indicesAndElements.containsKey(numbersArray[number])) {
    //     indicesAndElements[numbersArray[number]]?.add(number);
    //   }
    indicesAndElements.addAll({numbersArray[number]: number});
  }

  numbersArray.sort();
  while (firstPointer != secondPointer) {
    int currentSum = numbersArray[firstPointer] + numbersArray[secondPointer];
    if (currentSum == target) {
      print("First Index: ${indicesAndElements[numbersArray[firstPointer]]}");
      print("Second Index: ${indicesAndElements[numbersArray[secondPointer]]}");
      return;
    } else if (currentSum > target) {
      if (numbersArray[firstPointer] >= numbersArray[secondPointer]) {
        firstPointer++;
      } else {
        secondPointer--;
      }
    } else {
      if (numbersArray[firstPointer] <= numbersArray[secondPointer]) {
        firstPointer++;
      } else {
        secondPointer--;
      }
    }
  }
}

// ========================================================================

// 3.
// Write a function to find the longest common prefix string amongst an array of strings.
// If there is no common prefix, return an empty string "".

// Example 1:
// Input: strs = ["flower","flow","flight"]
// Output: "fl"

// Example 2:
// Input: strs = ["dog","racecar","car"]
// Output: ""
// Explanation: There is no common prefix among the input strings.

// ========================================================================
//Approach -

// 4.
// Given a string s, find the length of the longest
// substring
// without repeating characters.

// Example 1:
// Input: s = "abcabcbb"
// Output: 3
// Explanation: The answer is "abc", with the length of 3.

// Example 2:
// Input: s = "bbbbb"
// Output: 1
// Explanation: The answer is "b", with the length of 1.

// Example 3:
// Input: s = "pwwkew"
// Output: 3
// Explanation: The answer is "wke", with the length of 3.
// Notice that the answer must be a substring, "pwke" is a subsequence and not a substring.

// ========================================================================

// 5.
// Given two integer arrays nums1 and nums2, return an array of their intersection. Each element in the result must appear as many times as it shows in both arrays and you may return the result in any order.

// Example 1:
// Input: nums1 = [1,2,2,1], nums2 = [2,2]
// Output: [2,2]

// Example 2:
// Input: nums1 = [4,9,5], nums2 = [9,4,9,8,4]
// Output: [4,9]
// Explanation: [9,4] is also accepted.
// ========================================================================

// 6.
// Given two strings s and t, return true if t is an anagram of s, and false otherwise.
// An Anagram is a word or phrase formed by rearranging the letters of a different word or phrase, typically using all the original letters exactly once.

// Example 1:
// Input: s = "anagram", t = "nagaram"
// Output: true

// Example 2:
// Input: s = "rat", t = "car"
// Output: false
// ========================================================================
//Approach - 1. First I'll check length of both is same or not, bcoz if length itself is not same anagram cannot be formed.
// 2. To individually count the frequency each letter and check if both the strings have same frequency count or not.

bool isAnagram(String s, String t) {
  if (s.length == t.length) {
    //Converting to lowercase to handle case sentivity.
    // List<String> arrayOfStringS = s.toLowerCase().split("");
    // List<String> arrayOfStringT = t.toLowerCase().split("");

    // arrayOfStringS.sort();
    // arrayOfStringT.sort();

    // return arrayOfStringS.join("") == arrayOfStringT.join();

    s = s.toLowerCase();
    t = t.toLowerCase();

    List<int> letterFrequencyForS = List.filled(26, 0);
    List<int> letterFrequencyForT = List.filled(26, 0);

    for (int character = 0; character < s.length; character++) {
      letterFrequencyForT[t.codeUnitAt(character) - 'a'.codeUnitAt(0)]++;
      letterFrequencyForS[s.codeUnitAt(character) - 'a'.codeUnitAt(0)]++;
    }

    for (int index = 0; index < 26; index++) {
      if (letterFrequencyForT[index] != letterFrequencyForS[index]) {
        return false;
      }
    }

    return true;
  }
  return false;
}

// 7.
// Implement Inorder, preorder and postorder traversal of tree.
// Use the below class to construct your tree data structure.
// Definition for a binary tree node.
class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

// ========================================================================
void inorderTraversal(TreeNode? node) {
  if (node == null) {
    return;
  }

  inorderTraversal(node.left);
  print(node.val);
  inorderTraversal(node.right);
}

// 8.
// Roman numerals are represented by seven different symbols: I, V, X, L, C, D and M.
// Symbol       Value
// I             1
// V             5
// X             10
// L             50
// C             100
// D             500
// M             1000
// For example, 2 is written as II in Roman numeral, just two one's added together. 12 is written as XII, which is simply X + II. The number 27 is written as XXVII, which is XX + V + II.
// Roman numerals are usually written largest to smallest from left to right. However, the numeral for four is not IIII. Instead, the number four is written as IV. Because the one is before the five we subtract it making four. The same principle applies to the number nine, which is written as IX. There are six instances where subtraction is used:
// I can be placed before V (5) and X (10) to make 4 and 9.
// X can be placed before L (50) and C (100) to make 40 and 90.
// C can be placed before D (500) and M (1000) to make 400 and 900.
// Given an integer, convert it to a roman numeral.

// Example 1:
// Input: num = 3
// Output: "III"
// Explanation: 3 is represented as 3 ones.

// Example 2:
// Input: num = 58
// Output: "LVIII"
// Explanation: L = 50, V = 5, III = 3.

// Example 3:
// Input: num = 1994
// Output: "MCMXCIV"
// Explanation: M = 1000, CM = 900, XC = 90 and IV = 4.
// ========================================================================

// 9.
//  Given an input string s, reverse the order of the words.
// A word is defined as a sequence of non-space characters. The words in s will be separated by at least one space.
// Return a string of the words in reverse order concatenated by a single space.
// Note that s may contain leading or trailing spaces or multiple spaces between two words. The returned string should only have a single space separating the words. Do not include any extra spaces.

// Example 1:
// Input: s = "the sky is blue"
// Output: "blue is sky the"

// Example 2:
// Input: s = "  hello world  "
// Output: "world hello"
// Explanation: Your reversed string should not contain leading or trailing spaces.

// Example 3:
// Input: s = "a good   example"
// Output: "example good a"
// Explanation: You need to reduce multiple spaces between two words to a single space in the reversed string.
// ========================================================================
//Approach - 1. Convert the String of words into array of words. Then reverse that array and convert it to string of words again.

String reverseWordsInAString(String words) {
  List<String> listOfWords = words.trim().split(" ");

  for (int word = 0; word < listOfWords.length / 2; word++) {
    String word1 = listOfWords[word];
    listOfWords[word] = listOfWords[listOfWords.length - word - 1];
    listOfWords[listOfWords.length - word - 1] = word1;
  }

  return listOfWords
      .join(" ")
      .replaceAll(RegExp(r'\s+'), ' '); //Handling extra spaces in the string.
}

// 10.
// Given a string s, remove duplicate letters so that every letter appears once and only once. You must make sure your result is
// the smallest in lexicographical order
// among all possible results.

// Example 1:
// Input: s = "bcabc"
// Output: "abc"

// Example 2:
// Input: s = "cbacdcbc"
// Output: "acdb"

// ========================================================================

String removeDuplicateLetters(String s) {
  List<int> lastIndex = List.filled(26, 0);
  for (int i = 0; i < s.length; i++) {
    lastIndex[s.codeUnitAt(i) - 'a'.codeUnitAt(0)] =
        i; // track the last index of character presence
  }

  List<bool> seen = List.filled(26, false); // keep track seen
  List<int> stack = [];

  for (int i = 0; i < s.length; i++) {
    int curr = s.codeUnitAt(i) - 'a'.codeUnitAt(0);
    if (seen[curr])
      continue; // if seen continue as we need to pick one char only
    while (stack.isNotEmpty && stack.last > curr && i < lastIndex[stack.last]) {
      seen[stack.removeLast()] = false; // pop out and mark unseen
    }
    stack.add(curr); // add into stack
    seen[curr] = true; // mark seen
  }

  StringBuffer sb = StringBuffer();
  while (stack.isNotEmpty) {
    sb.writeCharCode(stack.removeLast() + 'a'.codeUnitAt(0));
  }
  return sb.toString().split('').reversed.join('');
}
