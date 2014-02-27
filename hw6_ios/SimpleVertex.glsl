uniform mat4 Modelview;
uniform mat4 Projection;

attribute vec2 TexCoordIn;
varying vec2 TexCoordOut;

attribute vec4 Position;
attribute vec4 SourceColor;

varying vec4 DestinationColor;

void main(void) {
    DestinationColor = SourceColor;
    gl_Position = Projection * Modelview * Position;
    TexCoordOut = TexCoordIn;
}