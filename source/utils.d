module utils;

import bindbc.raylib;
import std.random;
import consts;
import std.conv : to;

template getRandomVector()
{
    Vector3 getRandomVector()
    {
        return Vector3(uniform!"[]"(-(SCREEN_WIDTH / 2) + BLOB_RADIUS, SCREEN_WIDTH / 2 - BLOB_RADIUS), 5, uniform!"[]"(
                -(SCREEN_HEIGHT / 2) + BLOB_RADIUS, SCREEN_HEIGHT / 2 - BLOB_RADIUS));
    }

    Vector3 getRandomVector(int x1, int x2, int z1, int z2)
    {
        return Vector3(uniform!"[]"(x1, x2), 5, uniform!"[]"(z1, z2));
    }
}

T getRandomValueT(T, S)(S a, S b)
{
    return to!T(uniform!"[]"(a, b));
}
