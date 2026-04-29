const ENDPOINT_STANDS = "http://localhost:3000/stand";

const ENDPOINT_USUARIOS = "http://localhost:3000/portador";

const card1 = document.getElementById("card-stand-1");
const card2 = document.getElementById("card-stand-2");
const card3 = document.getElementById("card-stand-3");
const card4 = document.getElementById("card-stand-4");
const card5 = document.getElementById("card-stand-5");
const card6 = document.getElementById("card-stand-6");
const card7 = document.getElementById("card-stand-7");
const card8 = document.getElementById("card-stand-8");
const card9 = document.getElementById("card-stand-9");
const card10 = document.getElementById("card-stand-10");
const card11 = document.getElementById("card-stand-11");
const card12 = document.getElementById("card-stand-12");

function cargarStand(card, id) {
    fetch(ENDPOINT_STANDS)
        .then(res => res.json())
        .then(datos => {
            const stand = datos.find(s => s.id === id);

            const img = card.querySelector("img");
            const titulo = card.querySelector("h3");

            img.src = stand.imagen_manga;
            img.alt = stand.nombre;
            titulo.textContent = stand.nombre;
        });
}

function cargarStands() {
    cargarStand(card1, 1);
    cargarStand(card2, 2);
    cargarStand(card3, 3);
    cargarStand(card4, 4);
    cargarStand(card5, 5);
    cargarStand(card6, 6);
    cargarStand(card7, 7);
    cargarStand(card8, 8);
    cargarStand(card9, 9);
    cargarStand(card10, 10);
    cargarStand(card11, 11);
    cargarStand(card12, 12);
}

cargarStands();