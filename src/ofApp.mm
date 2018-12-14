#include "ofApp.h"

//--------------------------------------------------------------
void ofApp::setup(){

    ofBackground(0);
    
    //TEXT
    myFont.load("SpaceMono-Regular.ttf", 100);
    myWidth = myFont.stringWidth("HexCode");
    text = "HexCode";
    
    //TEXTURE CODE
    w = ofGetWidth();
    h = ofGetHeight();
    texColor.allocate(w,h,GL_RGB);
    colorPixels         = new unsigned char [w*h*3];
    
}

//--------------------------------------------------------------
void ofApp::update(){
    // color pixels, use w and h to control red and green
    for (int i = 0; i < w; i++){
        for (int j = 0; j < h; j++){
            colorPixels[(j*w+i)*3 + 0] = ofMap(touchPoint.x,0,w,0,255);    // r
            colorPixels[(j*w+i)*3 + 1] = ofMap(touchPoint.y,0,h,0,255);    // g
            colorPixels[(j*w+i)*3 + 2] = ofMap(pinch,0,255,0,255); // b
        }
    }
}

//--------------------------------------------------------------
void ofApp::draw(){
    
    //TEXTURE CODE
    texColor.loadData(colorPixels, w,h, GL_RGB);
    texColor.draw(0,0,w,h);
    
    //DRAW TEXT
    myFont.drawString(text, ofGetWidth()/2-myWidth/2, ofGetHeight()/2);
    myFont.drawString(redText, ofGetWidth()/2-225, ofGetHeight()/2);
    myFont.drawString(greenText, ofGetWidth()/2-75, ofGetHeight()/2);
    myFont.drawString(blueText, ofGetWidth()/2+75, ofGetHeight()/2);

}

//--------------------------------------------------------------
void ofApp::exit(){
    
}

//--------------------------------------------------------------
void ofApp::touchDown(ofTouchEventArgs & touch){
  
}

//--------------------------------------------------------------
void ofApp::touchMoved(ofTouchEventArgs & touch){
   
    //TEXTURE CODE
    if(touch.id==0){
        touchPoint.set(touch.x,touch.y);
    }
    if(touch.id==1){
        pinch=touchPoint.distance(touch);
    }
}

//--------------------------------------------------------------
void ofApp::touchUp(ofTouchEventArgs & touch){
    
}

//--------------------------------------------------------------
void ofApp::touchDoubleTap(ofTouchEventArgs & touch){
    //DISAPPEAR TITLE
    text=" ";
    
    //TEXTURE CODE
    int x=touch.x;
    int y=touch.y;
    int red=colorPixels[w*y*3+x*3];
    int green=colorPixels[w*y*3+x*3+1];
    int blue=colorPixels[w*y*3+x*3+2];
    
    //HEX CONVERSION
    std::stringstream stringRed;
    stringRed << std::hex << red; // int decimal_value
    std::string redHex ( stringRed.str() );
    std::stringstream stringGreen;
    stringGreen << std::hex << green; // int decimal_value
    std::string greenHex ( stringGreen.str() );
    std::stringstream stringBlue;
    stringBlue << std::hex << blue; // int decimal_value
    std::string blueHex ( stringBlue.str() );
    cout << "R:" << redHex << " G:"<< greenHex << " B:" << blueHex << endl;
    
    //TEXT
    redText=redHex;
    greenText=greenHex;
    blueText=blueHex;
}

//--------------------------------------------------------------
void ofApp::touchCancelled(ofTouchEventArgs & touch){
    
}

//--------------------------------------------------------------
void ofApp::lostFocus(){
    
}

//--------------------------------------------------------------
void ofApp::gotFocus(){
    
}

//--------------------------------------------------------------
void ofApp::gotMemoryWarning(){
    
}

//--------------------------------------------------------------
void ofApp::deviceOrientationChanged(int newOrientation){
    
}
