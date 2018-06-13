package sample;

import javafx.scene.shape.Line;

public class Aresta {
  private Vertice inicio;
  private Vertice fim;

  public Aresta (Vertice inicio, Vertice fim){
    this.inicio = inicio;
    this.fim = fim;
  }

  public Line criaLinha (){
    Line line = new Line(inicio.getX(), inicio.getY(), fim.getX(), fim.getY());
    line.setStrokeWidth(3.0);
    return line;
  }


}
