# Weather_app_flutter_monstarlab

Weather App is a mobile application that allows users to look up current weather information and forecast for different locations.

## Feature
Display current weather information: The app shows the current temperature, humidity, wind speed, pressure, and a brief description of the weather conditions for the selected location.

Daily weather forecast

Hourly weather forecast

Detail AQI Index

Search by location name

Unit conversion

## Architecture and Technology
### Clean Architecture:
The app follows a modular and layered architecture, separating the presentation layer, domain layer, and data layer. This promotes code reusability, testability, and scalability.

### REST API Integration
The app integrates with the Weatherbit API to retrieve weather data. It utilizes tools like Postman for API testing and verification. Retrofit and Dio libraries are used to handle API requests and responses efficiently.

### Local Storage
Weather App utilizes different local storage solutions to store and retrieve data. Shared Preferences is used to manage key-value pairs, while SQLite is employed to store the list of saved cities. These local storage solutions enable persistent data storage and quick access.

### State Management: 
The app utilizes the Riverpod library to manage application state effectively. The MVVM (Model-View-ViewModel) architectural pattern is adopted to separate the presentation logic from the UI, providing a clear and maintainable code structure. Freezed is used for immutability and code generation.

### User Interface:
The app employs various UI components and techniques to enhance the user experience.
## Screenshot
![Screenshot_20230530_145517](https://github.com/letanssang/weather_app_flutter_monstarlab/assets/67082439/cd72b6e4-d483-44e8-b1c7-9bc83e28d91a)
![Screenshot_20230530_145610](https://github.com/letanssang/weather_app_flutter_monstarlab/assets/67082439/211ae5ef-8ec9-4c7d-8de1-459010a8f98a)
![Screenshot_20230530_145600](https://github.com/letanssang/weather_app_flutter_monstarlab/assets/67082439/a5e41ce0-f245-489f-97a4-0327bcbdc6e7)
![Screenshot_20230530_145621](https://github.com/letanssang/weather_app_flutter_monstarlab/assets/67082439/203cecb9-4a58-4afa-a048-64b67dea7710)
![Screenshot_20230530_145629](https://github.com/letanssang/weather_app_flutter_monstarlab/assets/67082439/04cf932b-37d3-405f-8e62-58514979e189)
![Screenshot_20230530_150602](https://github.com/letanssang/weather_app_flutter_monstarlab/assets/67082439/77376a81-2272-4027-8ab3-09710f23d7b0)
# weather_app_flutter_monstarlab
