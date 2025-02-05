using Cine.Api.DTO.Funcion;
using Cine.Api.Models;

namespace Cine.Api.Data
{
    public class DataContext : DbContext
    {
        public DataContext()
        {
        }

        public DataContext(DbContextOptions<DataContext> options)
            : base(options)
        {
        }
        public DbSet<Pelicula> Pelicula { get; set; }
        public DbSet<VwFuncion> VwFuncion { get; set; }
        public DbSet<VwFuncionesPorPelicula> VwFuncionesPorPelicula { get; set; }
        public DbSet<Genero> Genero { get; set; }
        public DbSet<Sala> Sala { get; set; }
    }
}
