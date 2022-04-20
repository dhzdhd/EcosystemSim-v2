module game;

import bindbc.raylib;
import consts;

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

void checkWallCollision(Blob blob)
{
    if (blob.pos.x > SCREEN_WIDTH || blob.pos.x < 0)
    {
        blob.vel.x *= -1;
    }
    else if (blob.pos.y > SCREEN_HEIGHT || blob.pos.y < 0)
    {
        blob.vel.y *= -1;
    }
}
