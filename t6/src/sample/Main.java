package sample;

import javafx.application.Application;
import javafx.geometry.Insets;
import javafx.geometry.Pos;
import javafx.scene.Scene;
import javafx.scene.layout.*;
import javafx.scene.paint.Color;
import javafx.stage.Stage;

public class Main extends Application {

    @Override public void start(Stage stage) throws Exception{
        StackPane menuPane = new StackPane();
        BorderPane mainPane = new BorderPane();
        Pane drawPane = new Pane();
        VBox menu = new VBox();
        Grafo grafo = new Grafo(drawPane);
        stage.setScene(new Scene(mainPane, 800, 600));

        menu.setSpacing(10.0);
        menu.setBackground(new Background(new BackgroundFill(Color.LIGHTGRAY, CornerRadii.EMPTY, Insets.EMPTY )));

        menuPane.getChildren().add(menu);
        menu.setAlignment(Pos.TOP_LEFT);


        mainPane.setCenter(drawPane);
        mainPane.setLeft(menuPane);
        grafo.criaGrafo(10);

        stage.show();
    }


    public static void main(String[] args) {
        launch(args);
    }
}
