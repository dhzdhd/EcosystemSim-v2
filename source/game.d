module game;

import bindbc.raylib;
import consts;
import std.string : format;
import std.stdio : writeln;
import utils;

enum BlobType
{
    passive,
    aggressive,
    diseased
}

struct Blob
{
    double energy; // Opacity
    Vector2 pos;
    Vector2 vel;
    BlobType type;
}

void moveBlob(ref Blob blob)
{
    blob.pos.x += blob.vel.x;
    blob.pos.y += blob.vel.y;

    if (blob.pos.x > SCREEN_WIDTH - BLOB_RADIUS || blob.pos.x < BLOB_RADIUS)
    {
        blob.vel.x *= -1;
    }
    else if (blob.pos.y > SCREEN_HEIGHT - BLOB_RADIUS || blob.pos.y < BLOB_RADIUS)
    {
        blob.vel.y *= -1;
    }
    else
    {
        blob.vel = getRandomVector(-1, 1, -1, 1);
    }
}

void checkForCollision(Blob[] blobArr)
{
    foreach (ref i; blobArr)
    {
        foreach (ref j; blobArr)
        {
            if (CheckCollisionCircles(i.pos, BLOB_RADIUS, j.pos, BLOB_RADIUS) && i != j)
            {
                i.vel.x *= -1;
                i.vel.y *= -1;
                j.vel.x *= -1;
                j.vel.y *= -1;
            }
        }
    }
}
