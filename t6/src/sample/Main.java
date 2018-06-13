package sample;

import javafx.application.Application;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.geometry.Pos;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.ComboBox;
import javafx.scene.control.Label;
import javafx.scene.layout.*;
import javafx.scene.text.Font;
import javafx.stage.Stage;

import java.util.ArrayList;

public class Main extends Application {

    private boolean iniciarJogo = false;
    private int qntVertices = 8;

    @Override public void start(Stage stage) throws Exception{
        BorderPane mainPane = new BorderPane();
        Pane drawPane = new Pane();
        VBox menu = new VBox();
        Grafo grafo = new Grafo(drawPane);
        stage.setScene(new Scene(mainPane, 800, 600));
        Label nomeJogo = new Label("Planarity Puzzle");
        nomeJogo.setFont(new Font(60));
        ComboBox difPick = new ComboBox();
        Button jogarBt = new Button("Jogar");

        ArrayList<String> dificuldades = new ArrayList<String>();
        dificuldades.add("Fácil - 8 vértices");
        dificuldades.add("Médio - 17 vértices");
        dificuldades.add("Difícil - 29 vértices");
        difPick.getItems().addAll(dificuldades);

        difPick.setValue(dificuldades.get(0));

        difPick.valueProperty().addListener((observable, oldValue, newValue) -> {
          if (difPick.getValue() == dificuldades.get(0)){
            qntVertices = 8;
          }
          else if (difPick.getValue() == dificuldades.get(1)){
            qntVertices = 17;
          }
          else if (difPick.getValue() == dificuldades.get(2)){
            qntVertices = 29;
          }
        });

        menu.getChildren().addAll(nomeJogo, difPick, jogarBt);
        menu.setSpacing(20.0);
        menu.setAlignment(Pos.CENTER);
        mainPane.setCenter(menu);

        jogarBt.setOnAction(new EventHandler<ActionEvent>() {
          @Override
          public void handle(ActionEvent event) {
            mainPane.getChildren().clear();
            mainPane.setCenter(drawPane);
            grafo.criaGrafo(qntVertices);
          }
        });

        stage.show();
    }


    public static void main(String[] args) {
        launch(args);
    }
}
