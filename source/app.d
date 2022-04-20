import std.stdio;
import std.range : repeat;
import std.conv : to;
import bindbc.raylib;
import game;

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

      immutable int SCREEN_WIDTH = 800;
      immutable int SCREEN_HEIGHT = 450;

      // Initialization
      InitWindow(SCREEN_WIDTH, SCREEN_HEIGHT, "Ecosystem Sim");

      auto blobArr = Blob(100, Vector2(0, 0), Vector2(0, 0), BlobType.passive).repeat(10);

      SetTargetFPS(60);

      // Main game loop
      while (!WindowShouldClose())
      {
         // Update

         // Draw
         BeginDrawing();
         ClearBackground(BLACK);
         writeln(blobArr);
         foreach (key; blobArr)
         {
            DrawCircle(to!int(key.pos.x), to!int(key.pos.y), 5, GREEN);
         }

         EndDrawing();
      }
      CloseWindow();
   }

}
