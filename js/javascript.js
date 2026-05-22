const ENDPOINT_STANDS = "http://localhost:3000/stand";
const ENDPOINT_PORTADORES = "http://localhost:3000/portador";
const ENDPOINT_BUSQUEDA = "http://localhost:3000/buscar/stand?q=";
const ENDPOINT_STAND_PORTADOR_EVOLUCION = "http://localhost:3000/stand/portador/evolucion";
const ENDPOINT_ITUNES = "https://itunes.apple.com/search?limit=1&entity=musicTrack&term=";

// guardamos los stands por aqui pa filtrarlos luego si hace falta
let todosLosStands = [];

/**
 * @brief Funcion para pillar todos los stands de la api de golpe (A)
 * @details Hace un fetch para sacar todos los stands y luego llama a mostrarStands para renderizarlos.
 * @return {void}
 */
function cargarStands() {
    fetch(ENDPOINT_STANDS)
        .then(res => res.json())
        .then(datos => {
            todosLosStands = datos; // guardamos en la var global
            mostrarStands(datos); // ponemos las cartitas
        })
        .catch(error => console.error("error sacando los stands:", error));
}

/**
 * @brief Poner las cartas de los stands en el menu principal (A)
 * @details Recorre los datos y crea una cartita por cada stand para ponerla en el div principal.
 * @param {Array} datos Los stands que vamos a mostrar.
 * @return {void}
 */
function mostrarStands(datos) {
    try {
        const principal = document.getElementById("principal-container");

        // limpiamos el container por si habia algo de antes, pq si no se duplican
        if (principal) {
            principal.innerHTML = '';
        } else {
            console.error("no está el container principal");
            return;
        }

        // recorrer los datos y crear una carta x stand
        datos.forEach(stand => {

            // crear div de la carta con su id y cursor pointer para que se vea clickeable
            const card = document.createElement("div");
            card.className = "card-stand";
            card.id = `card-stand-${stand.id}`;

            // pillamos la img del manga (o nada si no hay)
            const img = document.createElement("img");
            img.src = stand.imagen_manga || "";
            img.alt = stand.nombre || "img no disp";

            const titulo = document.createElement("h3");
            titulo.textContent = stand.nombre;

            // metemos img y titulo en la carta
            card.appendChild(img);
            card.appendChild(titulo);

            // click para ir a la pag de detalles
            card.addEventListener('click', () => {
                // miramos si estamos en la raiz o en /pages/
                const isRoot = !window.location.pathname.includes('/pages/');
                window.location.href = isRoot ? `pages/stand.html?id=${stand.id}` : `stand.html?id=${stand.id}`;
            });

            // añadir la carta al dom al final
            principal.appendChild(card);
        });
    } catch (e) {
        console.error("petao al mostrar los stands: ", e);
    }
}

/**
 * @brief Pilla los detalles de un stand y los pone en stand.html (H)
 * @details Busca el stand por id y le mete toda su info, imagen y stats al html para que se vea bien.
 * @param {number|string} id El id del stand que queremos ver.
 * @return {void}
 */
function cargarDetallesStand(id) {
    fetch(ENDPOINT_STAND_PORTADOR_EVOLUCION)
        .then(res => res.json())
        .then(datos => {
            try {
                const container = document.getElementById("stand-details-container");
                if (!container) return; // si no hay container, vuelve

                // buscamos el stand concreto por id
                const stand = datos.find(s => s.id == id);

                if (!stand) {
                    container.innerHTML = "<h2>Stand no encontrado.</h2>";
                    return;
                }

                container.innerHTML = ''; // clear por si acaso

                // maquetacion del layout de detalles
                const layoutDiv = document.createElement("div");
                layoutDiv.className = "stand-detalles-layout";

                const imgWrapper = document.createElement("div");
                imgWrapper.className = "stand-imagen-wrapper";

                const img = document.createElement("img");
                img.src = stand.imagen_manga || stand.imagen_anime || "";
                img.alt = stand.nombre || "Imágen no disponible.";

                // botones pa alternar img entre manga y anime
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
                        alert("No hay imágen de anime para este stand :(");
                    }
                };

                divBotonesImg.appendChild(btnManga);
                divBotonesImg.appendChild(btnAnime);

                imgWrapper.appendChild(divBotonesImg);
                imgWrapper.appendChild(img);

                // boton para borrar stand
                let btnBorrar = document.createElement("button");
                btnBorrar.textContent = "borrar stand";
                btnBorrar.className = "btn-borrar";

                btnBorrar.addEventListener("click", function () {
                    let urlBorrar = "http://localhost:3000/stand/" + stand.id;

                    fetch(urlBorrar, {
                        method: "DELETE" // borrar
                    })
                        .then(function (res) {
                            return res.json();
                        })
                        .then(function () {
                            alert("Stand borrado");

                            // redirigimos al index porque ya no hay stand
                            if (window.location.pathname.includes("/pages/")) {
                                window.location.href = "../index.html";
                            } else {
                                window.location.href = "index.html";
                            }
                        })
                        .catch(function (error) {
                            console.error("Error borrando el stand:", error);
                        });
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
                aparicion.textContent = "Aparición: " + (stand.aparicion || "No disponible.");

                // portadores
                const portador = document.createElement("p");
                portador.className = "desc";
                portador.textContent = "Portador/es: ";

                if (stand.portadores) {
                    // si hay, separamos por coma y espacio
                    let listaPortadores = stand.portadores.split(", ");

                    listaPortadores.forEach(function (item, index) {
                        // formato "id:nombre"
                        let partesPortador = item.split(":");

                        let idPortador = partesPortador[0];
                        let nombrePortador = partesPortador[1];

                        let enlace = document.createElement("span");
                        enlace.textContent = nombrePortador;
                        enlace.className = "enlace-interactivo";

                        enlace.addEventListener("click", function () {
                            // click para cargar los detalles
                            cargarDetallesPortador(idPortador);
                        });

                        portador.appendChild(enlace);

                        // poner coma si no es el ultimo
                        if (index < listaPortadores.length - 1) {
                            portador.appendChild(document.createTextNode(", "));
                        }
                    });

                } else {
                    portador.appendChild(document.createTextNode("No hay portador."));
                }

                // evolucion
                const evolucion = document.createElement("p");
                evolucion.className = "desc";
                evolucion.textContent = "Evolución: ";

                if (stand.evolucion) {
                    let enlaceEvolucion = document.createElement("span");

                    enlaceEvolucion.textContent = stand.evolucion;
                    enlaceEvolucion.className = "enlace-interactivo";

                    enlaceEvolucion.addEventListener("click", function () {
                        // click para pillar los detalles del stand evo
                        cargarDetallesStand(stand.id_evolucion_real);
                    });

                    evolucion.appendChild(enlaceEvolucion);
                } else {
                    evolucion.appendChild(document.createTextNode("No tiene evolución."));
                }

                // stats grid
                const statsGrid = document.createElement("div");
                statsGrid.className = "stats-grid";

                // crear caja de stats
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

                // ponemos las stats
                statsGrid.appendChild(crearStatBox("Poder", stand.poder));
                statsGrid.appendChild(crearStatBox("Velocidad", stand.velocidad));
                statsGrid.appendChild(crearStatBox("Alcance", stand.alcance));
                statsGrid.appendChild(crearStatBox("Durabilidad", stand.durabilidad));
                statsGrid.appendChild(crearStatBox("Precisión", stand.precis));
                statsGrid.appendChild(crearStatBox("Potencial", stand.potencial));

                infoWrapper.appendChild(titulo);
                infoWrapper.appendChild(desc);

                // si hay referencia musical en la base de datos, la buscamos en la API
                if (stand.referencia_musical) {
                    const musicaDiv = document.createElement("div");
                    musicaDiv.className = "musica-container";

                    infoWrapper.appendChild(musicaDiv);

                    let urlBusqueda = ENDPOINT_ITUNES + stand.referencia_musical;

                    // fetch de la API
                    fetch(urlBusqueda)
                        .then(function (respuesta) { return respuesta.json(); })
                        .then(function (datos) {
                            if (datos.results.length > 0) {
                                let cancion = datos.results[0];

                                // container para que se vea bonito
                                const reproductorContenedor = document.createElement("div");
                                reproductorContenedor.className = "reproductor-bonito";

                                // ponemos la foto del disco
                                if (cancion.artworkUrl100) {
                                    const imagenAlbum = document.createElement("img");
                                    imagenAlbum.src = cancion.artworkUrl100.replace("100x100bb", "200x200bb");
                                    reproductorContenedor.appendChild(imagenAlbum);
                                }

                                // container para el audio y el texto
                                const controlesMusica = document.createElement("div");
                                controlesMusica.className = "controles-musica";

                                const audioInfo = document.createElement("p");
                                audioInfo.textContent = cancion.trackName + " - " + cancion.artistName;
                                audioInfo.className = "audio-info";
                                controlesMusica.appendChild(audioInfo);

                                let reproductor = document.createElement("audio");
                                reproductor.controls = true;
                                reproductor.src = cancion.previewUrl;
                                reproductor.volume = 0.075; // 7.5 de volumen pq suena muy alto, modificar luego si eso
                                reproductor.className = "reproductor-audio";
                                reproductor.autoplay = true; // empieza a sonar solo

                                controlesMusica.appendChild(reproductor);
                                reproductorContenedor.appendChild(controlesMusica);

                                musicaDiv.appendChild(reproductorContenedor);
                            }
                        })
                        .catch(function (error) {
                            console.log("Error cargando música:", error);
                        });
                }

                infoWrapper.appendChild(aparicion);
                infoWrapper.appendChild(portador);
                infoWrapper.appendChild(evolucion);

                imgWrapper.appendChild(statsGrid);

                layoutDiv.appendChild(imgWrapper);
                layoutDiv.appendChild(infoWrapper);

                // boton de editar
                let btnEditar = document.createElement("button");
                btnEditar.textContent = "Editar";
                btnEditar.className = "btn-editar";
                btnEditar.addEventListener("click", function () {
                    mostrarFormularioEdicion(stand, layoutDiv, id);
                });
                layoutDiv.appendChild(btnEditar);

                container.appendChild(layoutDiv);
            } catch (e) {
                console.error("Error al cargar los detalles del stand:", e);
            }
        })
        .catch(error => {
            console.error("Error cargando detalles del stand:", error);
            const container = document.getElementById("stand-details-container");
            if (container) {
                container.innerHTML = "<h2>Error cargando la info del stand</h2>";
            }
        });
}

/**
 * @brief Cargar los detalles del portador (lo mismo que los stands) (H)
 * @details Saca al portador por su id y le hace su layout con su foto y descripciones.
 * @param {number|string} id El id del portador.
 * @return {void}
 */
function cargarDetallesPortador(id) {
    fetch(ENDPOINT_PORTADORES)
        .then(res => res.json())
        .then(datos => {
            try {
                const container = document.getElementById("stand-details-container");
                if (!container) return;

                // pilla al portador por id
                const portador = datos.find(p => p.id == id);

                if (!portador) {
                    container.innerHTML = "<h2>portador no encontrado</h2>";
                    return;
                }

                container.innerHTML = ''; // clear de nuevo

                const layoutDiv = document.createElement("div");
                layoutDiv.className = "stand-detalles-layout";

                const imgWrapper = document.createElement("div");
                imgWrapper.className = "stand-imagen-wrapper";

                const img = document.createElement("img");
                img.src = portador.imagen_manga || portador.imagen_anime || "";
                img.alt = portador.nombre || "img no disp";

                // botones pa cambiar la img del portador
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
                        alert("no hay img de anime pa este bro.");
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
                desc.textContent = portador.descripcion || "desc no disponible bro.";

                const aparicion = document.createElement("p");
                aparicion.className = "desc";
                aparicion.textContent = "aparición: " + (portador.aparicion || "ni idea");

                infoWrapper.appendChild(titulo);
                infoWrapper.appendChild(desc);
                infoWrapper.appendChild(aparicion);

                layoutDiv.appendChild(imgWrapper);
                layoutDiv.appendChild(infoWrapper);

                container.appendChild(layoutDiv);
            } catch (e) {
                console.error("error pintando al portador:", e);
            }
        })
        .catch(error => {
            console.error("Error al cargar detalles del portador:", error);
            const container = document.getElementById("stand-details-container");
            if (container) {
                container.innerHTML = "<h2>Error al cargar la info del portador</h2>";
            }
        });
}

/**
 * @brief Form de edicion (A)
 * @details monta el formulario entero con los inputs para cambiar cositas del stand y hacerle un put luego.
 * @param {Object} stand El stand a editar.
 * @param {HTMLElement} container El div donde metemos el form.
 * @param {number|string} id El id del stand.
 * @return {void}
 */
function mostrarFormularioEdicion(stand, container, id) {
    try {
        container.innerHTML = '';

        const form = document.createElement('form');
        form.className = 'form-container form-edicion-ancho';

        const tituloForm = document.createElement('h2');
        tituloForm.textContent = 'Editar stand';
        tituloForm.className = 'titulo-formulario';
        form.appendChild(tituloForm);

        const camposGrid = document.createElement('div');
        camposGrid.className = 'campos-grid-form';

        // campos para editar
        const crearCampoForm = (etiqueta, tipo, nombre, valor) => {
            const div = document.createElement('div');
            div.className = 'form-group';

            const label = document.createElement('label');
            label.textContent = etiqueta;

            const input = document.createElement('input');
            input.type = tipo;
            input.name = nombre;
            input.value = valor || '';

            div.appendChild(label);
            div.appendChild(input);
            return div;
        };

        // desc
        const grupoDescripcion = document.createElement('div');
        grupoDescripcion.className = 'form-group columna-completa';
        const labelDesc = document.createElement('label');
        labelDesc.textContent = 'Descripción';
        const txtDesc = document.createElement('textarea');
        txtDesc.name = 'descripcion';
        txtDesc.rows = 4;
        txtDesc.value = stand.descripcion || '';
        grupoDescripcion.appendChild(labelDesc);
        grupoDescripcion.appendChild(txtDesc);
        camposGrid.appendChild(grupoDescripcion);

        // campos principales
        camposGrid.appendChild(crearCampoForm('Nombre', 'text', 'nombre', stand.nombre));
        camposGrid.appendChild(crearCampoForm('Aparición', 'text', 'aparicion', stand.aparicion));
        camposGrid.appendChild(crearCampoForm('URL imágen manga', 'text', 'imagen_manga', stand.imagen_manga));
        camposGrid.appendChild(crearCampoForm('URL imágen anime', 'text', 'imagen_anime', stand.imagen_anime));
        camposGrid.appendChild(crearCampoForm('Referencia musical', 'text', 'referencia_musical', stand.referencia_musical));
        camposGrid.appendChild(crearCampoForm('ID Evolución', 'number', 'id_evolucion', stand.id_evolucion_real));

        // stats
        const divColumnaCompleta = document.createElement('div');
        divColumnaCompleta.className = 'columna-completa';

        const tituloStats = document.createElement('h3');
        tituloStats.className = 'titulo-estadisticas';
        tituloStats.textContent = 'Estadísticas';
        divColumnaCompleta.appendChild(tituloStats);

        const statsGridForm = document.createElement('div');
        statsGridForm.className = 'stats-grid-form';

        statsGridForm.appendChild(crearCampoForm('Poder', 'text', 'poder', stand.poder));
        statsGridForm.appendChild(crearCampoForm('Velocidad', 'text', 'velocidad', stand.velocidad));
        statsGridForm.appendChild(crearCampoForm('Alcance', 'text', 'alcance', stand.alcance));
        statsGridForm.appendChild(crearCampoForm('Durabilidad', 'text', 'durabilidad', stand.durabilidad));
        statsGridForm.appendChild(crearCampoForm('Precisión', 'text', 'precis', stand.precis));
        statsGridForm.appendChild(crearCampoForm('Potencial', 'text', 'potencial', stand.potencial));

        divColumnaCompleta.appendChild(statsGridForm);
        camposGrid.appendChild(divColumnaCompleta);

        form.appendChild(camposGrid);

        // div pa los msg de error o exito
        const divMensaje = document.createElement('div');
        divMensaje.id = 'mensaje-edicion';
        divMensaje.className = 'mensaje-edicion-form';
        form.appendChild(divMensaje);

        const btnBotones = document.createElement('div');
        btnBotones.className = 'botones-formulario';

        const btnGuardar = document.createElement('button');
        btnGuardar.type = 'submit';
        btnGuardar.className = 'btn-submit';
        btnGuardar.textContent = 'guardar cambios';
        btnBotones.appendChild(btnGuardar);

        const btnCancelar = document.createElement('button');
        btnCancelar.type = 'button';
        btnCancelar.className = 'btn-borrar btn-sin-margen';
        btnCancelar.textContent = 'cancelar';
        btnCancelar.onclick = () => cargarDetallesStand(id);
        btnBotones.appendChild(btnCancelar);

        form.appendChild(btnBotones);

        // al hacer submit
        form.onsubmit = function (e) {
            e.preventDefault();
            const formData = new FormData(form);
            const data = Object.fromEntries(formData.entries());

            // si la evo esta vacia la pasamos a null
            if (!data.id_evolucion || data.id_evolucion.trim() === "") {
                data.id_evolucion = null;
            }

            // fetch put pa actualizar
            fetch(`http://localhost:3000/stand/${id}`, {
                method: "PUT",
                headers: {
                    "Content-Type": "application/json"
                },
                body: JSON.stringify(data)
            })
                .then(res => res.json())
                .then(result => {
                    if (result.error) throw new Error(result.error.sqlMessage || "Error al editar el stand");
                    divMensaje.textContent = "Stand guardado!";
                    divMensaje.className = "mensaje-exito";
                    setTimeout(() => {
                        cargarDetallesStand(id); // recargamos pa ver los cambios
                    }, 1000);
                })
                .catch(error => {
                    console.error("Error editando el stand:", error);
                    divMensaje.textContent = "Error editando el stand.";
                    divMensaje.className = "mensaje-error";
                });
        };

        container.appendChild(form);
    } catch (e) {
        console.error("falla el form de edicion:", e);
    }
}

/**
 * @brief Barra de busqueda (H)
 * @details Le mete el listener al input para buscar en tiempo real y ocultar los resultados si clicas fuera.
 * @return {void}
 */
function activarBarraBusqueda() {
    try {
        const inputBusqueda = document.getElementById("input-busqueda");
        const resultadosBusqueda = document.getElementById("resultados-busqueda");

        if (inputBusqueda) {
            // busca cada vez que escribes
            inputBusqueda.addEventListener("input", function () {
                let texto = inputBusqueda.value.trim();

                if (texto.length > 0) {
                    buscarContenido(texto); // busca el txt
                } else {
                    if (resultadosBusqueda) {
                        resultadosBusqueda.innerHTML = "";
                        resultadosBusqueda.classList.add("oculto"); // lo esconde si esta vacio
                    }
                }
            });
        }

        // esconder resultados si clicas fuera
        document.addEventListener("click", function (evento) {
            let cajaBusqueda = document.querySelector(".cuadro-busqueda");

            if (cajaBusqueda && !cajaBusqueda.contains(evento.target)) {
                if (resultadosBusqueda) {
                    resultadosBusqueda.classList.add("oculto");
                }
            }
        });
    } catch (e) {
        console.error("error activando barra de busqueda:", e);
    }
}

/**
 * @brief Busqueda (H)
 * @details Hace el fetch al server pa buscar stands que coincidan con el texto.
 * @param {string} texto Lo que ha escrito el usuario.
 * @return {void}
 */
function buscarContenido(texto) {
    fetch(ENDPOINT_BUSQUEDA + encodeURIComponent(texto))
        .then(function (respuesta) { return respuesta.json(); })
        .then(function (datos) {
            mostrarResultadosBusqueda(datos);
        })
        .catch(function (error) {
            console.log("Error en la búsqueda:", error);
        });
}

/**
 * @brief Ponemos lo que devuelve la busqueda (H)
 * @details Pilla el div de resultados y le mete divs pequeñitos con los nombres de los stands que salgan.
 * @param {Array} resultados Los stands que han salido.
 * @return {void}
 */
function mostrarResultadosBusqueda(resultados) {
    try {
        const resultadosBusqueda = document.getElementById("resultados-busqueda");
        if (!resultadosBusqueda) return;

        resultadosBusqueda.innerHTML = "";

        // cortamos a 5 resultados para que no pete visualmente
        let resultadosValidos = resultados.slice(0, 5);

        if (resultadosValidos.length) {
            resultadosBusqueda.classList.remove("oculto");
        } else {
            resultadosBusqueda.classList.add("oculto");
        }

        // ponemos los divs
        resultadosValidos.forEach(function (stand) {
            let div = document.createElement("div");
            div.classList.add("resultado-item");
            div.textContent = stand.nombre;

            // click pa ir al stand
            div.addEventListener("click", function () {
                const isRoot = !window.location.pathname.includes("/pages/");
                window.location.href = isRoot
                    ? "pages/stand.html?id=" + stand.id
                    : "stand.html?id=" + stand.id;
            });

            resultadosBusqueda.appendChild(div);
        });
    } catch (e) {
        console.error("error pintando los resultados de busqueda:", e);
    }
}

// cuando cargue todo el dom metemos los event listeners
document.addEventListener("DOMContentLoaded", () => {

    const urlParams = new URLSearchParams(window.location.search);
    const standId = urlParams.get('id');

    if (standId) {
        // si estamos en stand.html y pasamos id en la url, cargamos el stand
        cargarDetallesStand(standId);
    } else {
        // si estamos en index.html cargamos todos los stands
        const principal = document.getElementById("principal-container");
        if (principal) {
            cargarStands();
        }
    }

    // LOGICA DE FILTROS POR PARTE
    const botonesFiltro = document.querySelectorAll(".btn-filtro-parte");
    if (botonesFiltro.length > 0) {
        botonesFiltro.forEach(boton => {
            boton.addEventListener("click", function () {
                // quitamos la clase activo a los demas botones
                botonesFiltro.forEach(b => b.classList.remove("activo"));
                // y se la enchufamos al q acabamos de clickar
                this.classList.add("activo");

                const parte = this.getAttribute("data-parte");

                if (parte === "todas") {
                    mostrarStands(todosLosStands); // mostramos todo
                } else {
                    // filtramos los q tengan ese num de parte
                    const standsFiltrados = todosLosStands.filter(stand =>
                        stand.aparicion && stand.aparicion.includes(parte)
                    );
                    mostrarStands(standsFiltrados);
                }
            });
        });
    }

    activarBarraBusqueda();

    // boton stand random (H: Funcionalidad, A: Animación)
    const btnRandom = document.getElementById("btn-random");
    if (btnRandom) {
        btnRandom.addEventListener("click", function () {

            // sonido
            const audioFlecha = document.getElementById("audio-flecha-stand");
            audioFlecha.play();

            // animacion de la flecha
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
                    // pillamos uno al azar del array
                    let indice = Math.floor(Math.random() * datos.length);
                    let standRandom = datos[indice];
                    const isRoot = !window.location.pathname.includes("/pages/");
                    const urlDestino = isRoot
                        ? "pages/stand.html?id=" + standRandom.id
                        : "stand.html?id=" + standRandom.id;

                    // esperamos a q acabe la animacion (4.5s) antes de ir a la pag
                    if (overlay) {
                        setTimeout(() => {
                            window.location.href = urlDestino;
                        }, 4500);
                    } else {
                        window.location.href = urlDestino;
                    }
                })
                .catch(error => {
                    console.log("Error al cargar un stand random:", error);
                });
        });
    }

    // LOGICA PA METER STANDS NUEVOS
    const formInsertarStand = document.getElementById("form-insertar-stand");
    const inputBuscarPortador = document.getElementById("buscar-portador");
    const resultadosPortador = document.getElementById("resultados-portador");
    const idPortadorInput = document.getElementById("id_portador");

    //(A)
    if (inputBuscarPortador) {
        // busca mientras escribes
        inputBuscarPortador.addEventListener("input", function () {
            let texto = inputBuscarPortador.value.trim();
            if (texto.length > 0) {
                fetch("http://localhost:3000/buscar/portador?q=" + encodeURIComponent(texto))
                    .then(res => res.json())
                    .then(datos => {
                        resultadosPortador.innerHTML = "";
                        let limitados = datos.slice(0, 5); // solo 5 max
                        if (limitados.length) {
                            resultadosPortador.classList.remove("oculto");
                        } else {
                            resultadosPortador.classList.add("oculto");
                        }

                        limitados.forEach(portador => {
                            let div = document.createElement("div");
                            div.className = "resultado-portador-item";
                            div.textContent = portador.nombre;

                            // al hacer clic en un portador, lo seleccionamos
                            div.addEventListener("click", function () {
                                inputBuscarPortador.value = portador.nombre;
                                idPortadorInput.value = portador.id;
                                resultadosPortador.classList.add("oculto");
                            });

                            resultadosPortador.appendChild(div);
                        });
                    })
                    .catch(error => console.error("Error buscando al portador:", error));
            } else {
                resultadosPortador.classList.add("oculto");
            }
        });

        // si clicas fuera, cerramos el menu este
        document.addEventListener("click", function (e) {
            if (!inputBuscarPortador.contains(e.target) && !resultadosPortador.contains(e.target)) {
                resultadosPortador.classList.add("oculto");
            }
        });
    }

    //(A)
    if (formInsertarStand) {
        formInsertarStand.addEventListener("submit", function (e) {
            e.preventDefault();

            // pillamos los datos del user
            const formData = new FormData(formInsertarStand);
            const data = Object.fromEntries(formData.entries());

            // si no puso evo, a null
            if (!data.id_evolucion || data.id_evolucion.trim() === "") {
                data.id_evolucion = null;
            }

            // si no puso portador, lo quitamos del obj para q no haya errores
            if (!data.id_portador || data.id_portador.trim() === "") {
                delete data.id_portador;
            }

            // ref musical a null si no hay
            if (!data.referencia_musical || data.referencia_musical.trim() === "") {
                data.referencia_musical = null;
            }

            // metemos el stand a la db con un post
            fetch(ENDPOINT_STANDS, {
                method: "POST",
                headers: {
                    "Content-Type": "application/json"
                },
                body: JSON.stringify(data)
            })
                .then(response => {
                    if (!response.ok) {
                        throw new Error("Error al insertar");
                    }
                    return response.json();
                })
                .then(result => {
                    const mensajeDiv = document.getElementById("mensaje-resultado");
                    mensajeDiv.className = "mensaje-exito";
                    mensajeDiv.textContent = result.mensaje || "Stand insertado.";
                    formInsertarStand.reset(); // limpiamos el form

                    // quitamos el txt en 3 seg pa q no moleste
                    setTimeout(() => {
                        mensajeDiv.textContent = "";
                        mensajeDiv.className = "";
                    }, 3000);
                })
                .catch(error => {
                    console.error("Error al meter el stand:", error);
                    const mensajeDiv = document.getElementById("mensaje-resultado");
                    mensajeDiv.className = "mensaje-error";
                    mensajeDiv.textContent = "Error intentando meter el stand en la BD.";
                });
        });
    }

});