package com.androidexperiments.shadercam.example.gl;

import android.content.Context;
import android.graphics.SurfaceTexture;
import android.opengl.GLES20;
import android.os.SystemClock;

import com.androidexperiments.shadercam.gl.CameraRenderer;

/**
 * Created by edhillon3 on 7/28/16.
 */
public class BlurRenderer extends CameraRenderer {

    private int mWidth;
    private int mHeight;

    public BlurRenderer(Context context, SurfaceTexture texture, int width, int height) {
        super(context, texture, width, height, "blur.frag.glsl", "blurV.vert.glsl");
        mWidth = width;
        mHeight = height;
    }

    @Override
    protected void setUniformsAndAttribs() {
        //always call super so that the built-in fun stuff can be set first
        super.setUniformsAndAttribs();

        int globalTimeHandle = GLES20.glGetUniformLocation(mCameraShaderProgram, "iGlobalTime");
        GLES20.glUniform1f(globalTimeHandle, SystemClock.currentThreadTimeMillis() / 100.0f);

        int resolutionHandle = GLES20.glGetUniformLocation(mCameraShaderProgram, "iResolution");
        GLES20.glUniform2f(resolutionHandle, mHeight, mWidth);
    }
}
