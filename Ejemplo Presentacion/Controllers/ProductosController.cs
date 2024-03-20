using Ejemplo_Presentacion.Ejemplo;
using System.Collections.Generic;
using System.Web.Http;

namespace Ejemplo_Presentacion.Controllers
{
    public class APIProductosController : ApiController
    {
        private static List<Producto> _productos = new List<Producto>
        {
            new Producto { Id = 1, Nombre = "Producto 1", Precio = 10.99m },
            new Producto { Id = 2, Nombre = "Producto 2", Precio = 20.50m },
            new Producto { Id = 3, Nombre = "Producto 3", Precio = 15.75m }
        };

        // GET: api/Productos
        public IEnumerable<Producto> Get()
        {
            return _productos;
        }

        // GET: api/Productos/5
        public IHttpActionResult Get(int id)
        {
            var producto = _productos.Find(p => p.Id == id);
            if (producto == null)
            {
                return NotFound();
            }
            return Ok(producto);
        }

        // POST: api/Productos
        public IHttpActionResult Post([FromBody] Producto producto)
        {
            if (producto == null)
            {
                return BadRequest("El producto no puede ser nulo.");
            }

            producto.Id = _productos.Count + 1; // Asignar un nuevo ID
            _productos.Add(producto);
            return CreatedAtRoute("DefaultApi", new { id = producto.Id }, producto);
        }

        // PUT: api/Productos/5
        public IHttpActionResult Put(int id, [FromBody] Producto producto)
        {
            if (producto == null || id != producto.Id)
            {
                return BadRequest();
            }

            var index = _productos.FindIndex(p => p.Id == id);
            if (index < 0)
            {
                return NotFound();
            }

            _productos[index] = producto;
            return Ok(producto);
        }

        // DELETE: api/Productos/5
        public IHttpActionResult Delete(int id)
        {
            var producto = _productos.Find(p => p.Id == id);
            if (producto == null)
            {
                return NotFound();
            }

            _productos.Remove(producto);
            return Ok(producto);
        }
    }
}