## ✨Highlight

- 
## 🏠 Life

- 
## 💼 Work 

- 
## 📖 Study 

- 

## 🐾 Footer 
-----
<%*
const date = tp.file.title;

// left and right error 
let yesterday =  moment(tp.file.title, 'YYYY-MM-DD-dddd').subtract(1, 'd');
let tomorrow = moment(tp.file.title, 'YYYY-MM-DD-dddd').add(1, 'd')
let leftArrow = `[[Journals/${yesterday.format('YYYY')}/${yesterday.format('YYYY')}-W${yesterday.format('ww')}/${yesterday.format('YYYY-MM-DD')}|<<]]`;
let rightArrow = `[[Journals/${tomorrow.format('YYYY')}/${tomorrow.format('YYYY')}-W${tomorrow.format('ww')}/${tomorrow.format('YYYY-MM-DD')}|>>]]`;

// get weather 
const latitude = "32.7157"; // Latitude for ZIP code 92130
const longitude = "-117.1647"; // Longitude for ZIP code 92130

const apiUrl = `https://api.open-meteo.com/v1/forecast?latitude=${latitude}&longitude=${longitude}&daily=temperature_2m_max,temperature_2m_min,weather_code&timezone=America%2FLos_Angeles&start_date=${date}&end_date=${date}`;

try {
  const weather = await requestUrl(apiUrl);
  const response = await weather.json;

  let weatherEmoji = "❓"; // Default
  let temperature = "N/A"; // Default

  if (response && response.daily) {
    const highTemp = response.daily.temperature_2m_max[0];
    const lowTemp = response.daily.temperature_2m_min[0];
    const weatherCode = response.daily.weather_code[0];

    // Define weather emojis based on weather codes
    const weatherEmojis = {
      0: "☀️",  1: "🌤️",  2: "⛅",  3: "☁️",  45: "🌫️",  48: "🌫️",  51: "🌦️",  53: "🌦️",  55: "🌧️",
      56: "🌨️", 57: "🌨️", 61: "🌧️", 63: "🌧️", 65: "🌧️", 66: "🌨️", 67: "🌨️", 71: "🌨️",
      73: "🌨️", 75: "❄️", 77: "❄️", 80: "🌦️", 81: "🌧️", 82: "🌧️", 85: "🌨️", 86: "❄️",
      95: "⛈️", 96: "⛈️", 99: "⛈️"
    };

    weatherEmoji = weatherEmojis[weatherCode] || "❓"; // Use question mark emoji for unknown conditions
    temperature = `${lowTemp}~${highTemp}`;
    
  } else {
    weatherEmoji = "❌";
    temperature = "❌";
  }
  
  let weatherDescription = `${weatherEmoji},${temperature}`;

  tR += `${leftArrow} ${moment(tp.file.title, 'YYYY-MM-DD-dddd').format('ddd')},${weatherDescription}°C ${rightArrow}`;

} catch (error) {
  tR += `Error fetching weather data: ${error}`;
}
%>

