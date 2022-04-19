module game;

import bindbc.raylib;

abstract interface IBlob
{
    int radius;
    int strength; // Opacity
    Color color;
    Vector2 pos;
}

class PassiveBlob : IBlob
{
    void name()
    {
    };
}

class Food
{
}

void checkWallCollision()
{
}
