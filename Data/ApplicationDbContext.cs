using Microsoft.EntityFrameworkCore;
using DotnetApiDocker.Models;

namespace DotnetApiDocker.Data;

public class ApplicationDbContext : DbContext
{
    public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options)
        : base(options)
    {
    }

    public DbSet<Product> Products { get; set; }
}
