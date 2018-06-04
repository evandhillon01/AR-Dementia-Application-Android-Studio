#version 300 es
//position
in vec4 position;

//camera transform and texture
uniform mat4 camTextureTransform;
in vec4 camTexCoordinate;

out vec2 v_texCoord;
out vec2 v_blurTexCoords[28];

void main()
{
    gl_Position = position;
    //camera texcoord needs to be manipulated by the transform given back from the system

    v_texCoord = (camTextureTransform * camTexCoordinate).xy;

    v_blurTexCoords[ 0] = v_texCoord + vec2(0, -0.028);
    v_blurTexCoords[ 1] = v_texCoord + vec2(0, -0.024);
    v_blurTexCoords[ 2] = v_texCoord + vec2(0, -0.020);
    v_blurTexCoords[ 3] = v_texCoord + vec2(0, -0.016);
    v_blurTexCoords[ 4] = v_texCoord + vec2(0, -0.012);
    v_blurTexCoords[ 5] = v_texCoord + vec2(0, -0.008);
    v_blurTexCoords[ 6] = v_texCoord + vec2(0, -0.004);
    v_blurTexCoords[ 7] = v_texCoord + vec2(0,  0.004);
    v_blurTexCoords[ 8] = v_texCoord + vec2(0,  0.008);
    v_blurTexCoords[ 9] = v_texCoord + vec2(0,  0.012);
    v_blurTexCoords[10] = v_texCoord + vec2(0,  0.016);
    v_blurTexCoords[11] = v_texCoord + vec2(0,  0.020);
    v_blurTexCoords[12] = v_texCoord + vec2(0,  0.024);
    v_blurTexCoords[13] = v_texCoord + vec2(0,  0.028);
    v_blurTexCoords[14] = v_texCoord + vec2(-0.028, 0);
    v_blurTexCoords[15] = v_texCoord + vec2(-0.024, 0);
    v_blurTexCoords[16] = v_texCoord + vec2(-0.020, 0);
    v_blurTexCoords[17] = v_texCoord + vec2(-0.016, 0);
    v_blurTexCoords[18] = v_texCoord + vec2(-0.012, 0);
    v_blurTexCoords[19] = v_texCoord + vec2(-0.008, 0);
    v_blurTexCoords[20] = v_texCoord + vec2(-0.004, 0);
    v_blurTexCoords[21] = v_texCoord + vec2( 0.004, 0);
    v_blurTexCoords[22] = v_texCoord + vec2( 0.008, 0);
    v_blurTexCoords[23] = v_texCoord + vec2( 0.012, 0);
    v_blurTexCoords[24] = v_texCoord + vec2( 0.016, 0);
    v_blurTexCoords[25] = v_texCoord + vec2( 0.020, 0);
    v_blurTexCoords[26] = v_texCoord + vec2( 0.024, 0);
    v_blurTexCoords[27] = v_texCoord + vec2( 0.028, 0);
}