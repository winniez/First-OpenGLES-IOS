//
//  openglView.h
//  hw6_ios
//
//  Created by Winnie Zeng on 2/23/14.
//  Copyright (c) 2014 Winnie Zeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import <OpenGLES/ES2/gl.h>
#import <OpenGLES/ES2/glext.h>
#import "ccTypes.h"

#define HORIZ_SWIPE_DRAG_MIN 12
#define VERT_SWIPE_DRAG_MAX 4

@interface openglView : UIView
{
    CAEAGLLayer* _eaglLayer;
    EAGLContext* _context;
    
    CGPoint startTouchPosition;
    CGPoint currentTouchPosition;
    
    GLuint _colorRenderBuffer;
    GLuint _positionSlot;
    GLuint _colorSlot;
    GLuint _projectionUniform;
    GLuint _modelViewUniform;
    float _currentRotation;
    float _currentRotationX;
    float _currentRotationY;
    GLuint _depthRenderBuffer;
    
}

@end
