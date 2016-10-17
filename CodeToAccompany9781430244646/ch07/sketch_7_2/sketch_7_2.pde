// Sketch 7-2: Using ArrayLists for word frequencies
String inputTextFile = "Obama.txt";
String [] fileContents;
String rawText;
String [] tokens;
String delimiters = " ,./?<>;:'\"[{]}\\|=+-_()*&^%$#@!~";
ArrayList<Word> wordFrequency = new ArrayList();
void setup() {
  // Input and parse text file
  fileContents = loadStrings(inputTextFile);
  rawText = join(fileContents, " ");
  rawText = rawText.toLowerCase();
  tokens = splitTokens(rawText, delimiters);
  // print out the number of tokens found
  println(tokens.length+" tokens found in file: "+inputTextFile);
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
