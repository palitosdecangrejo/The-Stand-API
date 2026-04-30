const ENDPOINT_STANDS = "http://localhost:3000/stand";

const ENDPOINT_USUARIOS = "http://localhost:3000/portador";

function cargarStands() {
    fetch(ENDPOINT_STANDS)
        .then(res => res.json())
        .then(datos => {
            const principal = document.getElementById("principal-container");

            // limpiar contenedor por si acaso de antes tiene algo
            if (principal) {
                principal.innerHTML = '';
            } else {
                console.error("No se encontró el contenedor principal");
                return;
            }

            datos.forEach(stand => {
                // crear div carta con id para identificarlo
                const card = document.createElement("div");
                card.className = "card-stand";
                card.id = `card-stand-${stand.id}`;

                // crear imagen con la url de la manga
                const img = document.createElement("img");
                img.src = stand.imagen_manga || "";
                img.alt = stand.nombre || "Imagen no disponible";

                const titulo = document.createElement("h3");
                titulo.textContent = stand.nombre;

                // añadir imagen y título a la carta
                card.appendChild(img);
                card.appendChild(titulo);

                // añadir la carta al contenedor principal
                principal.appendChild(card);
            });
        })
        .catch(error => console.error("Error al cargar los stands:", error));
}

cargarStands();