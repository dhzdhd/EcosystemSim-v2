module utils;

import bindbc.raylib;
import std.random;
import consts;

Vector2 getRandomVector(int a = SCREEN_WIDTH - BLOB_RADIUS, int b = SCREEN_HEIGHT - BLOB_RADIUS)
{
    return Vector2(uniform!"[]"(0, a), uniform!"[]"(0, b));
}
