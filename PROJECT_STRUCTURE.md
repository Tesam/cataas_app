# Cat Factory Structure

Cat Factory is an application that communicates with the [Cat as a Service API](https://cataas.com/#/)
API to display random images with the selected filters and the chosen text.

Available filters are: Mono, Sepia, Negative, Blur and Paint.

The text can contain up to 50 characters.

## Packages
It uses the http package for API connection handling. In addition, the flutter_launcher_icons package was used to generate the launcher with a selected image.

## State manager
States are handled through Stateful Widgets.

## Dependency Injection
Dependency injection is done through the Inherited Widget.

## Folder structure
lib
|__core
|  |__params //classes with the request body params of the endpoints
|__data
|  |__constants //constants to use in obtaining data
|  |__datasources
|  |  |__remote //API connection services
|  |__repositories //implementations of the Domain repository interfaces
|__domain
|  |__repositories //repository interfaces
|  |__use_cases //use cases with business logic
|__presenter
|  |__constants //constants to use in screens and widgets (colors, enums, ...)
|  |__screens //app screens
|  |__utils //helper classes
|  |__widgets //common widgets that are used across screens
|__injector_widget.dart
|__main.dart
