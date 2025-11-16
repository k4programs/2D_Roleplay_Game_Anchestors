@echo off
echo "Exporting for Windows..."
mkdir builds
mkdir builds\windows
Godot_v4.5.1-stable_win64_console.exe --export "Windows Desktop"
echo "Done."
