# Walkthrough - Practical Work 23: Application using a Service

Successfully completed the practical assignment **"Приложение с использованием сервиса"** (Application using a service).

## Summary of Changes

### 1. Audio Resource (`[NEW]`)
- Added `res/raw/music.mp3` audio file to be played by the service.

### 2. Service Implementation (`[NEW]`)
- [MediaService.java](file:///C:/Users/nik20/AndroidStudioProjects/23_Tarasenko/app/src/main/java/com/example/a23_tarasenko/MediaService.java): Created a background service extending `Service` that utilizes `MediaPlayer` to play the audio file in `onStartCommand()`, initializes it in `onCreate()`, releases/stops it in `onDestroy()`, and returns `null` in `onBind()`.

### 3. User Interface (`[MODIFY]`)
- [activity_main.xml](file:///C:/Users/nik20/AndroidStudioProjects/23_Tarasenko/app/src/main/res/layout/activity_main.xml): Designed a vertical layout with two buttons (`btnStart` and `btnStop`) for starting and stopping the service.

### 4. Activity Controller (`[MODIFY]`)
- [MainActivity.java](file:///C:/Users/nik20/AndroidStudioProjects/23_Tarasenko/app/src/main/java/com/example/a23_tarasenko/MainActivity.java): Added click listeners to start and stop `MediaService` using `startService()` and `stopService()` with `Intent`.

### 5. Manifest Registration (`[MODIFY]`)
- [AndroidManifest.xml](file:///C:/Users/nik20/AndroidStudioProjects/23_Tarasenko/app/src/main/AndroidManifest.xml): Registered `<service android:name=".MediaService" />` inside the `<application>` node.

## Verification Results
- **Build Status**: `app:assembleDebug` built successfully with zero errors.
