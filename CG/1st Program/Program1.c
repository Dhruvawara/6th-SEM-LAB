#include <stdio.h>
#include <GL/glut.h>

int x1, x2, y1, y2;

void minit()
{
    glClearColor(1.0, 1.0, 1.0, 1.0);
    glMatrixMode(GL_PROJECTION);
    gluOrtho2D(0, 200, 0, 200);
    glPointSize(3);
}

void dp(int x, int y)
{
    glColor3i(0,0,0);
    glBegin(GL_POINTS);
    glVertex2i(x, y);
    glEnd();
}

void dl(int x1, int y1, int x2, int y2)
{
    int x, y;
    int cx, cy, c1, c2; // c is increment
    int dx, dy, i, e;
    dx = x2 - x1;
    dy = y2 - y1;
    if (dx < 0)
    {
        dx = -dx;
    }
    if (dy < 0)
    {
        dy = -dy;
    }
    cx = 1;
    if (x2 < x1)
    {
        cx = -1;
    }
    cy = 1;
    if (y2 < y1)
    {
        cy = -1;
    }
    x = x1;
    y = y1;
    if (dx > dy)
    {
        printf("%d\t%d\n", x, y);
        dp(x, y);
        e = 2 * dy - dx;
        c1 = 2 * (dy - dx);
        c2 = 2 * dy;
        for (i = 0; i < dx; i++)
        {
            if (e >= 0)
            {
                y += cy;
                e += c1;
            }
            else
            {
                e += c2;
            }
            x += cx;
            printf("%d\t%d\n", x, y);
            dp(x, y);
        }
    }
    else
    {
        printf("%d\t%d\n", x, y);
        dp(x, y);
        e = 2 * dx - dy;
        c1 = 2 * (dx - dy);
        c2 = 2 * dx;
        for (i = 0; i < dy; i++)
        {
            if (e >= 0)
            {
                x += cx;
                e += c1;
            }
            else
            {
                e += c2;
            }
            y += cy;
            printf("%d\t%d\n", x, y);
            dp(x, y);
        }
    }
}

void mDisplay()
{
    glClear(GL_COLOR_BUFFER_BIT);
    dl(x1, y1, x2, y2);
    glFlush();
}

int main(int argc, char **argv)
{
    printf("Enter 1 : ");
    scanf("%d %d", &x1, &y1);
    printf("Enter 2 : ");
    scanf("%d %d", &x2, &y2);
    glutInit(&argc, argv);
    glutInitDisplayMode(GLUT_SINGLE | GLUT_RGB);
    glutInitWindowSize(500, 500);
    glutCreateWindow("My A Boi 1JS18CS403 BRENHAM'S LINE DRAWING ALGORITHM OUTPUT");
    minit();
    glutDisplayFunc(mDisplay);
    glutMainLoop();
}

// bloodydragon@ubuntu:~/6th-SEM-LAB/CG/1st Program$ cc Program1.c -lglut -lGL -lGLU -lm -o Program1.out

// bloodydragon@ubuntu:~/6th-SEM-LAB/CG/1st Program$ ./Program1.out
// Enter 1 : 20 35 
// Enter 2 : 120 155
// 20      35
// 21      36
// 22      37
// .       .
// .       .
// 118     153
// 119     154
// 120     155

// bloodydragon@ubuntu:~/6th-SEM-LAB/CG/1st Program$ ./Program1.out
// Enter 1 : 20 20
// Enter 2 : 180 180
// 20      20
// 21      21
// 22      22
// .       .
// .       .
// 178     178
// 179     179
// 180     180

// bloodydragon@ubuntu:~/6th-SEM-LAB/CG/1st Program$ ./Program1.out
// Enter 1 : 15 35
// Enter 2 : 189 100
// 15      35
// 16      35
// 17      36
// .       .
// .       .
// 187     99
// 188     100
// 189     100