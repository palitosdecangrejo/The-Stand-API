const ENDPOINT_STANDS = "http://localhost:3000/stand";
const ENDPOINT_PORTADORES = "http://localhost:3000/portador";
const ENDPOINT_BUSQUEDA = "http://localhost:3000/buscar/stand?q=";
const ENDPOINT_STAND_PORTADOR_EVOLUCION = "http://localhost:3000/stand/portador/evolucion";

let todosLosStands = [];

function cargarStands() {
    fetch(ENDPOINT_STANDS)
        .then(res => res.json())
        .then(datos => {
            todosLosStands = datos;
            mostrarStands(datos);
        })
        .catch(error => console.error("Error al cargar los stands:", error));
}

function mostrarStands(datos) {
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
            const isRoot = !window.location.pathname.includes('/pages/');
            window.location.href = isRoot ? `pages/stand.html?id=${stand.id}` : `stand.html?id=${stand.id}`;
        });

        // añadir la carta al contenedor principal
        principal.appendChild(card);
    });
}


function cargarDetallesStand(id) {
    fetch(ENDPOINT_STAND_PORTADOR_EVOLUCION)
        .then(res => res.json())
        .then(datos => {
            const container = document.getElementById("stand-details-container");
            if (!container) return;

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
            img.src = stand.imagen_manga || stand.imagen_anime || "";
            img.alt = stand.nombre || "Imagen no disponible";

            // alternar imagen
            const divBotonesImg = document.createElement("div");
            divBotonesImg.className = "contenedor-botones-imagen";

            const btnManga = document.createElement("button");
            btnManga.textContent = "Manga";
            btnManga.className = "btn-alternar-imagen";
            btnManga.onclick = () => { img.src = stand.imagen_manga || ""; };

            const btnAnime = document.createElement("button");
            btnAnime.textContent = "Anime";
            btnAnime.className = "btn-alternar-imagen";
            btnAnime.onclick = () => {
                if (stand.imagen_anime) {
                    img.src = stand.imagen_anime;
                } else {
                    alert("No hay imagen de anime para este stand.");
                }
            };

            divBotonesImg.appendChild(btnManga);
            divBotonesImg.appendChild(btnAnime);

            imgWrapper.appendChild(divBotonesImg);
            imgWrapper.appendChild(img);

            // botón borrar
            let btnBorrar = document.createElement("button");
            btnBorrar.textContent = "Borrar Stand";
            btnBorrar.className = "btn-borrar";

            btnBorrar.addEventListener("click", function () {

                let urlBorrar = "http://localhost:3000/stand/" + stand.id;

                fetch(urlBorrar, {
                    method: "DELETE"
                });

                alert("Stand eliminado");

                if (window.location.pathname.includes("/pages/")) {
                    window.location.href = "../index.html";
                } else {
                    window.location.href = "index.html";
                }
            });

            imgWrapper.appendChild(btnBorrar);

            const infoWrapper = document.createElement("div");
            infoWrapper.className = "stand-info-wrapper";

            const titulo = document.createElement("h2");
            titulo.textContent = stand.nombre;

            const desc = document.createElement("p");
            desc.className = "desc";
            desc.textContent = stand.descripcion || "Descripción no disponible.";

            const aparicion = document.createElement("p");
            aparicion.className = "desc";
            aparicion.textContent = "Aparición: " + (stand.aparicion || "Desconocida");

            // portadores
            const portador = document.createElement("p");
            portador.className = "desc";
            portador.textContent = "Portador/es: ";

            if (stand.portadores) {

                let listaPortadores = stand.portadores.split(", ");

                listaPortadores.forEach(function (item, index) {

                    let partesPortador = item.split(":");

                    let idPortador = partesPortador[0];
                    let nombrePortador = partesPortador[1];

                    let enlace = document.createElement("span");

                    enlace.textContent = nombrePortador;
                    enlace.style.cursor = "pointer";
                    enlace.style.textDecoration = "underline";

                    enlace.addEventListener("click", function () {
                        cargarDetallesPortador(idPortador);
                    });

                    portador.appendChild(enlace);

                    if (index < listaPortadores.length - 1) {
                        portador.appendChild(document.createTextNode(", "));
                    }
                });

            } else {

                portador.appendChild(document.createTextNode("Sin portador"));
            }

            // evolución
            const evolucion = document.createElement("p");
            evolucion.className = "desc";
            evolucion.textContent = "Evolución: ";

            if (stand.evolucion) {

                let enlaceEvolucion = document.createElement("span");

                enlaceEvolucion.textContent = stand.evolucion;
                enlaceEvolucion.style.cursor = "pointer";
                enlaceEvolucion.style.textDecoration = "underline";

                enlaceEvolucion.addEventListener("click", function () {
                    cargarDetallesStand(stand.id_evolucion_real);
                });

                evolucion.appendChild(enlaceEvolucion);

            } else {

                evolucion.appendChild(document.createTextNode("Sin evolución"));
            }

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
            infoWrapper.appendChild(aparicion);
            infoWrapper.appendChild(portador);
            infoWrapper.appendChild(evolucion);
            infoWrapper.appendChild(statsGrid);

            layoutDiv.appendChild(imgWrapper);
            layoutDiv.appendChild(infoWrapper);

            container.appendChild(layoutDiv);
        })

        .catch(error => {

            console.error("Error al cargar detalles del stand:", error);

            const container = document.getElementById("stand-details-container");

            if (container) {
                container.innerHTML = "<h2>Error al cargar la información del stand</h2>";
            }
        });
}

function cargarDetallesPortador(id) {
    fetch(ENDPOINT_PORTADORES)
        .then(res => res.json())
        .then(datos => {

            const container = document.getElementById("stand-details-container");

            if (!container) return;

            const portador = datos.find(p => p.id == id);

            if (!portador) {
                container.innerHTML = "<h2>Portador no encontrado</h2>";
                return;
            }

            container.innerHTML = '';

            const layoutDiv = document.createElement("div");
            layoutDiv.className = "stand-detalles-layout";

            const imgWrapper = document.createElement("div");
            imgWrapper.className = "stand-imagen-wrapper";

            const img = document.createElement("img");
            img.src = portador.imagen_manga || portador.imagen_anime || "";
            img.alt = portador.nombre || "Imagen no disponible";

            // alternar imagen
            const divBotonesImg = document.createElement("div");
            divBotonesImg.className = "contenedor-botones-imagen";

            const btnManga = document.createElement("button");
            btnManga.textContent = "Manga";
            btnManga.className = "btn-alternar-imagen";

            btnManga.onclick = () => {
                img.src = portador.imagen_manga || "";
            };

            const btnAnime = document.createElement("button");
            btnAnime.textContent = "Anime";
            btnAnime.className = "btn-alternar-imagen";

            btnAnime.onclick = () => {

                if (portador.imagen_anime) {

                    img.src = portador.imagen_anime;

                } else {

                    alert("No hay imagen de anime para este portador.");
                }
            };

            divBotonesImg.appendChild(btnManga);
            divBotonesImg.appendChild(btnAnime);

            imgWrapper.appendChild(divBotonesImg);
            imgWrapper.appendChild(img);

            const infoWrapper = document.createElement("div");
            infoWrapper.className = "stand-info-wrapper";

            const titulo = document.createElement("h2");
            titulo.textContent = portador.nombre;

            const desc = document.createElement("p");
            desc.className = "desc";
            desc.textContent = portador.descripcion || "Descripción no disponible.";

            const aparicion = document.createElement("p");
            aparicion.className = "desc";
            aparicion.textContent = "Aparición: " + (portador.aparicion || "Desconocida");

            infoWrapper.appendChild(titulo);
            infoWrapper.appendChild(desc);
            infoWrapper.appendChild(aparicion);

            layoutDiv.appendChild(imgWrapper);
            layoutDiv.appendChild(infoWrapper);

            container.appendChild(layoutDiv);

        })

        .catch(error => {

            console.error("Error al cargar detalles del portador:", error);

            const container = document.getElementById("stand-details-container");

            if (container) {

                container.innerHTML = "<h2>Error al cargar la información del portador</h2>";
            }
        });
}

function activarBarraBusqueda() {
    const inputBusqueda = document.getElementById("input-busqueda");
    const resultadosBusqueda = document.getElementById("resultados-busqueda");

    if (inputBusqueda) {
        inputBusqueda.addEventListener("input", function () {
            let texto = inputBusqueda.value.trim();

            if (texto.length > 0) {
                buscarContenido(texto);
            } else {
                if (resultadosBusqueda) {
                    resultadosBusqueda.innerHTML = "";
                    resultadosBusqueda.classList.add("oculto");
                }
            }
        });
    }

    document.addEventListener("click", function (evento) {
        let cajaBusqueda = document.querySelector(".cuadro-busqueda");

        if (cajaBusqueda && !cajaBusqueda.contains(evento.target)) {
            if (resultadosBusqueda) {
                resultadosBusqueda.classList.add("oculto");
            }
        }
    });
}

function buscarContenido(texto) {
    fetch("http://localhost:3000/buscar/stand?q=" + encodeURIComponent(texto))
        .then(function (respuesta) {
            return respuesta.json();
        })
        .then(function (datos) {
            mostrarResultadosBusqueda(datos);
        })
        .catch(function (error) {
            console.log("Error en la búsqueda:", error);
        });
}

function mostrarResultadosBusqueda(resultados) {
    const resultadosBusqueda = document.getElementById("resultados-busqueda");
    if (!resultadosBusqueda) return;

    resultadosBusqueda.innerHTML = "";

    let resultadosValidos = resultados.slice(0, 5);

    if (resultadosValidos.length) {
        resultadosBusqueda.classList.remove("oculto");
    } else {
        resultadosBusqueda.classList.add("oculto");
    }

    resultadosValidos.forEach(function (stand) {
        let div = document.createElement("div");
        div.classList.add("resultado-item");

        div.textContent = stand.nombre;

        div.addEventListener("click", function () {
            const isRoot = !window.location.pathname.includes("/pages/");
            window.location.href = isRoot
                ? "pages/stand.html?id=" + stand.id
                : "stand.html?id=" + stand.id;
        });

        resultadosBusqueda.appendChild(div);
    });
}

document.addEventListener("DOMContentLoaded", () => {

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

    // LÓGICA DE FILTROS POR PARTE
    const botonesFiltro = document.querySelectorAll(".btn-filtro-parte");
    if (botonesFiltro.length > 0) {
        botonesFiltro.forEach(boton => {
            boton.addEventListener("click", function () {
                // quitar clase activo a todos
                botonesFiltro.forEach(b => b.classList.remove("activo"));
                // poner clase activo al clickeado
                this.classList.add("activo");

                const parte = this.getAttribute("data-parte");

                if (parte === "todas") {
                    mostrarStands(todosLosStands);
                } else {
                    const standsFiltrados = todosLosStands.filter(stand =>
                        stand.aparicion && stand.aparicion.includes(parte)
                    );
                    mostrarStands(standsFiltrados);
                }
            });
        });
    }

    activarBarraBusqueda();

    const btnRandom = document.getElementById("btn-random");

    if (btnRandom) {
        btnRandom.addEventListener("click", function () {

            const audioFlecha = document.getElementById("audio-flecha-stand");
            audioFlecha.play();

            // ANIMACION
            const overlay = document.getElementById("animacion-overlay");
            const brillo = document.querySelector(".pantalla-brillo");
            const flecha = document.getElementById("flecha-animacion");

            if (overlay && brillo && flecha) {
                overlay.classList.remove("oculto");
                brillo.classList.add("animar-brillo");
                flecha.classList.add("animar-flecha");
            }

            fetch(ENDPOINT_STANDS)
                .then(res => res.json())
                .then(datos => {
                    let indice = Math.floor(Math.random() * datos.length);
                    let standRandom = datos[indice];
                    const isRoot = !window.location.pathname.includes("/pages/");
                    const urlDestino = isRoot
                        ? "pages/stand.html?id=" + standRandom.id
                        : "stand.html?id=" + standRandom.id;

                    // esperamos a que acabe la animación antes de redirigir
                    if (overlay) {
                        setTimeout(() => {
                            window.location.href = urlDestino;
                        }, 4500);
                    } else {
                        window.location.href = urlDestino;
                    }
                })
                .catch(error => {
                    console.log("Error al cargar stand random:", error);
                });
        });
    }

    // LÓGICA DE INSERCIÓN DE STANDS
    const formInsertarStand = document.getElementById("form-insertar-stand");
    const inputBuscarPortador = document.getElementById("buscar-portador");
    const resultadosPortador = document.getElementById("resultados-portador");
    const idPortadorInput = document.getElementById("id_portador");

    if (inputBuscarPortador) {
        inputBuscarPortador.addEventListener("input", function () {
            let texto = inputBuscarPortador.value.trim();
            if (texto.length > 0) {
                fetch("http://localhost:3000/buscar/portador?q=" + encodeURIComponent(texto))
                    .then(res => res.json())
                    .then(datos => {
                        resultadosPortador.innerHTML = "";
                        let limitados = datos.slice(0, 5);
                        if (limitados.length) {
                            resultadosPortador.classList.remove("oculto");
                        } else {
                            resultadosPortador.classList.add("oculto");
                        }

                        limitados.forEach(portador => {
                            let div = document.createElement("div");
                            div.className = "resultado-portador-item";
                            div.textContent = portador.nombre;

                            div.addEventListener("click", function () {
                                inputBuscarPortador.value = portador.nombre;
                                idPortadorInput.value = portador.id;
                                resultadosPortador.classList.add("oculto");
                            });

                            resultadosPortador.appendChild(div);
                        });
                    })
                    .catch(error => console.error("Error al buscar portador:", error));
            } else {
                resultadosPortador.classList.add("oculto");
            }
        });

        // cerrar si se hace click fuera
        document.addEventListener("click", function (e) {
            if (!inputBuscarPortador.contains(e.target) && !resultadosPortador.contains(e.target)) {
                resultadosPortador.classList.add("oculto");
            }
        });
    }

    if (formInsertarStand) {
        formInsertarStand.addEventListener("submit", function (e) {
            e.preventDefault();

            // coger valores del formulario
            const formData = new FormData(formInsertarStand);
            const data = Object.fromEntries(formData.entries());

            // si no hay evo, mandarlo como null
            if (!data.id_evolucion || data.id_evolucion.trim() === "") {
                data.id_evolucion = null;
            }

            // si no hay portador, eliminarlo
            if (!data.id_portador || data.id_portador.trim() === "") {
                delete data.id_portador;
            }

            // hacer la petición POST
            fetch(ENDPOINT_STANDS, {
                method: "POST",
                headers: {
                    "Content-Type": "application/json"
                },
                body: JSON.stringify(data)
            })
                .then(response => {
                    if (!response.ok) {
                        throw new Error("Error en la inserción");
                    }
                    return response.json();
                })
                .then(result => {
                    const mensajeDiv = document.getElementById("mensaje-resultado");
                    mensajeDiv.className = "mensaje-exito";
                    mensajeDiv.textContent = result.mensaje || "Stand insertado correctamente.";
                    formInsertarStand.reset(); // limpiar el formulario

                    // quitar el mensaje después de 3 segundos
                    setTimeout(() => {
                        mensajeDiv.textContent = "";
                        mensajeDiv.className = "";
                    }, 3000);
                })
                .catch(error => {
                    console.error("Error al insertar el stand:", error);
                    const mensajeDiv = document.getElementById("mensaje-resultado");
                    mensajeDiv.className = "mensaje-error";
                    mensajeDiv.textContent = "Error al intentar insertar el stand.";
                });
        });
    }

});