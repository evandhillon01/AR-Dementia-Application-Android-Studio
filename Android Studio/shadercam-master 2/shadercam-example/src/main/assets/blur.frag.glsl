#version 300 es
#extension GL_OES_EGL_image_external_essl3 : require

/* BlurFragmentShader.glsl */
precision mediump float;

uniform samplerExternalOES camTexture;

// passed in via our BlurRenderer.java
uniform float	iGlobalTime;

// play around with xy for different sized effect, or pass in via GLES20.glUniform2f();
//note that iResolution is passed in as x = height and y = width in "BlurRenderer"
uniform vec2    iResolution;
out vec4 fragmentColor;
in vec2 v_texCoord;
in vec2 v_blurTexCoords[28];
//        vec2 v_texCoordReal = v_texCoord * iResolution;
//        vec2 halfResolution = iResolution / 2.0;
//        float  minSide = min(iResolution.x, iResolution.y);

void main()
{

    float textCoordRealX = v_texCoord.x;// * iResolution.x;
    float textCoordRealY = v_texCoord.y;// * iResolution.y;
    vec2 halfResolution = vec2(.5);//iResolution / 2.0;
    float  minSide = min(iResolution.x, iResolution.y);
    float  maxSide = max(iResolution.x, iResolution.y);
    float aspect = iResolution.x / iResolution.y;
    //textCoordRealX /= aspect;
    //textCoordRealY /= aspect;

    float currentRadius =  (pow(textCoordRealX - halfResolution.x,2.0 ) + pow(((textCoordRealY - halfResolution.y) / aspect),2.0));
    //float targetRadius = pow(0.4,2.0) + 0.006 * sin(120.0 * textCoordRealX) + 0.008 * sin(70.0 * textCoordRealY);

    float targetRadius = pow(0.4,2.0) + 0.006 * sin(100.0 + (sin(iGlobalTime * 0.1) + 2.0) * 18.0 * v_texCoord.x) + 0.008 * sin(50.0 + (cos(iGlobalTime * 0.1)+2.0) * 22.0 * v_texCoord.y);
    if(currentRadius < targetRadius * targetRadius){

        //fragmentColor = vec4(0.5f);

        fragmentColor += texture(camTexture, v_blurTexCoords[ 0])*0.0044299121055113265 * 0.5;
        fragmentColor += texture(camTexture, v_blurTexCoords[ 1])*0.00895781211794 * 0.5;
        fragmentColor += texture(camTexture, v_blurTexCoords[ 2])*0.0215963866053 * 0.5;
        fragmentColor += texture(camTexture, v_blurTexCoords[ 3])*0.0443683338718 * 0.5;
        fragmentColor += texture(camTexture, v_blurTexCoords[ 4])*0.0776744219933 * 0.5;
        fragmentColor += texture(camTexture, v_blurTexCoords[ 5])*0.115876621105 * 0.5;
        fragmentColor += texture(camTexture, v_blurTexCoords[ 6])*0.147308056121 * 0.5;
        fragmentColor += texture(camTexture, v_texCoord         )*0.159576912161;
        fragmentColor += texture(camTexture, v_blurTexCoords[ 7])*0.147308056121 * 0.5;
        fragmentColor += texture(camTexture, v_blurTexCoords[ 8])*0.115876621105 * 0.5;
        fragmentColor += texture(camTexture, v_blurTexCoords[ 9])*0.0776744219933 * 0.5;
        fragmentColor += texture(camTexture, v_blurTexCoords[10])*0.0443683338718 * 0.5;
        fragmentColor += texture(camTexture, v_blurTexCoords[11])*0.0215963866053 * 0.5;
        fragmentColor += texture(camTexture, v_blurTexCoords[12])*0.00895781211794 * 0.5;
        fragmentColor += texture(camTexture, v_blurTexCoords[13])*0.0044299121055113265 * 0.5;
        fragmentColor += texture(camTexture, v_blurTexCoords[14])*0.0044299121055113265 * 0.5;
        fragmentColor += texture(camTexture, v_blurTexCoords[15])*0.00895781211794 * 0.5;
        fragmentColor += texture(camTexture, v_blurTexCoords[16])*0.0215963866053 * 0.5;
        fragmentColor += texture(camTexture, v_blurTexCoords[17])*0.0443683338718 * 0.5;
        fragmentColor += texture(camTexture, v_blurTexCoords[18])*0.0776744219933 * 0.5;
        fragmentColor += texture(camTexture, v_blurTexCoords[19])*0.115876621105 * 0.5;
        fragmentColor += texture(camTexture, v_blurTexCoords[20])*0.147308056121 * 0.5 ;
        fragmentColor += texture(camTexture, v_blurTexCoords[21])*0.147308056121 * 0.5;
        fragmentColor += texture(camTexture, v_blurTexCoords[22])*0.115876621105 * 0.5;
        fragmentColor += texture(camTexture, v_blurTexCoords[23])*0.0776744219933 * 0.5;
        fragmentColor += texture(camTexture, v_blurTexCoords[24])*0.0443683338718 * 0.5;
        fragmentColor += texture(camTexture, v_blurTexCoords[25])*0.0215963866053 * 0.5;
        fragmentColor += texture(camTexture, v_blurTexCoords[26])*0.00895781211794 * 0.5;
        fragmentColor += texture(camTexture, v_blurTexCoords[27])*0.0044299121055113265 * 0.5;
     }
     else{
         fragmentColor = texture(camTexture, v_texCoord);
     }
}