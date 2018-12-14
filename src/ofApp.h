#pragma once

#include "ofxiOS.h"

#define NUM_SECTIONS 3

class ofApp : public ofxiOSApp {
	
    public:
        void setup();
        void update();
        void draw();
        void exit();
	
        void touchDown(ofTouchEventArgs & touch);
        void touchMoved(ofTouchEventArgs & touch);
        void touchUp(ofTouchEventArgs & touch);
        void touchDoubleTap(ofTouchEventArgs & touch);
        void touchCancelled(ofTouchEventArgs & touch);

        void lostFocus();
        void gotFocus();
        void gotMemoryWarning();
        void deviceOrientationChanged(int newOrientation);
    
    int hue;
    int saturation;
    int brightness;
    int hexColor;
    ofVec2f touchPoint;
    ofTrueTypeFont myFont;
    float myWidth;
    ofPixels pixels;
    ofColor myColor;
    string text, redText, greenText, blueText;


    //TEXTURE CODE
    ofTexture texColor;
    int w;
    int h;
    int pinch;
    unsigned char * colorPixels;
    
};


