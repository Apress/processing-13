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

// Sketch 7-11: Word Cloud Visualization
// Sketch 7-11: The Word frequency table class

class WordFreq {
  // A Frequency table class for Words
  ArrayList<WordTile> wordFrequency;
  String [] stopWords = loadStrings("stopwords.txt");
 
  WordFreq(String[] tokens) {  // Constructor

    wordFrequency = new ArrayList();

    // Compute the wordFrequency table using tokens
    for (String t : tokens) {
      if (!_isStopWord(t, stopWords)) {
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
    // Sort the table in reverse order of frequencies
    _sort(wordFrequency);
    //Collections.sort(wordFrequency, Collections.reverseOrder());
  } // WordFreq()

  void tabulate(int n) {  // console printout
    //int n = wordFrequency.size();
    println("There are "+N()+" entries.");
    for (int i=0; i < n; i++) {
      println(wordFrequency.get(i));
    }
  } // tabulate

  void arrange(int N) {  // arrange or map the first N tiles in sketch
    WordTile tile;
    for (int i=0; i < N; i++) {
      tile = wordFrequency.get(i);
      tile.setFontSize();

      // Exploring the spiral layout
      float cx = width/2-50, cy = height/2, px, py;
      float R = 0.0, dR = 0.2, theta = 0.0, dTheta = 0.5;
      do {  // find the next x, y for tile, i in spiral
        float x = cx + R*cos(theta);
        float y = cy + R*sin(theta); 
        tile.setXY(x, y);
        px = x;
        py = y;
        theta+=dTheta;
        R += dR;
      } // until the tile is clear of all other tiles
      while (!clear (i));
    }
  } // arrange()

  boolean clear(int n) { // Is tile, i clear of tiles 0..i-1?
    WordTile tile1 = wordFrequency.get(n);
    for (int i=0; i < n; i++) {
      WordTile tile2 = wordFrequency.get(i);
      if (tile1.intersect(tile2)) {
        return false;
      }
    } // for
    return true;
  } // clear()

  void display(int N) {
    for (int i=0; i < N; i++) {
      WordTile tile = wordFrequency.get(i);
      tile.display();
    }
  } // display()

  void interact(float mx, float my) {
    // Find out which tile was clicked
    WordTile tile = _searchTile(wordFrequency, mx, my);

    println("Tile Clicked: "+tile);
    // Do something on it
    if (tile != null) {
      tile.tileColor = color(255, 0, 0);
      tile.display();
    }
  } // interact()

  int N() { // Number of table entries
    return wordFrequency.size();
  } // N()

  String[] samples() {  // Returns all the words
    String [] k = new String[N()];
    int i=0;
    for (Word w : wordFrequency) {
      k[i++] = w.getWord();
    }
    return k;
  } // keys()

  int[] counts() {  // Returns all the frequencies
    int [] v = new int[N()];
    int i=0;
    for (Word w : wordFrequency) {
      v[i++] = w.getFreq();
    }
    return v;
  } // values()

  int maxFreq() {  // The max frequency
    return max(counts());
  } // maxFreq()

  int _search(String w, ArrayList<WordTile> L) {
    // Search for word, w in L
    for (int i=0; i < L.size(); i++) {
      if (L.get(i).getWord().equals(w))
        return i;
    }
    return -1;
  } // search()

  WordTile _searchTile(ArrayList<WordTile> L, float mx, float my) {

    for (int i=0; i < L.size(); i++) {
      WordTile tile = L.get(i);
      if (ptInTile(tile, mx, my)) {
        return(tile);
      }
    }
    return null;
  } // _searchTile()

  boolean ptInTile(WordTile t, float x, float y) {
    float x1 = t.location.x;
    float y1 = t.location.y - t.tileH;
    float x2 = x1+t.tileW;
    float y2 = t.location.y;

    return ((x >= x1 && x <= x2) && (y >= y1 && y <= y2));
  } // ptInTile()
  boolean _isStopWord(String word, String[] stopWords) {
    for (String stopWord : stopWords) {
      if (word.equals(stopWord)) {
        return true;
      }
    }
    return false;
  } // isStopWord()

  void _sort(ArrayList<WordTile> A) { // sort the array A in ascending order
    // for i=1 through N-1:
    for (int i=0; i < A.size(); i++) {
      // insert A[i] in A[0] .. A[i] such that A[0] <= A[1] <= … <= A[i]
      WordTile a = A.get(i);      // Save A[i] in p
      int pos = i;
      //while ( (pos > 0) && (A.get(pos-1).getFreq() < a.getFreq())) {
      while ( (pos > 0) && (a.compareTo(A.get(pos-1))>0)) {
        // Move A[pos-1] back by 1
        A.set(pos, A.get(pos-1));
        pos--;
      } // while
      // A[pos] is where a gets inserted
      A.set(pos, a);
    }// for
  } // _sort

  String toString() {  // Print representation
    return "Word Frequency Table with"+N()+" entries.";
  } // toString()
} // class WordFreq

