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

// Sketch 7-10: Word Cloud Visualization – First Draft
// Sketch 7-10a: The Word frequency table class
class WordFreq {
  // A Frequency table class for Words
  ArrayList<WordTile> wordFrequency;
  String [] stopWords = loadStrings("stopwords.txt");

  WordFreq(String[] tokens) {  // Constructor

    wordFrequency = new ArrayList();
    // Compute the wordFrequency table using tokens
    for (String t : tokens) {
      if (!_isStopWord(t)) {
        // See if token t is already a known word
        int index = _search(t, wordFrequency);
        if (index >= 0) {
          ( wordFrequency.get(index)).incr();
        }
        else {
          wordFrequency.add(new WordTile(t));
        }
      }
    } // for
  } // WordFreq()
  
  void tabulate(int n) {  // console printout
    //int n = wordFrequency.size();
    println("There are "+N()+" entries.");
    for (int i=0; i < n; i++) {
      println(wordFrequency.get(i));
    }
  } // tabulate
  
  void arrange(int N) {  // arrange or map the first N tiles in sketch
    for (int i=0; i < N; i++) {
      WordTile tile = wordFrequency.get(i);
      tile.setFontSize();
      tile.setSize();
      tile.setXY(random(width), random(height));
    }
  } // arrange()
  
  void display(int N) {
    for (int i=0; i < N; i++) {
      WordTile tile = wordFrequency.get(i);
      tile.display();
    }
  }  // display()

    int N() { // Number of table entries
      return wordFrequency.size();
    } // N()
    
    String[] samples() {  // Returns all the words
      String [] k = new String[N()];
      int i=0;
      for (WordTile w : wordFrequency) {
        k[i++] = w.getWord();
      }
      return k;
    } // samples()
    
    int[] counts() {  // Returns all the frequencies
      int [] v = new int[N()];
      int i=0;
      for (WordTile w : wordFrequency) {
        v[i++] = w.getFreq();
      }
      return v;
    } // counts()
    
    int maxFreq() {  // The max frequency
      return max(counts());
    } // maxFreq()

    int _search(String w, ArrayList<WordTile> L) {
      // search for word w  in L.
      // Returns index of w in L if found, -1 o/w
      for (int i=0; i < L.size(); i++) {
        if (L.get(i).getWord().equals(w))
          return i;
      }
      return -1;
    } // _search()

    boolean _isStopWord(String word) {  // Is word a stop word?
      for (String stopWord : stopWords) {
        if (word.equals(stopWord)) {
          return true;
        }
      }
      return false;
    } // _isStopWord()

    String toString() {  // Print representation
      return "Word Frequency Table with"+N()+" entries.";
    } // toString()
  } // class WordFreq

