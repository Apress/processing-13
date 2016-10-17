/*------------------------------------------------------------
Copyright (c) 2013, friends of Ed (An Apress Company)
All rights reserved.

The code provided here accompanies the book:

Processing: Creative Coding and Generative Art in Processing 2
By Ira Greenberg, Dianna Xu, and Deepak Kumar
friends of Ed (An APress Company), 2013
ISBN-13 978-1430244646
Please refer to the associated README for a full disclaimer.
------------------------------------------------------------*/
// SpinningTriangle.java, chapter 11
// Example using Java and OpenGL.
// NOTE - This will not run in Processing!

import java.awt.Frame;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import javax.media.opengl.*;
import javax.media.opengl.awt.GLCanvas;
import com.jogamp.opengl.util.*;

public class SpinningTriangle implements GLEventListener {

    private double theta = 0;
    private float[] xs, ys;

    public static void main(String[] args) {
        GLProfile glp = GLProfile.getDefault();
        GLCapabilities caps = new GLCapabilities(glp);
        GLCanvas canvas = new GLCanvas(caps);
        
        Frame frame = new Frame("Spinning Triangle");
        frame.setSize(400, 400);
        frame.add(canvas);
        frame.setVisible(true);

        frame.addWindowListener(new WindowAdapter() {
            @Override
		public void windowClosing(WindowEvent e) {
                System.exit(0);
            }
        });

        canvas.addGLEventListener(new SpinningTriangle());
        FPSAnimator animator = new FPSAnimator(canvas, 60);
        animator.add(canvas);
        animator.start();
    }

    @Override
    public void display(GLAutoDrawable drawable) {
        update();
        render(drawable);
    }

    @Override
    public void dispose(GLAutoDrawable drawable) {
    }

    @Override
    public void init(GLAutoDrawable drawable) {
    	// calculate vertices
    	xs = new float[3];
       	 ys = new float[3];
	    for(int i=0; i<3; i++){
	    	xs[i] = (float)Math.cos(theta);
	    	ys[i] = (float)Math.sin(theta);
	    	theta += (float)(Math.PI*2/3);
	    	}
    }

    @Override
    public void reshape(GLAutoDrawable drawable, int x, int y, int w, int h) {
    }

    private void update() {
    }

    private void render(GLAutoDrawable drawable) {
        GL2 gl = drawable.getGL().getGL2();
        gl.glClear(GL.GL_COLOR_BUFFER_BIT);
        gl.glRotatef(1.3f, 0, 1, 0);
        gl.glRotatef(-1.3f, 0, 0, 1);

        // rotating triangle
        gl.glBegin(GL.GL_TRIANGLES);
        for(int i=0; i<3; i++){
        	gl.glVertex2d(xs[i], ys[i]);
        }
        gl.glEnd();
    }
}
