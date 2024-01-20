
# SkyCast

SkyCast is a user-friendly weather application designed to provide you with up-to-date weather information for any location. With a clean and intuitive interface, you can effortlessly retrieve essential weather details, including temperature, sky conditions, humidity, and wind speed.

### Key Features:
* **Real-Time Weather Data**: Our app utilizes an open-source weather API to fetch the latest information, ensuring that you receive accurate and current weather updates.

* **Dynamic Backgrounds**: Enjoy a visually appealing experience with background images that change every time you refresh the app, enhancing the overall aesthetics.

* **Manual Location Input**: Simply input the city name of your desired location, and our app will fetch and display the corresponding weather details promptly.

Whether you're planning a trip, checking the daily forecast, or simply curious about the current weather conditions, SkyCast has you covered. Stay informed, stay prepared, and make the most of every day with our reliable weather app.

## Acknowledgements

 - [Open Weather API](https://openweathermap.org/api)
 - [UnSplash](https://unsplash.com)



## API Reference

### Get Weather Information

#### Endpoint

```http
  GET https://api.openweathermap.org/data/2.5/weather?q=${cityName}&units=metric&appid=${yourApiKey}
```

| Parameter | Type     | Description                |
| :-------- | :------- | :------------------------- |
| `q` | `string` | **Required**. city name to query |
| `unit` | `string` | Unit of measurement for temperature. Use **metric's** for Celsius. |
| `appid` | `string` | **Required**. Your OpenWeatherMap API key |

#### Example

```http
  GET https://api.openweathermap.org/data/2.5/weather?q=London&units=metric&appid=yourApiKey
```
Replace **${yourApiKey}** with your actual OpenWeatherMap API key when making requests to the API.


## Authors

- [@aditiSingh](https://github.com/AditiSingh2003)


## Deployment

To deploy and run SkyCast, follow these steps:

1. **Clone the Repository:**
   ```bash
   git clone [repository_url]
   cd [project_directory]
   ```

2. **Get all Dependencies:**
    ```bash
    flutter pub get
    ```

3. **Create the .env File:**
Create a file named **.env** in the root of your project and add the following environment variables:

```bash
API_KEY = 'your_openweathermap_api_key';
```


4. **Run App on Local System:**
    ```bash
    flutter run
    ```
# Preview of App

<!-- Image 1 with height and width -->
<img src="https://github.com/AditiSingh2003/SkyCast-App/assets/97729662/ce2e5491-9188-400b-b835-6bec87b1d857.png" alt="Image 1" width="300" height="600">

<!-- Image 2 with height and width -->
<img src="https://github.com/AditiSingh2003/SkyCast-App/assets/97729662/b5d9b958-8fa7-450b-94de-5fd388f99efc.png" alt="Image 2" width="300" height="600">

# Video Demo





### Note
Replace **your_openweathermap_api_key** with your actual API keys obtained from the respective services.
## Feedback

If you have any feedback, please reach out to us at adithakurti@gmail.com

