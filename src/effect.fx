
// Sample WebGL 1 shader. This just outputs a red color
// to indicate WebGL 1 is in use.

#ifdef GL_FRAGMENT_PRECISION_HIGH
#define highmedp highp
#else
#define highmedp mediump
#endif

precision lowp float;

varying mediump vec2 vTex;
uniform lowp sampler2D samplerFront;
uniform mediump vec2 srcStart;
uniform mediump vec2 srcEnd;
uniform mediump vec2 srcOriginStart;
uniform mediump vec2 srcOriginEnd;
uniform mediump vec2 layoutStart;
uniform mediump vec2 layoutEnd;
uniform lowp sampler2D samplerBack;
uniform lowp sampler2D samplerDepth;
uniform mediump vec2 destStart;
uniform mediump vec2 destEnd;
uniform highmedp float seconds;
uniform mediump vec2 pixelSize;
uniform mediump float layerScale;
uniform mediump float layerAngle;
uniform mediump float devicePixelRatio;
uniform mediump float zNear;
uniform mediump float zFar;

//<-- UNIFORMS -->

void main(void)
{
	lowp vec4 front = texture2D(samplerFront, vTex);
	mediump vec2 n = (vTex - srcStart) / (srcEnd - srcStart);
	lowp vec4 back = texture2D(samplerBack, mix(destStart, destEnd, n));
	lowp vec3 res = mix(front.rgb, back.rgb, mixSlider * front.a);
	gl_FragColor = vec4(res, front.a * back.a);
}
