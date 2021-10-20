import java.util.regex.*;
class TextInputField extends ScreenObject{
  String text = "";
  TextInputFilter tfilter = TextInputFilter.None;
  boolean focus = false;
  TextInputField(int xIn, int yIn, int wIn, int hIn){
    super(xIn,yIn,wIn,hIn);
    this.setDrawFunc(new Runnable() {
      @Override
        public void run() {
          stroke(0,0,0);
          fill(200,200,200);
          strokeWeight(1);
          if(focus){
            fill(240,240,200);
            strokeWeight(2);
          }
          rect(x,y,w,h);
          fill(0,0,0);
          textFont(winFont, h);
          textAlign(LEFT, BOTTOM);
          text(text, x+1, y+h+1);
      }
    });
  }
  TextInputField(int xIn, int yIn, int wIn, int hIn, TextInputFilter tfilter){
    this(xIn,yIn,wIn,hIn);
    this.tfilter = tfilter;
  }
  
  @Override
  void onClick(){
    focus = true;
  }
  void onKeyPressed(){
    if(focus){
      switch(key){
        case BACKSPACE:
          if(text == null || text == "" || text.length() == 0){
            return;
          }
          text = text.substring(0, text.length()-1);
          break;
        default:
          switch(tfilter){
            case None:
              text += key;
              break;
            case Numbers:
              //regex from stackoverflow
              Pattern pattern = Pattern.compile("^[0-9]*$");
              if(pattern.matcher(str(key)).find()){
                System.out.println(key);
                text += key;
              }
              break;
            default:
              text += key;
              break;
          }
          break;
      }
    }
  }
  String getText(){
    return text;
  }
}

enum TextInputFilter{
  None,
  Numbers
}
