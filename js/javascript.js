const stand1 = document.getElementById("stand-1");
const stand2 = document.getElementById("stand-2");
const stand3 = document.getElementById("stand-3");
const stand4 = document.getElementById("stand-4");
const stand5 = document.getElementById("stand-5");

const ENDPOINTS_STANDS = [
    "TU_ENDPOINT_STAND_1",
    "TU_ENDPOINT_STAND_2",
    "TU_ENDPOINT_STAND_3",
    "TU_ENDPOINT_STAND_4",
    "TU_ENDPOINT_STAND_5"
];

function cargarStands() {

    ENDPOINTS_STANDS.forEach(function(endpoint, indice) {

        fetch(endpoint)

            .then(function(respuesta) {
                return respuesta.json();
            })

            .then(function(datos) {

                let card = document.getElementById("stand-" + (indice + 1));

                if (card) {
                    card.innerHTML = `
                        <img src="${datos.imagen}" alt="${datos.nombre}">
                        <h3>${datos.nombre}</h3>
                    `;
                }

            });
    });
}

cargarStands();