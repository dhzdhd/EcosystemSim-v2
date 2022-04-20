import std.stdio;
import std.range : repeat;
import std.conv : to;
import bindbc.raylib;
import game;
import consts;
import utils;

void main(string[] _)
{
   RaylibSupport retVal = loadRaylib();
   if (retVal != raylibSupport)
   {
      writeln("ERROR: ", retVal);
   }
   else
   {
      writeln("VERSION: ", retVal);
      writeln("loaded : ", loadedRaylibVersion);

      // Initialization
      InitWindow(SCREEN_WIDTH, SCREEN_HEIGHT, "Ecosystem Sim");

      Blob[10] blobArr;
      for (int i = 0; i < 10; i++)
      {
         blobArr[i] = Blob(100, getRandomVector(), getRandomVector(5, 5), BlobType.passive);
      }

      SetTargetFPS(60);

      // Main game loop
      while (!WindowShouldClose())
      {
         // Update
         foreach (ref key; blobArr)
         {
            moveBlob(key);
         }
         checkForCollision(blobArr);

         // Draw
         BeginDrawing();
         ClearBackground(BLACK);
         foreach (key; blobArr)
         {
            DrawCircle(to!int(key.pos.x), to!int(key.pos.y), BLOB_RADIUS, GREEN);
         }

         EndDrawing();
      }
      CloseWindow();
   }

}
