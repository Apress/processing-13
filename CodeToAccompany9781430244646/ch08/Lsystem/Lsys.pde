class Lsys {
  String axiom;
  ArrayList rules;
  String out;                        // final output string

  Lsys() {
    axiom = new String();
    rules = new ArrayList();
    out = new String();
  }// end Lsys()

  void setAxiom(String s) {
    axiom += s;
    out += axiom;
  }// end setAxiom()

  void addRule(String rule) {
    String r = new String(rule);
    rules.add(r);
  }// end addRule;

  // search for a specific rule that starts with character c
  // return the arrayList index if found, -1 if not
  int searchRule(char c) {
    for (int i=0; i<rules.size(); i++) {
      String r = (String) rules.get(i);
      if (r.charAt(0) == c) {
        return i;
      }
    }
    return -1;
  }// end searchRule()

  // apply the rules n times and store the result in out
  void genString(int n) {
    if (n>0) {
      String temp = "";
      for (int i=0; i<out.length(); i++) {
        int idx = searchRule(out.charAt(i));
        if (idx == -1) {
          temp += out.substring(i, i+1);      //char -> substring of length 1
        }
        else {
          String r = (String) rules.get(idx);
          temp += r.substring(1);            //substring starting at the 2nd char
        }
      }
      out = new String(temp);
      genString(n-1);
    }
  }// end genString()

  void render(float size, float angle) {
    for (int i=0; i<out.length(); i++) {
      switch (out.charAt(i)) {
      case 'F':                      // move forward, pen down
        line(0, 0, size, 0);
        translate(size, 0);
        break;
      case '+':                      // turn left
        rotate(radians(-angle));
        break;
      case '-':                      // turn right
        rotate(radians(angle));
        break;
      case '[':                      // save position and orientation
        pushMatrix();
        break;
      case ']':                      // restore saved position and orientation
        popMatrix();
        break;
      default:
        break;
      }
    }
  }// end render()
}// end class Lsys

