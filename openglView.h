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
/*  Poor man's approximation of PI */
#define PI 3.1415926535898
/*  Macro for sin & cos in degrees */
#define Cos(th) cos(PI/180*(th))
#define Sin(th) sin(PI/180*(th))
/*  D degrees of rotation */
#define DEF_D 5
#define TEX_COORD_MAX   1

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
    
    GLuint _floorTexture;
    GLuint _fishTexture;
    GLuint _texCoordSlot;
    GLuint _textureUniform;
    
    float _currentRotation;
    float _currentRotationX;
    float _currentRotationY;
    GLfloat _scale1;
    GLuint _depthRenderBuffer;
    
    GLuint _vertexBuffer;
    GLuint _indexBuffer;
    GLuint _vertexBuffer2;
    GLuint _indexBuffer2;
    
}
@property(nonatomic, getter=isMultipleTouchEnabled) BOOL multipleTouchEnabled;

@end
