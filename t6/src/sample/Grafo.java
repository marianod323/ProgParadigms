package sample;

import javafx.event.EventHandler;
import javafx.scene.Node;
import javafx.scene.input.MouseEvent;
import javafx.scene.layout.Pane;
import javafx.scene.paint.Color;
import javafx.scene.shape.Circle;
import javafx.scene.shape.Line;

import java.util.ArrayList;

public class Grafo{
  private EventHandler<MouseEvent> iniciaClick, saiClick, moveAresta;
  private ArrayList<Vertice> listVertice;
  private ArrayList<Aresta> listAresta;
  private Pane pane;

  public Grafo (Pane pane){
    this.pane = pane;
    this.listVertice = new ArrayList<Vertice>();
    this.listAresta = new ArrayList<Aresta>();

    iniciaClick = new EventHandler<MouseEvent>() {
      @Override
      public void handle(MouseEvent event) {
        double x = event.getX();
        double y = event.getY();
        Circle c = (Circle) event.getSource();

        for(Node n : pane.getChildren()) {
          if(n instanceof Line) {
            Line l = (Line) n;

            if(l.getStartX() == c.getCenterX() && l.getStartY() == c.getCenterY()) {
              l.setStartX(event.getX());
              l.setStartY(event.getY());
            }
            else if(l.getEndX() == c.getCenterX() && l.getEndY() == c.getCenterY()) {
              l.setEndX(event.getX());
              l.setEndY(event.getY());
            }
          }
        }

        c.setCenterX(x);
        c.setCenterY(y);
      }
    };

    saiClick = new EventHandler<MouseEvent>() {
      @Override
      public void handle(MouseEvent event) {

      }
    };
  }

  public void addVertice (Vertice novo){
    listVertice.add(novo);
  }

  public void addAresta (Aresta nova){
    listAresta.add(nova);
  }

  public int quantVertices (){
    return listVertice.size();
  }

  public void criaGrafo (int qntVertice) {
    int raio = 15;
    for (int i = 0; i < qntVertice; i++){
      double x = raio + Math.random() * 750;
      double y = raio + Math.random() * 550;
      Vertice novo = new Vertice(x, y, raio, Color.GRAY, Color.BLACK);
      this.addVertice(novo);
    }
    for (int i = 0; i < qntVertice; i++){
      if (i%2 == 0) {
        Aresta nova2 = new Aresta(listVertice.get(i), listVertice.get((i+2)%qntVertice));
        this.addAresta(nova2);
      }
      Aresta nova1 = new Aresta(listVertice.get(i), listVertice.get((i+1)%qntVertice));
      this.addAresta(nova1);
    }

    for (Aresta aresta:listAresta) {
      Line line = aresta.criaLinha();
      pane.getChildren().add(line);
    }

    for (Vertice vertice:listVertice) {
      Circle circle = vertice.criaCircle();
      circle.setOnMouseDragged(iniciaClick);
      circle.setOnMouseExited(saiClick);

      circle.centerXProperty().addListener((observable, oldValue, newValue) ->
      {
        vertice.setX((double) newValue);
      });
      circle.centerYProperty().addListener((observable, oldValue, newValue) ->
      {
        vertice.setY((double) newValue);
      });

      pane.getChildren().add(circle);
    }
  }

}
