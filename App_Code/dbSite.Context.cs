﻿//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

using System;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;

public partial class criartEntities : DbContext
{
    public criartEntities()
        : base("name=criartEntities")
    {
    }

    protected override void OnModelCreating(DbModelBuilder modelBuilder)
    {
        throw new UnintentionalCodeFirstException();
    }

    public DbSet<produtos> produtos { get; set; }
    public DbSet<tbjuncaoprodutocategoria> tbjuncaoprodutocategoria { get; set; }
    public DbSet<tbprodutofotos> tbprodutofotos { get; set; }
    public DbSet<tbprodutoscategorias> tbprodutoscategorias { get; set; }
}
