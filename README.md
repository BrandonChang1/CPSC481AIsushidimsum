# CPSC481AIsushidimsum
CPSC 481 AI: Assistant for Sushi Go: Spin Some for Dim Sum

Brandon Chang
Fall 2024 CPSC 481-02: Artificial Intelligence
Professor Hamid Ebrahimi

## Project Setup
This project uses Godot 4.3. It can be downloaded from https://godotengine.org/download/ The C# compatible version is not necessary, because this project uses GDScript, not C#.
Open the project's folder or project.godot

## Project Viewing, Editing, and Compiling
Nearly everything can be handled from within Godot.
Code locations are a bit of a mess because I moved a lot of code from main.tscn to the "Global" Autorun, then realized that was a mistake and moved much of it back to main.tscn. Scoring and evaluation functions are in the "Scoring" autoload. The rest of the code is split up between "main.tscn" and "global.gd" and the child nodes. bowl.gd and chopstick.gd contain code for their respective nodes.
