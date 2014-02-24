//
//  openglView.m
//  hw6_ios
//
//  Created by Winnie Zeng on 2/23/14.
//  Copyright (c) 2014 Winnie Zeng. All rights reserved.
//

#import "openglView.h"
#import "CC3GLMatrix.h"

typedef struct {
    float Position[3];
    float Color[4];
} Vertex;
/*
const Vertex Vertices[] = {
    {{1, -1, 0}, {1, 0, 0, 1}},
    {{1, 1, 0}, {1, 0, 0, 1}},
    {{-1, 1, 0}, {0, 1, 0, 1}},
    {{-1, -1, 0}, {0, 1, 0, 1}},
    {{1, -1, -1}, {1, 0, 0, 1}},
    {{1, 1, -1}, {1, 0, 0, 1}},
    {{-1, 1, -1}, {0, 1, 0, 1}},
    {{-1, -1, -1}, {0, 1, 0, 1}}
};*/
const Vertex Vertices[] = {
    {{.8944,.4472,0}, {.8944,.4472,0, 1}},
    {{.2764,.4472,.8506},{.2764,.4472,.8506, 1}},
    {{.2764,.4472,-.8506},{.2764,.4472,-.8506,1}},
    {{-.7236,.4472,.5257},{-.7236,.4472,.5257,1}},
    {{-.7236,.4472,-.5257},{-.7236,.4472,-.5257,1}},
    {{-.3416,.4472,0},{-.3416,.4472,0,1}},
    {{-.1056,.4472,.3249},{-.1056,.4472,.3249,1}},
    {{-.1056,.4472,-.3249},{-.1056,.4472,-.3249,1}},
    {{.2764,.4472,.2008},{.2764,.4472,.2008,1}},
    {{.2764,.4472,-.2008},{.2764,.4472,-.2008,1}},
    {{-.8944,-.4472,0},{-.8944,-.4472,0,1}},
    {{-.2764,-.4472,.8506},{-.2764,-.4472,.8506,1}},
    {{-.2764,-.4472,-.8506},{-.2764,-.4472,-.8506,1}},
    {{.7236,-.4472,.5257},{.7236,-.4472,.5257,1}},
    {{.7236,-.4472,-.5257},{.7236,-.4472,-.5257,1}},
    {{.3416,-.4472,0},{.3416,-.4472,0,1}},
{{.1056,-.4472,.3249},{.1056,-.4472,.3249,1}},
{{.1056,-.4472,-.3249},{.1056,-.4472,-.3249,1}},
{{-.2764,-.4472,.2008},{-.2764,-.4472,.2008,1}},
{{-.2764,-.4472,-.2008},{-.2764,-.4472,-.2008,1}},
{{-.5527,.1058,0},{-.5527,.1058,0,1}},
{{-.1708,.1058,.5527},{-.1708,.1058,.5527,1}},
{{-.1708,.1058,-.5527},{-.1708,.1058,-.5527,1}},
{{.4471,.1058,.3249},{.4471,.1058,.3249,1}},
{{.4471,.1058,-.3249},{.4471,.1058,-.3249,1}},
{{.5527,-.1058,0},{.5527,-.1058,0,1}},
{{.1708,-.1058,.5527},{.1708,-.1058,.5527,1}},
{{.1708,-.1058,-.5527},{.1708,-.1058,-.5527,1}},
{{-.4471,-.1058,.3249},{-.4471,-.1058,.3249,1}},
{{-.4471,-.1058,-.3249},{-.4471,-.1058,-.3249,1}},
{{0,1,0},{0,1,0,1}},
    {{0,-1,0},{0,-1,0,1}}
};
const GLubyte Indices[] = {
    0,9,8, 2,7,9, 4,5,7, 3,6,5, 1,8,6,
    0,8,23, 30,6,8, 3,21,6, 11,26,21, 13,23,26,
    2,9,24, 30,8,9, 1,23,8, 13,25,23, 14,24,25,
    4,7,22, 30,9,7, 0,24,9, 14,27,24, 12,22,27,
    3,5,20, 30,7,5, 2,22,7, 12,29,22, 10,20,29,
    1,6,21, 30,5,6, 4,20,5, 10,28,20, 11,21,28,
    10,19,18, 12,17,19, 14,15,17, 13,16,15, 11,18,16,
    31,19,17, 14,17,27, 2,27,22, 4,22,29, 10,29,19,
    31,18,19, 12,19,29, 4,29,20, 3,20,28, 11,28,18,
    31,16,18, 10,18,28, 3,28,21, 1,21,26, 13,26,16,
    31,15,16, 11,16,26, 1,26,23, 0,23,25, 14,25,15,
    31,17,15, 13,15,25, 0,25,24, 2,24,27, 12,27,17
};
/*
const GLubyte Indices[] = {
    // Front
    0, 1, 2,
    2, 3, 0,
    // Back
    4, 6, 5,
    4, 7, 6,
    // Left
    2, 7, 3,
    7, 6, 2,
    // Right
    0, 4, 1,
    4, 1, 5,
    // Top
    6, 2, 1,
    1, 6, 5,
    // Bottom
    0, 3, 7,
    0, 7, 4
};*/

@implementation openglView

+ (Class)layerClass;{
    return [CAEAGLLayer class];
}


- (void)setupLayer {
    _eaglLayer = (CAEAGLLayer*) self.layer;
    _eaglLayer.opaque = YES;
}

- (void)setupContext {
    EAGLRenderingAPI api = kEAGLRenderingAPIOpenGLES2;
    _context = [[EAGLContext alloc] initWithAPI:api];
    if (!_context) {
        NSLog(@"Failed to initialize OpenGLES 2.0 context");
        exit(1);
    }
    
    if (![EAGLContext setCurrentContext:_context]) {
        NSLog(@"Failed to set current OpenGL context");
        exit(1);
    }
}

- (void)setupRenderBuffer {
    glGenRenderbuffers(1, &_colorRenderBuffer);
    glBindRenderbuffer(GL_RENDERBUFFER, _colorRenderBuffer);
    [_context renderbufferStorage:GL_RENDERBUFFER fromDrawable:_eaglLayer];
}

- (void)setupDepthBuffer {
    glGenRenderbuffers(1, &_depthRenderBuffer);
    glBindRenderbuffer(GL_RENDERBUFFER, _depthRenderBuffer);
    glRenderbufferStorage(GL_RENDERBUFFER, GL_DEPTH_COMPONENT16, self.frame.size.width, self.frame.size.height);
}

- (void)setupFrameBuffer {
    GLuint framebuffer;
    glGenFramebuffers(1, &framebuffer);
    glBindFramebuffer(GL_FRAMEBUFFER, framebuffer);
    glFramebufferRenderbuffer(GL_FRAMEBUFFER, GL_COLOR_ATTACHMENT0,
                              GL_RENDERBUFFER, _colorRenderBuffer);
    glFramebufferRenderbuffer(GL_FRAMEBUFFER, GL_DEPTH_ATTACHMENT, GL_RENDERBUFFER, _depthRenderBuffer);
}

- (void)render:(CADisplayLink*)displayLink{
    glClearColor(0.9, 0.9, 0.9, 1.0);
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
    glEnable(GL_DEPTH_TEST);
    
    CC3GLMatrix *projection = [CC3GLMatrix matrix];
    float h = 4.0f * self.frame.size.height / self.frame.size.width;
    [projection populateFromFrustumLeft:-2 andRight:2 andBottom:-h/2 andTop:h/2 andNear:4 andFar:10];
    glUniformMatrix4fv(_projectionUniform, 1, 0, projection.glMatrix);
    
    CC3GLMatrix *modelView = [CC3GLMatrix matrix];
    [modelView populateFromTranslation:CC3VectorMake(sin(CACurrentMediaTime()), 0, -7)];
    _currentRotation += displayLink.duration * 90;

    _currentRotationY += (currentTouchPosition.x - startTouchPosition.x) * 0.1;
    _currentRotationX += (currentTouchPosition.y - startTouchPosition.y) * 0.1;
    //NSLog(@"%f, %f",_currentRotationX, _currentRotationY);
    //[modelView rotateBy:CC3VectorMake(_currentRotation, _currentRotation, 0)];
    [modelView rotateBy:CC3VectorMake( _currentRotationX, _currentRotationY, 0)];
    glUniformMatrix4fv(_modelViewUniform, 1, 0, modelView.glMatrix);
    
    // 1
    glViewport(0, 0, self.frame.size.width, self.frame.size.height);
    
    // 2
    glVertexAttribPointer(_positionSlot, 3, GL_FLOAT, GL_FALSE,
                          sizeof(Vertex), 0);
    glVertexAttribPointer(_colorSlot, 4, GL_FLOAT, GL_FALSE,
                          sizeof(Vertex), (GLvoid*) (sizeof(float) * 3));
    
    // 3
    glDrawElements(GL_TRIANGLES, sizeof(Indices)/sizeof(Indices[0]),
                   GL_UNSIGNED_BYTE, 0);
    
    [_context presentRenderbuffer:GL_RENDERBUFFER];
}


- (GLuint)compileShader:(NSString*)shaderName withType:(GLenum)shaderType {
    
    // 1
    NSString* shaderPath = [[NSBundle mainBundle] pathForResource:shaderName
                                                           ofType:@"glsl"];
    NSError* error;
    NSString* shaderString = [NSString stringWithContentsOfFile:shaderPath
                                                       encoding:NSUTF8StringEncoding error:&error];
    if (!shaderString) {
        NSLog(@"Error loading shader: %@", error.localizedDescription);
        exit(1);
    }
    
    // 2
    GLuint shaderHandle = glCreateShader(shaderType);
    
    // 3
    const char * shaderStringUTF8 = [shaderString UTF8String];
    int shaderStringLength = [shaderString length];
    glShaderSource(shaderHandle, 1, &shaderStringUTF8, &shaderStringLength);
    
    // 4
    glCompileShader(shaderHandle);
    
    // 5
    GLint compileSuccess;
    glGetShaderiv(shaderHandle, GL_COMPILE_STATUS, &compileSuccess);
    if (compileSuccess == GL_FALSE) {
        GLchar messages[256];
        glGetShaderInfoLog(shaderHandle, sizeof(messages), 0, &messages[0]);
        NSString *messageString = [NSString stringWithUTF8String:messages];
        NSLog(@"%@", messageString);
        exit(1);
    }
    
    return shaderHandle;
    
}

- (void)compileShaders {
    
    // 1
    GLuint vertexShader = [self compileShader:@"SimpleVertex"
                                     withType:GL_VERTEX_SHADER];
    GLuint fragmentShader = [self compileShader:@"SimpleFragment"
                                       withType:GL_FRAGMENT_SHADER];
    
    // 2
    GLuint programHandle = glCreateProgram();
    glAttachShader(programHandle, vertexShader);
    glAttachShader(programHandle, fragmentShader);
    glLinkProgram(programHandle);
    
    // 3
    GLint linkSuccess;
    glGetProgramiv(programHandle, GL_LINK_STATUS, &linkSuccess);
    if (linkSuccess == GL_FALSE) {
        GLchar messages[256];
        glGetProgramInfoLog(programHandle, sizeof(messages), 0, &messages[0]);
        NSString *messageString = [NSString stringWithUTF8String:messages];
        NSLog(@"%@", messageString);
        exit(1);
    }
    
    // 4
    glUseProgram(programHandle);
    
    // 5
    _positionSlot = glGetAttribLocation(programHandle, "Position");
    _colorSlot = glGetAttribLocation(programHandle, "SourceColor");
    glEnableVertexAttribArray(_positionSlot);
    glEnableVertexAttribArray(_colorSlot);
    _projectionUniform = glGetUniformLocation(programHandle, "Projection");
    _modelViewUniform = glGetUniformLocation(programHandle, "Modelview");
}

- (void)setupVBOs {
    
    GLuint vertexBuffer;
    glGenBuffers(1, &vertexBuffer);
    glBindBuffer(GL_ARRAY_BUFFER, vertexBuffer);
    glBufferData(GL_ARRAY_BUFFER, sizeof(Vertices), Vertices, GL_STATIC_DRAW);
    
    GLuint indexBuffer;
    glGenBuffers(1, &indexBuffer);
    glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, indexBuffer);
    glBufferData(GL_ELEMENT_ARRAY_BUFFER, sizeof(Indices), Indices, GL_STATIC_DRAW);
    
}

- (void)setupDisplayLink {
    CADisplayLink* displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(render:)];
    [displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
}

/* gesture detection and recognition BEGIN */



- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {

}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    
    UITouch *aTouch = [touches anyObject];
    currentTouchPosition = [aTouch locationInView:self];
    startTouchPosition = [aTouch previousLocationInView:self];
    
    [self setupDisplayLink];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    startTouchPosition = CGPointZero;
    currentTouchPosition = CGPointZero;
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
    
    startTouchPosition = CGPointZero;
    currentTouchPosition = CGPointZero;
}

/* gesture detection and recognition END */


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupLayer];
        [self setupContext];
        [self setupDepthBuffer];
        [self setupRenderBuffer];
        [self setupFrameBuffer];
        [self compileShaders];
        [self setupVBOs];
        [self setupDisplayLink];
        //[self render];
    }
    return self;
}

// Replace dealloc method with this
- (void)dealloc
{
    [_context release];
    _context = nil;
    [super dealloc];
}

@end
