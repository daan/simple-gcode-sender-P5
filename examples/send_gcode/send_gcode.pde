import processing.serial.*;
import gcode.*;

Machine m;

void setup() {
    size(400,150);

    // print available serial ports
    // printArray(Machine.enumeratePorts() );
    
    // make a machine
    m = new Machine();

    // connect using the "last" serial port and 112k500 baudrate.
    m.connect(this);     
    
    // m.connect(this, "/dev/tty.usbmodem1421"); // use on macOS 
    // m.connect(this, "COM6");  // use on Windows
    
    m.schedule("G91");
    m.schedule("G1 F200 X10");
    m.schedule("G1 Y10");
    m.schedule("G1 Z10");
    
    m.schedule("G1 X10 Y10 Z10");
    
}


void draw() {

  
  if (m.hasNewReplies() ) {
    StringList replies = m.getReplies();
    for(int i=0; i < replies.size(); i++) {
      println(replies.get(i) );
    }
  }
}
