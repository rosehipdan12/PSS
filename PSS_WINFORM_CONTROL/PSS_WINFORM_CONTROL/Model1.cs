namespace PSS_WINFORM_CONTROL
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class Model1 : DbContext
    {
        public Model1()
            : base("name=Model1")
        {
        }

        public virtual DbSet<category> categories { get; set; }
        public virtual DbSet<item> items { get; set; }
        public virtual DbSet<order> orders { get; set; }
        public virtual DbSet<pet> pets { get; set; }
        public virtual DbSet<role> roles { get; set; }
        public virtual DbSet<species> species { get; set; }
        public virtual DbSet<supplier> suppliers { get; set; }
        public virtual DbSet<sysdiagram> sysdiagrams { get; set; }
        public virtual DbSet<user> users { get; set; }
        public virtual DbSet<order_product> order_product { get; set; }
        public virtual DbSet<order_user> order_user { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<category>()
                .Property(e => e.description)
                .IsUnicode(false);

            modelBuilder.Entity<category>()
                .HasMany(e => e.category1)
                .WithOptional(e => e.category2)
                .HasForeignKey(e => e.parent_id);

            modelBuilder.Entity<category>()
                .HasMany(e => e.items)
                .WithRequired(e => e.category)
                .HasForeignKey(e => e.category_id)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<item>()
                .Property(e => e.detail)
                .IsUnicode(false);

            modelBuilder.Entity<item>()
                .HasMany(e => e.order_product)
                .WithOptional(e => e.item)
                .HasForeignKey(e => e.item_id);

            modelBuilder.Entity<order>()
                .HasMany(e => e.order_product)
                .WithOptional(e => e.order)
                .HasForeignKey(e => e.order_id);

            modelBuilder.Entity<order>()
                .HasMany(e => e.order_user)
                .WithRequired(e => e.order)
                .HasForeignKey(e => e.order_id)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<pet>()
                .Property(e => e.description)
                .IsUnicode(false);

            modelBuilder.Entity<pet>()
                .HasMany(e => e.order_product)
                .WithOptional(e => e.pet)
                .HasForeignKey(e => e.pet_id);

            modelBuilder.Entity<role>()
                .HasMany(e => e.users)
                .WithOptional(e => e.role)
                .HasForeignKey(e => e.role_id);

            modelBuilder.Entity<species>()
                .Property(e => e.description)
                .IsUnicode(false);

            modelBuilder.Entity<species>()
                .HasMany(e => e.pets)
                .WithRequired(e => e.species)
                .HasForeignKey(e => e.species_id)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<supplier>()
                .Property(e => e.description)
                .IsUnicode(false);

            modelBuilder.Entity<supplier>()
                .HasMany(e => e.items)
                .WithRequired(e => e.supplier)
                .HasForeignKey(e => e.supplier_id)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<user>()
                .HasMany(e => e.order_user)
                .WithRequired(e => e.user)
                .HasForeignKey(e => e.user_id)
                .WillCascadeOnDelete(false);
        }
    }
}
