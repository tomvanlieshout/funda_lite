# funda_lite

A technical assignment to build a housing advertisment page.

## How to run

Inside `lib/api/gateway.dart`, change line 7 to have a valid API key. Otherwise, the app will show error messages. Then run the app with the following command:

```flutter run```

## Architecture

The project follows the following architecture flow, back-to-front:
* Gateway - this class takes care of HTTP requests and responses, either returning the body of the response, or throwing a GatewayError
* Service - this class invokes the Gateway and parses the response-bodies from either Maps (JSON) or XmlDocuments, to the model classes (House and HouseDetails). It validates the response.statusCode, and in case it is outside the 200-range, throws a FundaError.
* Bloc - the state management solution. The Bloc is injected in the tree above the Widgets that need the Bloc. The Bloc takes in Events (e.g. a search query), performs the business logic (invoking the Service) and outputs State. In case of a FundaError thrown by the Service, it emits ErrorStates.
* UI - the UI that the user interacts with. The UI uses a BlocBuilder to listen to changes in state and update the UI accordingly.

## Tests

The project contains three tests:
### details_bloc_test.dart
This unit test tests the `DetailsBloc`. The Bloc depends on the `Service`, which is mocked with mockito. The `@GenerateMocks`-annotation generates a ...test.mocks.dart-file. With `when()`-methods from the mockito package, the output of the `MockService` is controlled.

The test is to verify whether the bloc outputs the correct state given either a data-object or an error-object.

### favorites_test.dart
This integration test tests the `FavoritesPage`. It pumps the widget, together with an instance of `FavoritesBloc`. Adding favorited `HouseCards` is done within the `OverviewPage`, which is not part of this test. Hence the adding is done directly to the bloc.

Removing is done by finding the `HeartIcon` (a button) and tapping it. Afterwards, the amount of visible cards is verified.

### debouncer_test.dart
This unit test tests the `Debouncer`-class. This class is to prevent the search-endpoint from being called too often. It "debounces" user input until their is no input registered for some time (set to 400ms).

### Running the tests
Running all the tests can be done with the following command:
```flutter test```

## Demo

Watch the clip below to see the app in action!

https://github.com/tomvanlieshout/funda_lite/assets/39647023/254e400a-4ca9-49ac-a045-c11c9524e6f9
