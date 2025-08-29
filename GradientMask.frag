#version 310 es
precision mediump float;

layout(binding = 0) uniform sampler2D colorsource;
layout(binding = 1) uniform sampler2D masksource;
layout(location = 0) uniform float qt_Opacity;

in vec2 qt_TexCoord0;
out vec4 fragColor;

void main() {
    vec4 color = texture(colorsource, qt_TexCoord0);
    float maskAlpha = texture(masksource, qt_TexCoord0).a;
    fragColor = vec4(color.rgb, maskAlpha * qt_Opacity);
}
