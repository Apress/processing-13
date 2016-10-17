/*------------------------------------------------------------
Copyright (c) 2013, Friends of Ed (An Apress Company)
All rights reserved.

The code provided here accompanies the book:

Processing: Creative Coding and Generative Art in Processing 2
By Ira Greenberg, Dianna Xu, and Deepak Kumar
Friends of Ed (An APress Company), 2013
ISBN-13 978-1430244646
Please refer to the associated README for a full disclaimer.
------------------------------------------------------------*/

// Sketch 7-3: Using ArrayLists for word frequencies
//             And eliminating stop words
String inputTextFile = "Obama.txt";
String [] fileContents;
String rawText;
String [] tokens;
String delimiters = " ,./?<>;:'\"[{]}\\|=+-_()*&^%$#@!~";
ArrayList<Word> wordFrequency = new ArrayList();

String [] stopWords;

void setup() {
  // Input and parse text file
  fileContents = loadStrings(inputTextFile);
  rawText = join(fileContents, " ");
  rawText = rawText.toLowerCase();
  tokens = splitTokens(rawText, delimiters);
  // print out the number of tokens found
  println(tokens.length+" tokens found in file: "+inputTextFile);
  
  // Get stop words
  stopWords = loadStrings("stopwords.txt");
  // Compute the wordFrequency table using tokens
  for (String t : tokens) {
    if (!isStopWord(t)) {
      // See if token t is already a known word
      int index = search(t, wordFrequency);
      if (index >= 0) {
        wordFrequency.get(index).incr();
      }
      else {
        wordFrequency.add(new Word(t));
      }
    }// if
  } // for

  // Compute the wordFrequency table using tokens
  for (String t : tokens) {
    // See if token t is already a known word
    int index = search(t, wordFrequency);
    if (index >= 0) {
      wordFrequency.get(index).incr();
    }
    else {
      wordFrequency.add(new Word(t));
    } // if
  } // for
  println("There were "+wordFrequency.size()+" words.");
  for (int i=0; i < wordFrequency.size(); i++) {
    println(wordFrequency.get(i));
  }
} // setup()
int search(String w, ArrayList<Word> L) {
  // search for word w  in L.
  // Returns index of w in L if found, -1 o/w
  for (int i=0; i < L.size(); i++) {
    if (L.get(i).getWord().equals(w))
      return i;
  }
  return -1;
} // search()

boolean isStopWord(String word) {  // Is word a stop word?
  for (String stopWord : stopWords) {
    if (word.equals(stopWord)) {
      return true;
    }
  }
  return false;
} // isStopWord()
