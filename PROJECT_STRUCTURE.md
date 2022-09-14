# Cat Factory Structure

Cat Factory is an application that communicates with the [Cat as a Service API](https://cataas.com/#/)
to display random cats gif.

## Packages
It uses the [http package](https://pub.dev/packages/http) for API connection handling. 

The [flutter_launcher_icons package](https://pub.dev/packages/flutter_launcher_icons) was used to generate the launcher with a selected image.

Finally, [flutter_svg package](https://pub.dev/packages/flutter_svg) for manage svg files.

## State manager
States are handled through Stateless widgets in conjunction with Notifier classes (that extends ChangeNotifier) and AnimatedBuilder widget.

## Dependency Injection
Dependency injection is done through the Inherited Widget.

## Folder structure
```
lib
|__data
|  |__constants //constants to use in obtaining data
|  |__datasources
|  |  |__remote //API connection services, contracts, and http client
|  |__repositories //implementations of the Domain repository interfaces
|__domain
|  |__repositories //repository interfaces
|  |__use_cases //use cases with business logic
|__presenter
|  |__constants //constants to use in screens and widgets (colors, enums, ...)
|  |__screens //app screens
|  |__utils //helper classes
|  |__widgets //common widgets that are used across screens
|__injector_widget.dart //dependency injection
|__main.dart
```
