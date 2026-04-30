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
                card.style.cursor = 'pointer';

                // crear imagen con la url de la manga
                const img = document.createElement("img");
                img.src = stand.imagen_manga || "";
                img.alt = stand.nombre || "Imagen no disponible";

                const titulo = document.createElement("h3");
                titulo.textContent = stand.nombre;

                // añadir imagen y título a la carta
                card.appendChild(img);
                card.appendChild(titulo);

                // click para ir a la página de detalles
                card.addEventListener('click', () => {
                    window.location.href = `stand.html?id=${stand.id}`;
                });

                // añadir la carta al contenedor principal
                principal.appendChild(card);
            });
        })
        .catch(error => console.error("Error al cargar los stands:", error));
}

function cargarDetallesStand(id) {
    fetch(ENDPOINT_STANDS)
        .then(res => res.json())
        .then(datos => {
            const container = document.getElementById("stand-details-container");
            if (!container) return;

            // encontrar el stand por su id
            const stand = datos.find(s => s.id == id);

            if (!stand) {
                container.innerHTML = "<h2>Stand no encontrado</h2>";
                return;
            }

            container.innerHTML = '';

            const layoutDiv = document.createElement("div");
            layoutDiv.className = "stand-detalles-layout";

            const imgWrapper = document.createElement("div");
            imgWrapper.className = "stand-imagen-wrapper";

            const img = document.createElement("img");
            img.src = stand.imagen_manga || "";
            img.alt = stand.nombre || "Imagen no disponible";

            imgWrapper.appendChild(img);

            const infoWrapper = document.createElement("div");
            infoWrapper.className = "stand-info-wrapper";

            const titulo = document.createElement("h2");
            titulo.textContent = stand.nombre;

            const desc = document.createElement("p");
            desc.className = "desc";
            desc.textContent = stand.descripcion || "Descripción no disponible.";

            const statsGrid = document.createElement("div");
            statsGrid.className = "stats-grid";

            const crearStatBox = (etiqueta, valor) => {
                const box = document.createElement("div");
                box.className = "stat-box";

                const label = document.createElement("span");
                label.className = "stat-label";
                label.textContent = etiqueta;

                const val = document.createElement("span");
                val.className = "stat-value";
                val.textContent = valor || "?";

                box.appendChild(label);
                box.appendChild(val);
                return box;
            };

            statsGrid.appendChild(crearStatBox("Poder", stand.poder));
            statsGrid.appendChild(crearStatBox("Velocidad", stand.velocidad));
            statsGrid.appendChild(crearStatBox("Alcance", stand.alcance));
            statsGrid.appendChild(crearStatBox("Durabilidad", stand.durabilidad));
            statsGrid.appendChild(crearStatBox("Precisión", stand.precis));
            statsGrid.appendChild(crearStatBox("Potencial", stand.potencial));

            infoWrapper.appendChild(titulo);
            infoWrapper.appendChild(desc);
            infoWrapper.appendChild(statsGrid);
            layoutDiv.appendChild(imgWrapper);
            layoutDiv.appendChild(infoWrapper);
            container.appendChild(layoutDiv);
        })
        .catch(error => {
            console.error("Error al cargar detalles del stand:", error);
            const container = document.getElementById("stand-details-container");
            if (container) container.innerHTML = "<h2>Error al cargar la información del stand</h2>";
        });
}

// inicialización
const urlParams = new URLSearchParams(window.location.search);
const standId = urlParams.get('id');

if (standId) {
    // si estamos en stand.html y hay un ID
    cargarDetallesStand(standId);
} else {
    // si estamos en index.html cargar todos los stands
    const principal = document.getElementById("principal-container");
    if (principal) {
        cargarStands();
    }
}