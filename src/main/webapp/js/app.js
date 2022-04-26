const userLat = 50.891079;
const userLon=16.7013


function showWeather() {
    const address = 'https://fcc-weather-api.glitch.me/api/current?lat='+userLat+'&lon='+userLon;
    fetch(address).then(resp => resp.json()).then(data => {
        const lon = document.querySelector('#lon');
        const lat = document.querySelector('#lat');
        const temp = document.querySelector('#temp');
        const windSpeed = document.querySelector('#windSpeed');
const img=document.querySelector('#img');

        lon.innerText = data.coord.lon;
        lat.innerText = data.coord.lat;
        temp.innerText = data.main.temp;
        windSpeed.innerText =data.wind.speed;
        img.src=data.weather[0].icon;

    })
}

showWeather();


// Konstrukcja adresu
// (this to formularz, bo robimy to w zdarzeniu submit):
// 'https://api.punkapi.com/v2/beers?food=' + this.elements.food_name.value


// let a = 1;
// const url = 'https://api.punkapi.com/v2/beers/' + a;
//
//
// fetch(url).then(resp => resp.json()).then(data => {
//     const beer = data[0];
//
//     const name = document.querySelector('#name');
//     console.log(name);
//     const tagline = document.querySelector('#tagline');
//     const description = document.querySelector('#description');
//     const imageUrl = document.querySelector('#image_url');
//
//
//     name.innerText = beer.name;
//     tagline.innerText = beer.tagline;
//     description.innerText = beer.description;
//     imageUrl.src = "https://images.punkapi.com/v2/keg.png";
//
//
// });
//
// const buttPrev = document.querySelector("#prev");
// const buttNext = document.querySelector("#next");
//
//     let counter = 1;
//     buttPrev.addEventListener('click', function (buttPrev) {
//         if (counter == 0) {
//             return;
//         }
//         counter--;
//         console.log(counter);
//         const url = 'https://api.punkapi.com/v2/beers/' + counter;
//
//         fetch(url).then(resp => resp.json()).then(data => {
//             const beer = data[0];
//
//             const name = document.querySelector('#name');
//             console.log(name);
//             const tagline = document.querySelector('#tagline');
//             const description = document.querySelector('#description');
//             const imageUrl = document.querySelector('#image_url');
//
//
//             name.innerText = beer.name;
//             tagline.innerText = beer.tagline;
//             description.innerText = beer.description;
//             imageUrl.src = beer.image_url;
//
//
//         });
//
//     });
//
//     buttNext.addEventListener('click', function (event) {
//         event.preventDefault();
//         counter++;
//         console.log(counter)
//         const url = 'https://api.punkapi.com/v2/beers/' + counter;
//         fetch(url).then(resp => resp.json()).then(data => {
//             const beer = data[0];
//
//             const name = document.querySelector('#name');
//             console.log(name);
//             const tagline = document.querySelector('#tagline');
//             const description = document.querySelector('#description');
//             const imageUrl = document.querySelector('#image_url');
//
//
//             name.innerText = beer.name;
//             tagline.innerText = beer.tagline;
//             description.innerText = beer.description;
//             imageUrl.src = beer.image_url;
//
//         });
//
//     });