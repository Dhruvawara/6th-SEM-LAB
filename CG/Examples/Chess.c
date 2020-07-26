#include <stdio.h>
#include <stdlib.h>
#include <GL/glut.h>
#define maxx 9
#define maxy 9
#define dx 15
#define dy 15
GLfloat x0 = {10.0}, y01 = {50.0};
GLfloat x[maxx], y[maxy];

void init()
{
    glClearColor(1.0, 1.0, 1.0, 1.0);
    glMatrixMode(GL_PROJECTION);
    glLoadIdentity();
    gluOrtho2D(0.0, 499.0, 0.0, 499.0);
}

void display(void)
{
    glClear(GL_COLOR_BUFFER_BIT);
    GLint i, j;

    for (i = 0; i < maxx; i++)
        x[i] = x0 + i * dx;

    for (j = 0; j < maxy; j++)
        y[j] = y01 + j * dy;

    for (i = 0; i < maxx - 1; i++)
        for (j = 0; j < maxy - 1; j++)
        {
            if ((i + j) % 2 == 0)
            {
                glColor3f(0, 0, 0);
                glBegin(GL_POLYGON);
                glVertex2f(x[i], y[j]);
                glVertex2f(x[i + 1], y[j]);
                glVertex2f(x[i + 1], y[j + 1]);
                glVertex2f(x[i], y[j + 1]);
                glEnd();
            }
            else
            {
                glColor3f(0.7, 0.2, 0.7);
                glBegin(GL_LINE_LOOP);
                glVertex2f(x[i], y[j]);
                glVertex2f(x[i + 1], y[j]);
                glVertex2f(x[i + 1], y[j + 1]);
                glVertex2f(x[i], y[j + 1]);
                glEnd();
            }
            glFlush();
        }
}

int main(int argc, char **argv)
{
    glutInit(&argc, argv);
    glutInitDisplayMode(GLUT_SINGLE | GLUT_RGB);
    glutInitWindowSize(500, 500);
    glutInitWindowPosition(50, 40);
    glutCreateWindow("1JS18CS422 CHESS BOARD");
    glutDisplayFunc(display);
    init();
    glutMainLoop();
    return 0;
}

// $ cc Chess.c -lglut -lGL -lGLU -o Chess.out
// $ ./Chess.out