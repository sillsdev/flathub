#!/bin/bash
# Dictionary App Builder
# App build and launch wrapper
# echo "Running dictionary-app-builder in:"
# echo $( pwd )
# echo $( /app/jre/bin/java -version )
# echo $( /app/jdk17.0.11/bin/javac -version )
# echo " "
# echo "$@"
# echo " "
exec /app/jre/bin/java --module-path "/app/lib/sdk" --add-modules javafx.web,javafx.fxml,javafx.swing,javafx.media --add-opens=javafx.fxml/javafx.fxml=ALL-UNNAMED -jar /app/dictionary-app-builder/bin/dictionary-app-builder.jar $@