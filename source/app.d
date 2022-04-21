import std.stdio;
import std.range : repeat;
import std.conv : to;
import std.array;
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
      InitWindow(1080, 720, "Ecosystem Sim");

      Camera3D camera = Camera3D(Vector3(0, 0, 0));
      camera.position = Vector3(0.0f, 500.0f, 600.0f);
      camera.target = Vector3(0.0f, 0.0f, 0.0f);
      camera.up = Vector3(0.0f, 1.0f, 0.0f);
      camera.fovy = 45.0f;
      camera.projection = CameraProjection.CAMERA_PERSPECTIVE;

      SetCameraMode(camera, CameraMode.CAMERA_THIRD_PERSON);
      SetCameraPanControl(KeyboardKey.KEY_ENTER);
      Blob[10] blobArr;
      for (int i = 0; i < 10; i++)
      {
         blobArr[i] = Blob(100, getRandomVector(), getRandomVector(-1, 1, -1, 1), BlobType
               .passive);
      }

      SetTargetFPS(60);

      // Main game loop
      while (!WindowShouldClose())
      {
         // Update
         UpdateCamera(&camera);

         foreach (ref key; blobArr)
         {
            moveBlob(key);
         }
         checkForCollision(blobArr);

         // Draw
         BeginDrawing();
         ClearBackground(BLACK);

         BeginMode3D(camera);
         foreach (ref key; blobArr)
         {
            DrawSphere(key.pos, BLOB_RADIUS, GREEN);
            // DrawSphereWires(key.pos, BLOB_RADIUS, 1, 5, GREEN);
         }
         DrawGrid(50, 10.0f);

         EndMode3D();
         EndDrawing();
      }
      CloseWindow();
   }

}
