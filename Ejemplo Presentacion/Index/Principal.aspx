<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>API de Productos</title>
</head>
<body>
    <h1>API de Productos</h1>

    <h2>Lista de Productos</h2>
    <ul id="listaProductos"></ul>

    <h2>Agregar Producto</h2>
    <form id="formAgregar">
        <label for="nombre">Nombre:</label>
        <input type="text" id="nombre" required>
        <label for="precio">Precio:</label>
        <input type="number" id="precio" step="0.01" required>
        <button type="submit">Agregar Producto</button>
    </form>

    <script>
        // Función para cargar la lista de productos
        function cargarProductos() {
            fetch('/api/Productos')
                .then(response => response.json())
                .then(data => {
                    const listaProductos = document.getElementById('listaProductos');
                    listaProductos.innerHTML = '';
                    data.forEach(producto => {
                        const li = document.createElement('li');
                        li.textContent = `ID: ${producto.Id}, Nombre: ${producto.Nombre}, Precio: ${producto.Precio}`;
                        listaProductos.appendChild(li);
                    });
                });
        }

        // Función para agregar un producto
        function agregarProducto(event) {
            event.preventDefault();
            const nombre = document.getElementById('nombre').value;
            const precio = parseFloat(document.getElementById('precio').value);

            const nuevoProducto = {
                Nombre: nombre,
                Precio: precio
            };

            fetch('/api/Productos', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify(nuevoProducto)
            })
                .then(response => response.json())
                .then(data => {
                    console.log('Producto agregado:', data);
                    cargarProductos();
                    document.getElementById('nombre').value = '';
                    document.getElementById('precio').value = '';
                })
                .catch(error => {
                    console.error('Error al agregar producto:', error);
                });
        }

        // Cargar la lista de productos al cargar la página
        document.addEventListener('DOMContentLoaded', () => {
            cargarProductos();
            document.getElementById('formAgregar').addEventListener('submit', agregarProducto);
        });
        // Función para generar la lista de productos ingresados
        function generarListaProductosIngresados() {
            fetch('/api/Productos')
                .then(response => response.json())
                .then(data => {
                    const listaProductos = document.getElementById('listaProductosIngresados');
                    listaProductos.innerHTML = '';
                    data.forEach(producto => {
                        const li = document.createElement('li');
                        li.textContent = `ID: ${producto.Id}, Nombre: ${producto.Nombre}, Precio: ${producto.Precio}`;
                        listaProductos.appendChild(li);
                    });
                })
                .catch(error => {
                    console.error('Error al obtener la lista de productos ingresados:', error);
                });
        }


    </script>
</body>
</html>
