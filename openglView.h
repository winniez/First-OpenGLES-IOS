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
    GLuint _texCoordSlot;
    GLuint _textureUniform;
    
    float _currentRotation;
    float _currentRotationX;
    float _currentRotationY;
    GLfloat _scale1;
    GLuint _depthRenderBuffer;
    
    GLuint _vertexBuffer;
    GLuint _indexBuffer;
    
}
@property(nonatomic, getter=isMultipleTouchEnabled) BOOL multipleTouchEnabled;

@end
