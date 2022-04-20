module utils;

import bindbc.raylib;
import std.random;
import consts;
import std.conv : to;

template getRandomVector()
{
    Vector2 getRandomVector(int a = SCREEN_WIDTH - BLOB_RADIUS, int b = SCREEN_HEIGHT - BLOB_RADIUS)
    {
        return Vector2(uniform!"[]"(0, a), uniform!"[]"(0, b));
    }

    Vector2 getRandomVector(int x1, int x2, int y1, int y2)
    {
        return Vector2(uniform!"[]"(x1, x2), uniform!"[]"(y1, y2));
    }
}

T getRandomValueT(T, S)(S a, S b)
{
    return to!T(uniform!"[]"(a, b));
}
