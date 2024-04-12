import 'dart:io';

// Interface definition
abstract class Shape {
  double area();
}

// Base class
class Rectangle implements Shape {
  double width;
  double height;

  Rectangle(this.width, this.height);

  @override
  double area() {
    return width * height;
  }
}

// Subclass that overrides a method
class Square extends Rectangle {
  Square(double side) : super(side, side);

  @override
  double area() {
    return width * width;
  }
}

// Method to read data from a file and create objects
List<Shape> readShapesFromFile(String filePath) {
  List<Shape> shapes = [];
  File file = File(filePath);

  try {
    List<String> lines = file.readAsLinesSync();
    for (var line in lines) {
      List<String> parts = line.split(',');
      if (parts.length == 2) {
        double width = double.parse(parts[0]);
        double height = double.parse(parts[1]);
        shapes.add(Rectangle(width, height));
      }
    }
  } catch (e) {
    print("Error reading file: $e");
  }

  return shapes;
}

// Method demonstrating the use of a loop
void printAreas(List<Shape> shapes) {
  for (var shape in shapes) {
    print("Area: ${shape.area()}");
  }
}

void main() {
  // Read shapes from file and create objects
  List<Shape> shapes = readShapesFromFile('shapes.txt');

  // Print areas of the shapes
  printAreas(shapes);
}
