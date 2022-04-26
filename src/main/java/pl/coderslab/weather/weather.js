const address = 'https://fcc-weather-api.glitch.me/api/current?lat=50.892487&lon=16.699516'


function showConditions() {
    fetch(address).then(resp => resp.json()).then(data => {
        document.querySelector('#main').innerText = data[0].main;
        document.querySelector('#wind').innerText = wind.speed;
        document.querySelector('#description').innerText = data[0].description;
        document.querySelector('#icon').src = weather[0].icon;
    })
}

showConditions();




// Konstrukcja adresu
// (this to formularz, bo robimy to w zdarzeniu submit):
// 'https://api.punkapi.com/v2/beers?food=' + this.elements.food_name.value
// document.getElementById('food_form').addEventListener('submit', function(event) {
//     event.preventDefault();
//
// //     fetch('https://api.punkapi.com/v2/beers?food=' + this.elements.food_name.value).then(resp => resp.json()).then(data => {
// //         const beer_list = document.querySelector('ul#beer_list');
// // //na początku zerujemy listę pod spodem:
// //         Array.from(beer_list.children).forEach(li => li.remove());
// // //
// // //         data.forEach(function(beer) {
// // //             const li = document.createElement('li');
// // //             li.innerText = beer.name + ' - ' + beer.tagline;
// // //             beer_list.appendChild(li);
// // // //klikamy w nazwe piwka pod spodem i zmienia nam sie na to piwko
// // //             li.addEventListener('click', function() {
// // //                 showBeer(beer.id);
// // //             })
// // //         })
// //
// //     })
//
//
// })