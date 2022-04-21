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
    Vector3 pos;
    Vector3 vel;
    BlobType type;
}

void moveBlob(ref Blob blob)
{
    blob.pos.x += blob.vel.x;
    blob.pos.z += blob.vel.z;

    if (blob.pos.x > SCREEN_WIDTH / 2 - BLOB_RADIUS || blob.pos.x < (-SCREEN_WIDTH / 2 + BLOB_RADIUS))
    {
        blob.vel.x *= -1;
    }
    else if (blob.pos.z > SCREEN_HEIGHT / 2 - BLOB_RADIUS || blob.pos.z < (
            -SCREEN_HEIGHT / 2 + BLOB_RADIUS))
    {
        blob.vel.z *= -1;
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
            if (CheckCollisionCircles(Vector2(i.pos.x, i.pos.z), BLOB_RADIUS, Vector2(j.pos.x, j
                    .pos.z), BLOB_RADIUS) && i != j)
            {
                i.vel.x *= -1;
                i.vel.z *= -1;
                j.vel.x *= -1;
                j.vel.z *= -1;
            }
        }
    }
}
