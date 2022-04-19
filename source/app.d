import std.stdio;
import bindbc.raylib;

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

      SetTargetFPS(60);

      // Main game loop
      while (!WindowShouldClose())
      {
         // Draw
         BeginDrawing();
         ClearBackground(BLACK);
         EndDrawing();
      }
      CloseWindow();
   }

}
