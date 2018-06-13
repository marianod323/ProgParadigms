package sample;

import javafx.scene.paint.Color;
import javafx.scene.shape.Circle;

public class Vertice {
  private double x;
  private double y;
  private double radius;
  private Color fillColor;
  private Color strokeColor;

  public Vertice (double x, double y, double radius, Color fillColor, Color strokeColor){
    this.x = x;
    this.y = y;
    this.radius = radius;
    this.fillColor = fillColor;
    this.strokeColor = strokeColor;
  }

  public Circle criaCircle(){
    Circle circle = new Circle(x, y, radius, fillColor);
    circle.setStroke(strokeColor);
    circle.setStrokeWidth(3.0);
    return circle;
  }

  public void setX(double x) {
    this.x = x;
  }

  public void setY(double y) {
    this.y = y;
  }

  public double getX() {
    return x;
  }

  public double getY() {
    return y;
  }
}